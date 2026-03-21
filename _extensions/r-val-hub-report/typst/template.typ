$definitions.typ()$

$for(header-includes)$
$header-includes$
$endfor$

$page.typ()$

$for(include-before)$
$include-before$
$endfor$

$brand.typ()$

// this was moved to come _after_ `include-before`
//
// it is unclear what value there was in separating them in the first place,
// since `include-before` needs to be run before we can leverage any quarto
// helpers in the template
// 
$typst-template.typ()$

$typst-show.typ()$

$body$

$notes.typ()$

$biblio.typ()$

$for(include-after)$
$include-after$
$endfor$
