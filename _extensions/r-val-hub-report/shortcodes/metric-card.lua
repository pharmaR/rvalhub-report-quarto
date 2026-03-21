function quarto_kwarg_is_empty(x)
  return x == nil or (type(x) == "table" and next(x) == nil)
end

function kwarg(x, default)
  if quarto_kwarg_is_empty(x) then
    return default
  else
    return x
  end
end

function metric_card(args, kwargs, meta)
  if quarto.doc.isFormat('html') then
    return metric_card_html(args, kwargs, meta)
  elseif quarto.doc.isFormat('typst') then
    return metric_card_typst(args, kwargs, meta)
  end
  return pandoc.Null()
end

function html_bs_card_section(classes, content)
  if type(classes) == "string" then
    classes = {classes}
  end

  if not quarto_kwarg_is_empty(content) then
    return
      '<div class="' .. table.concat(classes, " ") .. '">' ..
        pandoc.utils.stringify(content) ..
      '</div>'
  end

  return ''
end

function metric_card_html(args, kwargs, meta)
  local classes = ''
  if not quarto_kwarg_is_empty(kwargs["style"]) then
    classes = classes .. ' card-' .. pandoc.utils.stringify(kwargs["style"])
  end

  if not quarto_kwarg_is_empty(kwargs["span"]) then
    classes = classes .. ' g-col-' .. pandoc.utils.stringify(kwargs["span"])
  end

  local header = html_bs_card_section("card-header", kwargs["header"])  
  local title = html_bs_card_section("card-title", kwargs["title"])
  local subtitle = html_bs_card_section("card-subtitle", kwargs["subtitle"])
  local footer = html_bs_card_section({"card-footer", "small", "fw-light"}, kwargs["footer"])
  local text = html_bs_card_section({"card-text", "display-3", "fw-bolder"}, kwargs["text"])

  local body =
    '<div class="card-body">' .. title .. subtitle .. text .. '</div>'

  local icon =
    '<div class="card-icon"></div>'

  local html =
    '<div class="card position-relative overflow-hidden ' .. classes .. '">' ..
      '<div class="card-icon"></div>' ..
      header .. body .. footer ..
    '</div>'

  return pandoc.RawBlock('html', html)
end

function metric_card_typst(args, kwargs, meta)
  local color = 'blue'
  if not quarto_kwarg_is_empty(kwargs["style"]) then
    color = "brand.color." .. pandoc.utils.stringify(kwargs["style"])
  end

  local raw= [[
    grid.cell(colspan: 4)[
      #set text(fill: white)
      #grid(
        columns: 1,
        rect(
          inset: 1em,
          radius: (top: 0.5em, bottom: 0em),
          fill: ]] .. color .. [[,
          width: 100%,
          [
            #text(size: 1em)[]] .. kwarg(kwargs["title"], "") .. [[] \
            #set par(leading: 0.1em, spacing: 0.1em)
            #text(size: 3em)[]] .. kwarg(kwargs["text"], "NA") .. [[]
          ]
        ),
        rect(
          inset: 1em,
          radius: (top: 0em, bottom: 0.5em),
          fill: color.mix((]] .. color .. [[, 90%), (black, 10%)),
          width: 100%,
          [
            #set par(leading: 0.4em)
            #set text(size: 0.8em)
            number of errors raised when running `R CMD check`
          ]
        ),
      )
    ],
  ]]

  return pandoc.RawBlock('typst', raw)
end

function metric_card_pdf(args, kwargs, meta)
  -- currently unsupported
  return pandoc.RawBlock('pdf', 'test')
end

return {
  ['metric-card'] = metric_card,
  ['typst-grid-start'] = function(args, kwargs, meta)
    if quarto.doc.isFormat('typst') then
      return pandoc.RawBlock('typst', [[#grid(columns: 12, gutter: 8pt, ]])
    end
    return pandoc.Null()
  end,
  ['typst-grid-end'] = function(args, kwargs, meta)
    if quarto.doc.isFormat('typst') then
      return pandoc.RawBlock('typst', [[ ) ]])
    end
    return pandoc.Null()
  end
}
