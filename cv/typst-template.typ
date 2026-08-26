// Import our CV template functions
#import "cv-template.typ": *
#import "@preview/fontawesome:0.5.0": fa-envelope, fa-phone, fa-globe, fa-github, fa-location-dot, fa-linkedin, fa-bluesky
#import "@preview/use-academicons:0.1.0": ai-orcid

#let article(
  title: none,
  authors: none,
  date: none,
  abstract: none,
  cols: 1,
  margin: (left: 0.85in, right: 0.85in, top: 0.7in, bottom: 0.7in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: "Source Sans 3",
  fontsize: 10pt,
  sectionnumbering: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  // Custom metadata
  name: "",
  email: "",
  phone: "",
  url: "",
  orcid: "",
  github: "",
  address: "",
  doc,
) = {

  set page(
    paper: paper,
    margin: margin,
    footer: context {
      set text(font: "Source Sans 3", size: 8pt, fill: color-lightgray)
      grid(
        columns: (1fr, 1fr, 1fr),
        align(left)[Page #counter(page).display() of #counter(page).final().at(0)],
        align(center)[
          #text(weight: "bold")[#name]
        ],
        align(right)[Last updated #if date != none [#date] else [2026]],
      )
    },
  )

  set text(font: font, size: fontsize, fill: color-darkgray, ..if lang != "" { (lang: lang,) }, ..if region != "" { (region: region,) })
  set par(leading: 0.65em, justify: false)

  // Hyperlink styling
  show link: it => text(fill: color-link)[#it]

  // ── Header ──
  // Clean email: remove backslash escaping from Pandoc
  let clean-email = email.replace("\\@", "@")

  block(width: 100%)[
    #text(font: "Source Sans 3", size: 28pt, weight: "bold", fill: color-darkgray)[#name]
    #v(-4pt)
    #line(length: 100%, stroke: 1pt + color-darkgray)
    #v(4pt)
    #set text(font: "Source Sans 3", size: 7.5pt, fill: color-gray)
    #let icon-color = color-gray
    #grid(
      columns: (25%, 25%, 25%, 25%),
      row-gutter: 4pt,
      // CUSTOMIZE: Rearrange or add/remove items as needed
      [#align(left)[#fa-globe(solid: true, fill: icon-color) #link("https://" + url)[#url]]],
      [#align(left)[#fa-envelope(solid: true, fill: icon-color) #link("mailto:" + clean-email)[#clean-email] #h(8pt)]],
      [#align(right)[#ai-orcid(fill: rgb("#A6CE39")) #link("https://orcid.org/" + orcid)[#orcid] #h(6pt)]],
      [#align(right)[#fa-github(fill: icon-color) #link("https://github.com/" + github)[#github]]],
    )
  ]

  v(8pt)

  doc
}
