#let brand_bootswatch_defaults = (
  color: (
    primary: rgb("#0d6efd"),
    secondary: rgb("#6c757d"),
    success: rgb("#198754"),
    info: rgb("#0dcaf0"),
    warning: rgb("#ffc107"),
    danger: rgb("#dc3545"),
    light: rgb("#f8f9fa"),
    dark: rgb("#212529"),
    blue: rgb("#0d6efd"),
    indigo: rgb("#6610f2"),
    purple: rgb("#6f42c1"),
    pink: rgb("#d63384"),
    red: rgb("#dc3545"),
    orange: rgb("#fd7e14"),
    yellow: rgb("#ffc107"),
    green: rgb("#198754"),
    teal: rgb("#20c997"),
    cyan: rgb("#0dcaf0"),
    black: rgb("#000"),
    white: rgb("#fff"),
    gray: rgb("#6c757d"),
  )
)

// populate brand colors, defaulting to bootswatch defaults when not defined
#let brand = (
  color: (
    primary: $if(brand.colors.primary.light)$rgb("$brand.colors.primary.light$"),
      $elseif(brand.colors.primary)$rgb("$brand.colors.primary$"),
      $else$brand_bootswatch_defaults.color.primary,$endif$
    secondary: $if(brand.colors.secondary.light)$rgb("$brand.colors.secondary.light$"),
      $elseif(brand.colors.secondary)$rgb("$brand.colors.secondary$"),
      $else$brand_bootswatch_defaults.color.secondary,$endif$
    success: $if(brand.colors.success.light)$rgb("$brand.colors.success.light$"),
      $elseif(brand.colors.success)$rgb("$brand.colors.success$"),
      $else$brand_bootswatch_defaults.color.success,$endif$
    info: $if(brand.colors.info.light)$rgb("$brand.colors.info.light$"),
      $elseif(brand.colors.info)$rgb("$brand.colors.info$"),
      $else$brand_bootswatch_defaults.color.info,$endif$
    warning: $if(brand.colors.warning.light)$rgb("$brand.colors.warning.light$"),
      $elseif(brand.colors.warning)$rgb("$brand.colors.warning$"),
      $else$brand_bootswatch_defaults.color.warning,$endif$
    danger: $if(brand.colors.danger.light)$rgb("$brand.colors.danger.light$"),
      $elseif(brand.colors.danger)$rgb("$brand.colors.danger$"),
      $else$brand_bootswatch_defaults.color.danger,$endif$
    light: $if(brand.colors.light.light)$rgb("$brand.colors.light.light$"),
      $elseif(brand.colors.light)$rgb("$brand.colors.light$"),
      $else$brand_bootswatch_defaults.color.light,$endif$
    dark: $if(brand.colors.dark.light)$rgb("$brand.colors.dark.light$"),
      $elseif(brand.colors.dark)$rgb("$brand.colors.dark$"),
      $else$brand_bootswatch_defaults.color.dark,$endif$
    blue: $if(brand.colors.blue.light)$rgb("$brand.colors.blue.light$"),
      $elseif(brand.colors.blue)$rgb("$brand.colors.blue$"),
      $else$brand_bootswatch_defaults.color.blue,$endif$
    indigo: $if(brand.colors.indigo.light)$rgb("$brand.colors.indigo.light$"),
      $elseif(brand.colors.indigo)$rgb("$brand.colors.indigo$"),
      $else$brand_bootswatch_defaults.color.indigo,$endif$
    purple: $if(brand.colors.purple.light)$rgb("$brand.colors.purple.light$"),
      $elseif(brand.colors.purple)$rgb("$brand.colors.purple$"),
      $else$brand_bootswatch_defaults.color.purple,$endif$
    pink: $if(brand.colors.pink.light)$rgb("$brand.colors.pink.light$"),
      $elseif(brand.colors.pink)$rgb("$brand.colors.pink$"),
      $else$brand_bootswatch_defaults.color.pink,$endif$
    red: $if(brand.colors.red.light)$rgb("$brand.colors.red.light$"),
      $elseif(brand.colors.red)$rgb("$brand.colors.red$"),
      $else$brand_bootswatch_defaults.color.red,$endif$
    orange: $if(brand.colors.orange.light)$rgb("$brand.colors.orange.light$"),
      $elseif(brand.colors.orange)$rgb("$brand.colors.orange$"),
      $else$brand_bootswatch_defaults.color.orange,$endif$
    yellow: $if(brand.colors.yellow.light)$rgb("$brand.colors.yellow.light$"),
      $elseif(brand.colors.yellow)$rgb("$brand.colors.yellow$"),
      $else$brand_bootswatch_defaults.color.yellow,$endif$
    green: $if(brand.colors.green.light)$rgb("$brand.colors.green.light$"),
      $elseif(brand.colors.green)$rgb("$brand.colors.green$"),
      $else$brand_bootswatch_defaults.color.green,$endif$
    teal: $if(brand.colors.teal.light)$rgb("$brand.colors.teal.light$"),
      $elseif(brand.colors.teal)$rgb("$brand.colors.teal$"),
      $else$brand_bootswatch_defaults.color.teal,$endif$
    cyan: $if(brand.colors.cyan.light)$rgb("$brand.colors.cyan.light$"),
      $elseif(brand.colors.cyan)$rgb("$brand.colors.cyan$"),
      $else$brand_bootswatch_defaults.color.cyan,$endif$
    black: $if(brand.colors.black.light)$rgb("$brand.colors.black.light$"),
      $elseif(brand.colors.black)$rgb("$brand.colors.black$"),
      $else$brand_bootswatch_defaults.color.black,$endif$
    white: $if(brand.colors.white.light)$rgb("$brand.colors.white.light$"),
      $elseif(brand.colors.white)$rgb("$brand.colors.white$"),
      $else$brand_bootswatch_defaults.color.white,$endif$
    gray: $if(brand.colors.gray.light)$rgb("$brand.colors.gray.light$"),
      $elseif(brand.colors.gray)$rgb("$brand.colors.gray$"),
      $else$brand_bootswatch_defaults.color.gray,$endif$
  ),
  logo: brand-logo
)



