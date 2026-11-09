import argparse
import glob
import os
import re
import subprocess
import sys


def extract_let_bindings(content):
    """Robustly extracts #let assignments by tracking block nesting."""
    let_matches = list(re.finditer(r"#let\s+([a-zA-Z0-9_\-]+)\s*=", content))
    results = []

    for i, match in enumerate(let_matches):
        var_name = match.group(1)
        start_index = match.end()
        end_boundary = (
            let_matches[i + 1].start()
            if i + 1 < len(let_matches)
            else len(content)
        )

        body_chars = []
        stack = []
        in_math = False
        started = False

        idx = start_index
        while idx < end_boundary:
            char = content[idx]
            if not started and char.isspace():
                idx += 1
                continue
            started = True
            body_chars.append(char)

            # Handle math blocks ($) toggling
            if char == "$":
                # FIXED: Changed idx > start_index to idx > 0 to perfectly handle tight '=$' syntax
                if idx > 0 and content[idx - 1] != "\\":
                    in_math = not in_math

            # Only track structural brackets when NOT inside a math block ($...$)
            elif not in_math:
                if char in "=[{(":
                    if char == "=" and len(stack) == 0 and len(body_chars) == 1:
                        pass
                    else:
                        stack.append(char)
                elif char in "]} )":
                    if stack:
                        top = stack[-1]
                        if (
                            (char == "]" and top == "[")
                            or (char == "}" and top == "{")
                            or (char == ")" and top == "(")
                        ):
                            stack.pop()

            # We must NOT terminate if we are currently inside a math block
            if not in_math and len(stack) == 0:
                if char in "\n;]" or (
                    idx + 1 < len(content) and content[idx + 1] in "\n;#"
                ):
                    break
            idx += 1

        body = "".join(body_chars).strip()
        if body.endswith(";"):
            body = body[:-1].strip()
        if body:
            results.append((var_name, body))

    return results


def extract_and_inline_formulas(input_files, output_filename="all_formulas.typ"):
    """Parses Typst files using a state-machine parser to extract formulas securely."""
    aggregated_content = [
        "= Master Formula Inventory",
        "This file contains all formulas physically extracted from source documents.\n",
    ]

    found_any = False

    for file_path in input_files:
        if file_path == output_filename or file_path == output_filename.replace(
            ".typ", ".pdf"
        ):
            continue

        if not os.path.exists(file_path):
            print(
                f"Warning: File '{file_path}' not found. Skipping...",
                file=sys.stderr,
            )
            continue

        with open(file_path, "r", encoding="utf-8") as f:
            content = f.read()

        matches = extract_let_bindings(content)

        if matches:
            found_any = True
            aggregated_content.append(f"== From Source: `{file_path}`")

            for var_name, formula_body in matches:
                aggregated_content.extend(
                    [
                        f"=== Variable: `{var_name}`",
                        f"#let {var_name} = {formula_body}",
                        f"Display: #{var_name}",
                        "#v(1em)",
                    ]
                )

    if not found_any:
        print(
            "Notice: No formulas found to extract in the targeted files.",
            file=sys.stderr,
        )
        return

    with open(output_filename, "w", encoding="utf-8") as out_file:
        out_file.write("\n".join(aggregated_content))

    print(f"Generated: '{output_filename}'")

    try:
        subprocess.run(
            ["typst", "compile", output_filename],
            check=True,
            capture_output=True,
        )
        print(f"Compiled: '{output_filename.replace('.typ', '.pdf')}'")

        # Automatically stage the generated outputs so git commit stays clean
        subprocess.run(["git", "add", output_filename], capture_output=True)
        subprocess.run(
            ["git", "add", output_filename.replace(".typ", ".pdf")],
            capture_output=True,
        )

    except subprocess.CalledProcessError as e:
        print(
            f"Typst compilation failed:\n{e.stderr.decode()}", file=sys.stderr
        )
    except FileNotFoundError:
        print(
            "Note: Typst CLI is not installed globally. Generated file only.",
            file=sys.stderr,
        )


def main():
    parser = argparse.ArgumentParser(
        description="Extract and inline Typst formulas from source files into a single master document."
    )
    parser.add_argument(
        "files",
        metavar="FILE",
        type=str,
        nargs="*",
        help="One or more Typst (.typ) source files to scan.",
    )
    parser.add_argument(
        "-o",
        "--output",
        type=str,
        default="all_formulas.typ",
        help="Output Typst filename (default: all_formulas.typ)",
    )

    args = parser.parse_args()

    target_files = args.files
    if not target_files:
        target_files = glob.glob("*.typ")

    extract_and_inline_formulas(target_files, args.output)


if __name__ == "__main__":
    main()
