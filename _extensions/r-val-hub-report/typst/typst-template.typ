
// This is an example typst template (based on the default template that ships
// with Quarto). It defines a typst function named 'article' which provides
// various customization options. This function is called from the 
// 'typst-show.typ' file (which maps Pandoc metadata function arguments)
//
// If you are creating or packaging a custom typst template you will likely
// want to replace this file and 'typst-show.typ' entirely. You can find 
// documentation on creating typst templates and some examples here: 
//   - https://typst.app/docs/tutorial/making-a-template/
//   - https://github.com/typst/templates


#let article(
  title: none,
  subtitle: none,
  authors: none,
  date: none,
  abstract: none,
  abstract-title: none,
  cols: 1,
  margin: (x: 1.25in, y: 1.25in),
  paper: "us-letter",
  lang: "en",
  region: "US",
  font: "Tex Gyre Heros",
  fontsize: 11pt,
  title-size: 1.5em,
  subtitle-size: 1.25em,
  heading-family: "Tex Gyre Heros",
  heading-weight: "bold",
  heading-style: "normal",
  heading-color: black,
  heading-line-height: 0.65em,
  sectionnumbering: none,
  toc: false,
  toc_title: none,
  toc_depth: none,
  toc_indent: 1.5em,
  theme: (),
  doc,
) = {
  set par(justify: true)

  set text(
    lang: lang,
    region: region,
    font: font,
    size: fontsize
  )

  set heading(numbering: sectionnumbering)

  if authors != none {
    let count = authors.len()
    let ncols = calc.min(count, 3)
    grid(
      columns: (1fr,) * ncols,
      row-gutter: 1.5em,
      ..authors.map(author =>
          align(center)[
            #author.name \
            #author.affiliation \
            #author.email
          ]
      )
    )
  }

  // reduce font size for raw blocks
  show raw.where(block: true): it => {
    set text(1em / 1.2)
    it
  }

  set page(
    paper: paper,
    margin: margin,
    numbering: none,
    footer: context if here().page() > 1 {
      let headings = query(heading.where(level: 1).before(here()))
      set align(center)
      block(
        width: page.width,
        inset: 2em,
        grid(
          columns: (1fr, 1fr, 1fr),
          align: (horizon+left, horizon+center, horizon+right),
          stroke: none,
          if (brand-logo.at("medium", default: none) != none) {
            let logo-medium = brand-logo.at("medium", default: none)
            image(
              logo-medium.path,
              height: 4em,
              alt: logo-medium.at("alt", default: none),
            )
          },
          numbering("1", ..counter(page).get()),
          {
            title
            linebreak()
            headings.last().at("body", default: "")
          }
        )
      )
    },
    background: context if here().page() == 1 {
      block({
        // cover page background
        if (brand-logo.at("large", default: none) != none) {
          let cover-image = brand-logo.at("large", default: none)
          image(
            cover-image.path,
            width: 100%,
            height: 100%,
            fit: "cover",
            alt: cover-image.at("alt", default: none),
          )
        }

        // cover page logo
        place(
          horizon+left, 
          dy: -4em,
          box(
            inset: 4em,
            {
              if (brand-logo.at("medium", default: none) != none) {
                let brand-image = brand-logo.at("medium", default: none)
                image(
                  brand-image.path,
                  width: 50%,
                  alt: brand-image.at("alt", default: none),
                )
              }

              if title != none {
                set align(right)
                set par(leading: 0.15em)
                if (heading-family != none or heading-weight != "bold" or heading-style != "normal"
                     or heading-color != black or heading-decoration == "underline"
                     or heading-background-color != none) {
                  set text(
                    font: heading-family,
                    weight: heading-weight,
                    style: heading-style,
                    fill: white,
                  )

                  text(size: title-size)[#title]
                  if subtitle != none {
                    parbreak()
                    text(size: subtitle-size)[#subtitle]
                  }
                  if date != none {
                    parbreak()
                    text[#date]
                  }
                } else {
                  set text(fill: white)
                  text(weight: "bold", size: title-size)[#title]
                  if subtitle != none {
                    parbreak()
                    text(weight: "bold", size: subtitle-size)[#subtitle]
                  }
                  if date != none {
                    parbreak()
                    text[#date]
                  }
                }
              }
            }
          )
        )
      })
    } else {
      // footer shown on all other pages
    }
  )

  // start with a pagebreak to skip cover page, restart page numbering at 1
  pagebreak()
  set page(numbering: "1")
  counter(page).update(1)

  if abstract != none {
    block(inset: 2em)[
    #text(weight: "semibold")[#abstract-title] #h(1em) #abstract
    ]
  }

  if toc {
    let title = if toc_title == none {
      auto
    } else {
      toc_title
    }
    block(above: 0em, below: 2em)[
    #outline(
      title: toc_title,
      depth: toc_depth,
      indent: toc_indent
    );
    ]
  }

  if cols == 1 {
    doc
  } else {
    columns(cols, doc)
  }
}

#set table(
  inset: 6pt,
  stroke: none
)
