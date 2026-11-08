import argparse
import os
import re
import subprocess
import sys


def extract_and_inline_formulas(input_files, output_filename="all_formulas.typ"):
    """Parses a list of Typst files to extract '#let var = $...$' equations

    and writes them into a unified, flat Typst file.
    """
    # Regex captures variable name and matching math block ($...$), handles multiline
    formula_pattern = re.compile(
        r"#let\s+([a-zA-Z0-9_-]+)\s*=\s*(\$.*?\$)", re.DOTALL
    )

    aggregated_content = [
        "= Master Formula Inventory",
        "This file contains all formulas physically extracted from source documents.\n",
    ]

    found_any = False

    for file_path in input_files:
        if not os.path.exists(file_path):
            print(
                f"Warning: File '{file_path}' not found. Skipping...",
                file=sys.stderr,
            )
            continue

        with open(file_path, "r", encoding="utf-8") as f:
            content = f.read()

        matches = formula_pattern.findall(content)

        if matches:
            found_any = True
            aggregated_content.append(f"== From Source: `{file_path}`")

            for var_name, formula_body in matches:
                aggregated_content.extend(
                    [
                        f"=== Variable: `{var_name}`",
                        f"#let {var_name} = {formula_body.strip()}",
                        f"Display: #{var_name}",
                        "#v(1em)",
                    ]
                )

    if not found_any:
        print(
            "Error: No formulas found matching the pattern '#let variable = $...$'",
            file=sys.stderr,
        )
        return

    # Write out the physical Typst file
    with open(output_filename, "w", encoding="utf-8") as out_file:
        out_file.write("\n".join(aggregated_content))

    print(f"Generated: '{output_filename}'")

    # Compile the output file to PDF
    try:
        subprocess.run(
            ["typst", "compile", output_filename],
            check=True,
            capture_output=True,
        )
        print(f"Compiled: '{output_filename.replace('.typ', '.pdf')}'")
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
        nargs="+",
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
    extract_and_inline_formulas(args.files, args.output)


if __name__ == "__main__":
    main()
