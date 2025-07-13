// template.typ

// =================== HELPER FUNCTIONS ===================
// these functions create the custom Arabic blocks

// helper function to render inline Arabic
#let arr(body) = {
  set text(font: "Amiri")
  text(dir: rtl, body)
}

// function to render just a centered Arabic block
#let arr_block(body) = {
  align(center)[
    #block(
      width: 80%,
      inset: 10pt,
      radius: 4pt,
      arr(body)
    )
  ]
}

// function to display Qur'an blocks
#let quran_block(body, translation: none, verse: none) = {
  align(center)[
    #block(
      breakable: false,
      width: 100%,
      inset: 10pt,
      if translation != none or verse != none {
        stack(
          dir: ttb,
          spacing: 12pt,
          text(size: 15pt, dir: rtl, [﴿ #body ﴾]),

          if translation != none {
            text(size: 10pt, style: "italic", translation)
          },

          if verse != none {
            text(size: 10pt, style: "italic", verse)
          }
        )
      } else {
        text(size: 15pt, dir: rtl, [﴿ #body ﴾])
      }
    )
  ]
}

// helper function to render Arabic block from matn
#let matn_block(body, label: "متن", line_spacing: 1.5em) = {
  v(10pt)
  align(center)[
    #block(
      breakable: false,
      stroke: black,
      radius: 5pt,
      width: 80%,
      [
        #place(
          top + left,
          dx: 20pt,
          dy: -8pt,
          rect(
            fill: white,
            stroke: black,
            radius: 3pt,
            inset: (x: 6pt, y: 5pt),
            text(label, size: 11pt, fill: black, dir: rtl)
          )
        )

        #pad(
          top: 2.2em,
          bottom: 2.2em,
          x: 1.2em,
          text(
            size: 15pt,
            fill: black,
            dir: rtl,
            { 
              set par(leading: line_spacing)
              body
            }
          )
        )
      ]
    )
  ]
  v(10pt)
}

// helper function for Arabic example blocks
#let arr_example(body, translation: none, fill: true) = {
  align(center)[
    #block(
      breakable: false,
      fill: if fill != false { luma(240) } else { none },
      width: 80%,
      inset: 10pt,
      radius: 5pt,
      [
        #stack(
          dir: ttb, // top-to-bottom
          spacing: 10pt,
          text(15pt, dir: rtl, body),

          if translation != none {
            text(10pt, style: "italic", eval(translation, mode: "markup"))
          }
        )
      ]
    )
  ]
}


// =================== MAIN TEMPLATE FUNCTION ===================
// this applies all the styling
#let arabic_notes(
  title: "Untitled Notes",
  subtitle: none,
  author: "Anonymous",
  paper: "us-letter",
  body
) = {
  // set document metadata
  set document(title: title, author: author)

  // set page properties.
  set page(paper: paper)

  // set base text and paragraph styles
  set text(font: ("New Computer Modern", "Amiri"), lang: "en")
  set par(leading: 1em)
  set block(spacing: 1.1em)

  // set heading styles
  set heading(numbering: "1.")

  show heading.where(level: 1): it => {
    block(
      text(1.3em, weight: "bold")[#it],
      above: 1.8em,
      below: 1em
    )
  }

  show heading.where(level: 2): it => {
    block(
      text(1.2em, weight: "bold")[#it],
      above: 1.5em,
      below: 0.8em
    )
  }

  show heading.where(level: 3): it => {
    block(
      text(1.1em, weight: "bold")[#it.body],
      above: 1.2em,
      below: 0.6em
    )
  }

  // display the title block
  align(center)[
    #text(2.0em, weight: 500)[#title]
    #v(1em)
    #if subtitle != none {
      text(2.0em, weight: 100)[#arr(subtitle)]
    }
  ]
  v(2.5em)

  // display the document body
  body
}
