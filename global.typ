// 1. Define the macro to box formulas and embed metadata
#let publish-formula(label-name, body) = {
  // Center the formula and wrap it in a clean visual box
  align(center)[
    #block(
      stroke: 1.5pt + rgb("2196F3"), // Clean blue boundary line
      fill: rgb("E3F2FD").transparentize(50%), // Soft light blue tint
      inset: 15pt,
      radius: 6pt,
      body
    )
  ]
  // Inject the hidden metadata tracking element attached to its label
  [#metadata(body) #label(label-name)]
}

// 2. Define the dynamic compiler page/sheet generator
#let generate-formula-sheet() = {
  heading(level: 1)[Dynamic Formula Reference Index]
  
  // Locate all metadata blocks trailing an inserted formula label
  context {
    let matches = query(metadata)
    if matches.len() == 0 [
      _No formulas marked for publication yet._
    ] else {
      for item in matches {
        block(
          width: 100%, 
          inset: (bottom: 10pt), 
          stroke: (bottom: 0.5pt + luma(200))
        )[
          *Location:* Page #item.location().page() \
          $ #item.value $
        ]
      }
    }
  }
}

// global.typ (Append this to your file)

#let quote-published(file-path, label-name) = {
  let content-string = read(file-path)
  
  // Find where the target formula macro definition begins
  let target-trigger = "#publish-formula(\"" + label-name + "\")["
  let start-index = content-string.position(target-trigger)
  
  if start-index == none {
    eval("[_Error: Formula label '" + label-name + "' not found in " + file-path + "_]")
  } else {
    // Advance past the trigger text to the first character inside the content block
    let search-start = start-index + target-trigger.len()
    let slice-string = content-string.slice(search-start)
    
    // Bracket counting algorithm to handle deeply nested math matrices/brackets
    let bracket-depth = 1
    let end-index = 0
    let chars = slice-string.clusters()
    
    for (i, char) in chars.enumerate() {
      if char == "[" { bracket-depth += 1 }
      else if char == "]" { bracket-depth -= 1 }
      
      if bracket-depth == 0 {
        end-index = i
        break
      }
    }
    
    // Extract the perfectly isolated raw inner content string
    let raw-math = slice-string.slice(0, end-index)
    
    // Render the cleanly extracted formula block
    block(
      width: 100%,
      fill: luma(250),
      stroke: (left: 3pt + rgb("2196F3")),
      inset: (left: 15pt, y: 12pt),
      radius: (right: 4pt),
    )[
      #eval(raw-math)
      #v(-4pt)
      #align(right)[
        #text(size: 0.8em, fill: luma(120))[_Source: #file-path (<#label-name>)_]
      ]
    ]
  }
}

// global.typ



#let quote-all-formulas-from-file(file-path) = {
  let content-string = read(file-path)
  let trigger = "#publish-formula("
  
  let current-search-start = 0
  let found-any = false
  
  while true {
    // Slice the remaining unsearched text to find the next formula
    let remaining-text = content-string.slice(current-search-start)
    let local-start-index = remaining-text.position(trigger)
    
    // Break out if no more formulas are found
    if local-start-index == none { break }
    
    found-any = true
    
    // Map the local index back to the absolute coordinate of the full file string
    let start-index = current-search-start + local-start-index
    let slice-string = content-string.slice(start-index)
    
    // Phase 1: Skip the label argument and find the opening content bracket '['
    let opening-bracket-index = slice-string.position("[")
    if opening-bracket-index == none { break }
    
    // Advance past the opening bracket to get strictly to the inner math code
    let math-search-start = opening-bracket-index + 1
    let remaining-string = slice-string.slice(math-search-start)
    
    // Phase 2: Run a bracket-counting loop to safely capture nested math matrices/brackets
    let bracket-depth = 1
    let end-index = 0
    let chars = remaining-string.clusters()
    
    for (i, char) in chars.enumerate() {
      if char == "[" { bracket-depth += 1 }
      else if char == "]" { bracket-depth -= 1 }
      
      if bracket-depth == 0 {
        end-index = i
        break
      }
    }
    
    // Extract the raw math block string safely
    let raw-math = remaining-string.slice(0, end-index)
    
    // Render the extracted formula box into the document
    block(
      width: 100%,
      fill: luma(250),
      stroke: (left: 3pt + rgb("2196F3")),
      inset: (left: 15pt, y: 12pt),
      radius: (right: 4pt),
      breakable: false, // <-- Change 'avoid' to 'false' here
    )[
      #eval(raw-math)
      #v(-4pt)
      #align(right)[
        #align(right)[
          #text(size: 0.8em, fill: luma(120))[_Source: #file-path _]
        ]
      ]
    ]
    
    // Move the pointer forward past this formula to look for the next one
    current-search-start = start-index + math-search-start + end-index + 1
    
    // Safety check to prevent infinite loops if current-search-start stops advancing
    if current-search-start >= content-string.len() { break }
  }
  
  if not found-any {
    text(fill: luma(150))[_No formulas discovered in #file-path._]
  }
}