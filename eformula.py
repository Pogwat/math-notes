import os

def build_automatic_master(target_dir=".", output_file="formulas3.typ"):
    extracted = []
    trigger = '#publish-formula('
    
    # 1. Traverse your entire directory looking for Typst source notes
    for root, dirs, files in os.walk(target_dir):
        for file in files:
            if file.endswith(".typ") and file not in [output_file, "global.typ", "auto_build.py"]:
                file_path = os.path.join(root, file)
                try:
                    with open(file_path, 'r', encoding='utf-8') as f:
                        content = f.read()
                except Exception:
                    continue
                
                # 2. Extract formula macro fields using a bracket deep counter
                start_search = 0
                while True:
                    idx = content.find(trigger, start_search)
                    if idx == -1: 
                        break
                    
                    slice_str = content[idx:]
                    lbl_start = slice_str.find('"') + 1
                    lbl_end = slice_str.find('"', lbl_start)
                    lbl_name = slice_str[lbl_start:lbl_end]
                    
                    op_bracket = slice_str.find('[')
                    if op_bracket == -1: 
                        break
                    
                    math_start = idx + op_bracket + 1
                    bracket_depth = 1
                    end_idx = math_start
                    
                    while bracket_depth > 0 and end_idx < len(content):
                        char = content[end_idx]
                        if char == '[': bracket_depth += 1
                        elif char == ']': bracket_depth -= 1
                        end_idx += 1
                    
                    raw_math = content[math_start:end_idx-1].strip()
                    
                    extracted.append((lbl_name, raw_math, file))
                    start_search = end_idx

    # 3. Assemble the single Typst file composition template dynamically
    output_lines = [
        "// =========================================================================",
        "// 1. THE LAYOUT ENGINES & MACROS",
        "// =========================================================================",
        '#let publish-formula(label-name, body) = { [#metadata(body) #label(label-name)] }',
        '#let quote-published(label-name) = {',
        '  context {',
        '    let matches = query(label(label-name))',
        '    if matches.len() == 0 [ *Error:* Label not found. ] else {',
        '      let item = matches.first()',
        '      block(width: 100%, fill: luma(250), stroke: (left: 3pt + rgb("2196F3")), inset: 12pt, radius: 4pt, breakable: false)[',
        '        #item.value',
        '      ]',
        '    }',
        '  }',
        '}',
        "",
        "// =========================================================================",
        "// 2. THE PHYSICAL FILE COPIES (AUTOMATICALLY GATHERED & HIDDEN VIA ZERO-SPACE PLACE)",
        "// =========================================================================",
        "// We wrap the hidden text inside a zero-sized 'place' container and use 'hide'.",
        "// This forces Typst to register the labels perfectly in memory without creating space or pages.",
        "#place(top + left, dx: 0pt, dy: 0pt)[",
        "  #hide([",
    ]
    
    # Dump physical formula elements safely into the zero-space place layer
    for lbl, math_code, source_file in extracted:
        math_code_fixed = math_code.replace("...", "dots")
        
        output_lines.append(f'    // Source Note File Reference: {source_file}')
        output_lines.append(f'    #publish-formula("{lbl}")[')
        output_lines.append(f'      {math_code_fixed}')
        output_lines.append('    ]')
        output_lines.append('')
        
    output_lines.extend([
        "  ])",
        "]",
        "",
        "// =========================================================================",
        "// 3. THE VISIBLE SHEET OUTPUT (YOUR QUOTES ARE LIVE BELOW)",
        "// =========================================================================",
        '#set page(paper: "a4", margin: 1.5cm)',
        "",
        "= Master Dynamic Formula Reference Index",
        ""
    ])
    
    # Inject call triggers for every extracted formula block automatically
    for lbl, _, _ in extracted:
        output_lines.append(f'#quote-published("{lbl}")\n')
        
    # Write out the physical file directly
    with open(output_file, 'w', encoding='utf-8') as out_f:
        out_f.write("\n".join(output_lines))
        
    print(f"🎉 Success! Generated physical split-file output: {output_file}")

if __name__ == "__main__":
    build_automatic_master()
