# Quarto + Typst Academic CV Template

A reproducible, data-driven academic CV template built with [Quarto](https://quarto.org/) and [Typst](https://typst.app/). Inspired by [Andrew Heiss's CV design](https://www.andrewheiss.com/cv/).

**Live demo and guide:** [muntasirmasum.github.io/quarto-typst-cv-template](https://muntasirmasum.github.io/quarto-typst-cv-template/)

## Features

- Data-driven: CV entries stored in YAML files and BibTeX, separated from formatting
- Single command rendering: `quarto render cv.qmd` produces a polished PDF
- Clean typography: Source Sans 3 font, grayscale palette, FontAwesome and Academicons icons
- Smart author formatting: names auto-abbreviated (Last, F.), your name bolded, DOIs hyperlinked
- No orphaned entries: blocks stay together across page breaks

## Quick Start

1. Clone this repository
2. Install prerequisites (Quarto 1.4+, R with `yaml` package, Source Sans 3 font, FontAwesome 6 desktop fonts, Academicons)
3. Edit the YAML data files in `data/` and `publications.bib`
4. Update `cv.qmd` front matter with your contact info
5. Customize `format_authors()` in `cv.qmd` to bold your name
6. Run: `quarto render cv.qmd`

See the [Template Guide](https://muntasirmasum.github.io/quarto-typst-cv-template/guide.html) for detailed instructions.

## Credits

- Design inspired by [Andrew Heiss's CV](https://www.andrewheiss.com/cv/)
- Template approach informed by [cwimpy/my-cv](https://github.com/cwimpy/my-cv) and [kazuyanagimoto/quarto-awesomecv-typst](https://github.com/kazuyanagimoto/quarto-awesomecv-typst)
- Built by [Muntasir Masum](https://github.com/muntasirmasum)
