// Academic CV Template - Typst
// Inspired by Andrew Heiss's CV design
// Font: Source Sans 3 | Single-column | Grayscale

// ── Color palette ──────────────────────────────────────────────────
#let color-darkgray = rgb("#000000")
#let color-gray = rgb("#333333")
#let color-lightgray = rgb("#777777")
#let color-rule = rgb("#CCCCCC")
#let color-link = rgb("#1a5276")

// ── Helper: Section heading with horizontal rule ───────────────────
#let cv-section(title) = {
  v(12pt)
  block(width: 100%)[
    #text(
      font: "Source Sans 3",
      size: 16pt,
      weight: "bold",
      fill: color-darkgray,
    )[#title]
    #v(-6pt)
    #line(length: 100%, stroke: 0.5pt + color-rule)
  ]
  v(4pt)
}

// ── Helper: CV entry (appointments, education, etc.) ───────────────
// Left column: institution + department
// Middle column: title/role
// Right column: dates
#let cv-entry(
  institution: "",
  department: "",
  location: "",
  title: "",
  date: "",
  details: none,
) = {
  block(width: 100%, below: 10pt, breakable: false)[
    #grid(
      columns: (38%, 1fr, auto),
      column-gutter: 10pt,
      [
        #text(font: "Source Sans 3", weight: "bold", size: 10pt, fill: color-darkgray)[#sym.square.filled #institution]
        #if department != "" [
          #linebreak()
          #pad(left: 12pt)[
            #text(font: "Source Sans 3", size: 8.5pt, fill: color-lightgray)[#department]
          ]
        ]
      ],
      [
        #text(font: "Source Sans 3", size: 10pt, fill: color-darkgray)[#title]
      ],
      align(right)[
        #text(font: "Source Sans 3", size: 9pt, fill: color-gray)[#date]
        #if location != "" [
          #linebreak()
          #text(font: "Source Sans 3", size: 8.5pt, fill: color-lightgray)[#location]
        ]
      ],
    )
    #if details != none [
      #v(2pt)
      #pad(left: 12pt)[
        #text(font: "Source Sans 3", size: 8.5pt, fill: color-gray)[#details]
      ]
    ]
  ]
}

// ── Helper: Education entry ────────────────────────────────────────
#let edu-entry(
  institution: "",
  department: "",
  degree: "",
  date: "",
  details: none,
) = {
  block(width: 100%, below: 10pt, breakable: false)[
    #grid(
      columns: (38%, 1fr, auto),
      column-gutter: 10pt,
      [
        #text(font: "Source Sans 3", weight: "bold", size: 10pt, fill: color-darkgray)[#sym.square.filled #institution]
        #if department != "" [
          #linebreak()
          #pad(left: 12pt)[
            #text(font: "Source Sans 3", size: 8.5pt, fill: color-lightgray)[#department]
          ]
        ]
      ],
      [
        #text(font: "Source Sans 3", size: 10pt, fill: color-darkgray)[#degree]
      ],
      align(right)[
        #text(font: "Source Sans 3", size: 9pt, fill: color-gray)[#date]
      ],
    )
    #if details != none [
      #v(2pt)
      #pad(left: 12pt)[
        #text(font: "Source Sans 3", size: 8.5pt, fill: color-gray)[#details]
      ]
    ]
  ]
}

// ── Helper: Publication entry ──────────────────────────────────────
#let pub-entry(content, date: "") = {
  block(width: 100%, below: 12pt, breakable: false)[
    #grid(
      columns: (1fr, auto),
      column-gutter: 12pt,
      [
        #set text(font: "Source Sans 3", size: 9.5pt, fill: color-darkgray)
        #content
      ],
      align(right)[
        #text(font: "Source Sans 3", size: 9pt, fill: color-gray)[#date]
      ],
    )
  ]
}

// ── Helper: Grant entry ────────────────────────────────────────────
#let grant-entry(
  title: "",
  funder: "",
  role: "",
  amount: "",
  date: "",
  description: "",
) = {
  block(width: 100%, below: 10pt, breakable: false)[
    #grid(
      columns: (1fr, auto),
      column-gutter: 12pt,
      [
        #text(font: "Source Sans 3", weight: "bold", size: 9.5pt, fill: color-darkgray)[#title]
        #if funder != "" [
          #linebreak()
          #text(font: "Source Sans 3", size: 9pt, fill: color-gray)[#funder]
        ]
        #if role != "" [
          #text(font: "Source Sans 3", size: 9pt, fill: color-gray)[ | #role]
        ]
        #if amount != "" [
          #text(font: "Source Sans 3", size: 9pt, fill: color-gray)[ | #amount]
        ]
      ],
      align(right)[
        #text(font: "Source Sans 3", size: 9pt, fill: color-gray)[#date]
      ],
    )
    #if description != "" [
      #v(1pt)
      #pad(left: 12pt)[
        #text(font: "Source Sans 3", size: 8.5pt, fill: color-lightgray)[#description]
      ]
    ]
  ]
}

// ── Helper: Teaching entry ─────────────────────────────────────────
#let teaching-entry(course: "", institution: "", role: "", semesters: "") = {
  block(width: 100%, below: 6pt, breakable: false)[
    #grid(
      columns: (15%, 55%, 1fr),
      column-gutter: 8pt,
      [
        #align(right)[#text(font: "Source Sans 3", size: 9pt, fill: color-gray)[#semesters]]
      ],
      [
        #text(font: "Source Sans 3", weight: "bold", size: 9.5pt, fill: color-darkgray)[#course]
        #if institution != "" [
          #linebreak()
          #text(font: "Source Sans 3", size: 8.5pt, fill: color-lightgray)[#institution]
        ]
      ],
      [
        #text(font: "Source Sans 3", size: 9pt, fill: color-gray)[#role]
      ]
    )
  ]
}

// ── Helper: Presentation entry ─────────────────────────────────────
#let presentation-entry(content, date: "") = {
  block(width: 100%, below: 7pt, breakable: false)[
    #grid(
      columns: (1fr, auto),
      column-gutter: 12pt,
      [
        #set text(font: "Source Sans 3", size: 9pt, fill: color-darkgray)
        #content
      ],
      align(right)[
        #text(font: "Source Sans 3", size: 9pt, fill: color-gray)[#date]
      ],
    )
  ]
}

// ── Helper: Project entry ─────────────────────────────────────────
#let project-entry(institution: "", project: "", role: "", date: "", href: "") = {
  block(width: 100%, below: 6pt, breakable: false)[
    #grid(
      columns: (15%, 40%, 1fr),
      column-gutter: 8pt,
      [
        #align(right)[#text(font: "Source Sans 3", size: 9pt, fill: color-gray)[#date]]
      ],
      [
        #text(font: "Source Sans 3", weight: "bold", size: 9.5pt, fill: color-darkgray)[#project]
        #if institution != "" [
          #linebreak()
          #text(font: "Source Sans 3", size: 8.5pt, fill: color-lightgray)[#institution]
        ]
      ],
      [
        #text(font: "Source Sans 3", size: 9pt, fill: color-gray)[#role]
        #if href != "" [
          #linebreak()
          #link(href)[#text(font: "Source Sans 3", size: 8.5pt)[#href]]
        ]
      ]
    )
  ]
}

// ── Helper: Service list ───────────────────────────────────────────
#let service-entry(role: "", organization: "", date: "") = {
  block(width: 100%, below: 6pt, breakable: false)[
    #grid(
      columns: (15%, 55%, 1fr),
      column-gutter: 8pt,
      align(right)[
        #text(font: "Source Sans 3", size: 9pt, fill: color-gray)[#date]
      ],
      [
        #text(font: "Source Sans 3", weight: "bold", size: 9.5pt, fill: color-darkgray)[#organization]
      ],
      [
        #text(font: "Source Sans 3", size: 9pt, fill: color-gray)[#role]
      ]
    )
  ]
}

// ── Helper: Extracurricular entry ─────────────────────────────────────────
#let extracurricular-entry(date: "", institution: "", role: "", location: "") = {
  block(width: 100%, below: 6pt, breakable: false)[
    #grid(
      columns: (15%, 35%, 35%, 1fr),
      column-gutter: 8pt,
      [
        #align(right)[#text(font: "Source Sans 3", size: 9pt, fill: color-gray)[#date]]
      ],
      [
        #text(font: "Source Sans 3", weight: "bold", size: 9.5pt, fill: color-darkgray)[#institution]
      ],
      [
        #text(font: "Source Sans 3", size: 9pt, fill: color-gray)[#role]
      ],
      [
        #text(font: "Source Sans 3", size: 9pt, fill: color-gray)[#location]
      ]
    )
  ]
}

// ── Helper: Subsection heading ─────────────────────────────────────
#let cv-subsection(title) = {
  v(6pt)
  text(font: "Source Sans 3", weight: "bold", size: 10pt, fill: color-darkgray)[#sym.square.filled #title]
  v(4pt)
}

// ── Helper: Simple list item ───────────────────────────────────────
#let cv-item(content) = {
  block(width: 100%, below: 4pt)[
    #text(font: "Source Sans 3", size: 9pt, fill: color-gray)[#content]
  ]
}

// ── Main document template ─────────────────────────────────────────
#let cv(
  name: "",
  email: "",
  phone: "",
  url: "",
  orcid: "",
  github: "",
  address: "",
  date: "",
  body,
) = {
  // Page setup
  set page(
    paper: "us-letter",
    margin: (left: 0.85in, right: 0.85in, top: 0.7in, bottom: 0.7in),
    footer: context {
      set text(font: "Source Sans 3", size: 8pt, fill: color-lightgray)
      grid(
        columns: (1fr, 1fr, 1fr),
        align(left)[Page #counter(page).display() of #counter(page).final().at(0)],
        align(center)[
          #text(weight: "bold")[#name]
          #linebreak()
          #if url != "" [#url]
        ],
        align(right)[Last updated #date],
      )
    },
  )

  // Default text settings
  set text(font: "Source Sans 3", size: 10pt, fill: color-darkgray)
  set par(leading: 0.65em, justify: false)

  // Hyperlink styling
  show link: it => text(fill: color-link)[#it]

  // ── Header ──
  block(width: 100%)[
    #text(font: "Source Sans 3", size: 28pt, weight: "bold", fill: color-darkgray)[#name]
    #v(-4pt)
    #line(length: 100%, stroke: 1pt + color-darkgray)
    #v(4pt)
    #set text(font: "Source Sans 3", size: 9pt, fill: color-gray)
    #grid(
      columns: (auto, auto, auto),
      column-gutter: 24pt,
      row-gutter: 4pt,
      [#emoji.mail #link("mailto:" + email)[#email]],
      [#emoji.phone #phone],
      [#emoji.globe.meridians #link("https://" + url)[#url]],
      [#emoji.page #link("https://orcid.org/" + orcid)[ORCID: #orcid]],
      [#emoji.laptop #link("https://github.com/" + github)[github.com/#github]],
      [#emoji.house #address],
    )
  ]

  v(8pt)

  body
}
