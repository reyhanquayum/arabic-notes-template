// The main function that lays out the entire document
#let lesson-notes(
  title: "Lesson Notes",
  author: "Student of Knowledge",
  subtitle: [],
  body
) = {
  // ================= PREAMBLE =================
  // this section for the document's overall style

  // Set the base document properties using arguments from the function.
  set document(
    title: title,
    author: author,
  )

  set page(
    paper: "us-letter"
  )

  // Set the primary english and arabic font
  set text(font: ("New Computer Modern", "Amiri"), lang: "en")

  // double spacing
  set par(leading: 1em)
  // add space between paragraphs
  set block(spacing: 1.1em)

  // helper function to render inline Arabic
  let arr(body) = text(dir: rtl, body)

  // function to render block Arabic
  let arr_block(body) = {
    align(center)[
      #block(
        width: 80%,
        inset: 10pt,
        radius: 4pt,
        text(dir: rtl, body)
      )
    ]
  }
  // function to display Qur'an blocks
  let quran_block(body, translation: none, verse: none) = {
    align(center)[
      #block(
        breakable: false,
        width: 100%,
        inset: 10pt,
        spacing: 15pt,
        [
          #stack(
            dir: ttb,
            spacing: 15pt,
            text(size: 15pt, dir:rtl, [﴿ #body ﴾]),

            if translation != none{
              text(size: 10pt, style: "italic", translation)
            },
            if verse != none{
              text(size: 10pt, style: "italic", verse)
            }
          )
        ]
      )
    ]
  }

  // helper function to render Arabic block from matn
  #let matn_block(body, label: "متن") = {
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
            top: 1.5em,
            bottom: 1em,
            x: 1em,
            text(
              size: 15pt,
            fill: black,
            dir: rtl,
            body
          )
        )
      ]
    )
  ]
  v(10pt)
}

  //helper function for Arabic example blocks
  let arr_example(body, translation: none) = {
    align(center)[
      #block(
        breakable: false,
        fill: luma(240),
        width: 80%,
        inset: 10pt,
        radius: 5pt,
        [
          #stack(
            dir: ttb, // top-to-bottom
            spacing: 10pt,
            text(15pt, dir: rtl, body),

            if translation != none {
              text(10pt, style: "italic", translation)
            }
          )
        ]
      )
    ]
  }

  // Set up heading styles
  set heading(numbering: "1.")

  show heading.where(level: 1): it => {
    block(
      text(1.4em, weight: "bold")[#it],
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

  // ================= DOCUMENT BODY =================

  // title and subtitle block
  align(center)[
    #text(2.0em, weight: 500)[#title]
    #v(1em)
    #if subtitle != none {
        #text(2.0em, weight: 100)[#subtitle]
    }
  ]
  v(2.5em) // vertical space after title block

  // main content goes here
  body
}
