function quarto_kwarg_is_empty(x)
  return x == nil or (type(x) == "table" and next(x) == nil)
end

function metric_card(args, kwargs, meta)
  if quarto.doc.isFormat('html') then
    return metric_card_html(args, kwargs, meta)
  elseif quarto.doc.isFormat('typst') then
    return ''
  end
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
  local class = pandoc.utils.stringify(kwargs["class"])

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
    '<div class="card position-relative overflow-hidden ' .. class .. '">' ..
      '<div class="card-icon"></div>' ..
      header .. body .. footer ..
    '</div>'

  return pandoc.RawBlock('html', html)
end

return {
  ['metric-card'] = metric_card
}
