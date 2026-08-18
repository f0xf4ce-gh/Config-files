vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "clear"

local set = vim.api.nvim_set_hl
local none = "NONE"

-- Helix clear theme: transparent, cool cyan UI, bright syntax accents.
set(0, "Normal", { fg = "#ffffff", bg = none })
set(0, "NormalNC", { fg = "#999999", bg = none })
set(0, "EndOfBuffer", { fg = none, bg = none })
set(0, "SignColumn", { bg = none })
set(0, "LineNr", { fg = "#808080", bg = none })
set(0, "CursorLineNr", { fg = "#87ffff", bg = none })
set(0, "Cursor", { fg = "#000000", bg = "#87ffff" })
set(0, "lCursor", { fg = "#000000", bg = "#87ffff" })
set(0, "Visual", { bg = "#222222" })
set(0, "Search", { fg = "#000000", bg = "#ffff00" })
set(0, "IncSearch", { fg = "#000000", bg = "#87ffff" })
set(0, "ColorColumn", { bg = "#111111" })
set(0, "Whitespace", { fg = "#666666" })
set(0, "NonText", { fg = "#666666" })
set(0, "VertSplit", { fg = "#808080", bg = none })
set(0, "WinSeparator", { fg = "#808080", bg = none })

set(0, "StatusLine", { fg = "#ffffff", bg = none })
set(0, "StatusLineNC", { fg = "#808080", bg = none })
set(0, "TabLine", { fg = "#808080", bg = none })
set(0, "TabLineSel", { fg = "#000000", bg = "#87ffff" })
set(0, "TabLineFill", { bg = none })
set(0, "Pmenu", { fg = "#ffffff", bg = "#111111" })
set(0, "PmenuSel", { fg = "#000000", bg = "#87ffff" })
set(0, "FloatBorder", { fg = "#808080", bg = none })
set(0, "NormalFloat", { fg = "#ffffff", bg = none })

set(0, "Comment", { fg = "#808080", italic = true })
set(0, "Keyword", { fg = "#ff00ff" })
set(0, "Statement", { fg = "#ff00ff" })
set(0, "Conditional", { fg = "#ff55ff" })
set(0, "Repeat", { fg = "#ff55ff" })
set(0, "Operator", { fg = "#ff55ff" })
set(0, "String", { fg = "#00ff00" })
set(0, "Constant", { fg = "#ffff00" })
set(0, "Number", { fg = "#ffff00" })
set(0, "Boolean", { fg = "#ffff00" })
set(0, "Type", { fg = "#87afff" })
set(0, "Structure", { fg = "#87afff" })
set(0, "Function", { fg = "#00ffff" })
set(0, "Identifier", { fg = "#ffffff" })
set(0, "PreProc", { fg = "#ff55ff" })
set(0, "Special", { fg = "#afff00" })
set(0, "Delimiter", { fg = "#d0d0d0" })
set(0, "Tag", { fg = "#ff5555" })

set(0, "DiagnosticError", { fg = "#ff5555", undercurl = true, sp = "#ff5555" })
set(0, "DiagnosticWarn", { fg = "#ffff00", undercurl = true, sp = "#ffff00" })
set(0, "DiagnosticInfo", { fg = "#87afff" })
set(0, "DiagnosticHint", { fg = "#87ffff" })
set(0, "DiffAdd", { fg = "#00ff00", bg = none })
set(0, "DiffDelete", { fg = "#ff5555", bg = none })
set(0, "DiffChange", { fg = "#ffff00", bg = none })

local treesitter = {
  ["@comment"] = "Comment",
  ["@keyword"] = "Keyword",
  ["@keyword.control"] = "Conditional",
  ["@operator"] = "Operator",
  ["@string"] = "String",
  ["@constant"] = "Constant",
  ["@number"] = "Number",
  ["@type"] = "Type",
  ["@type.builtin"] = "Type",
  ["@function"] = "Function",
  ["@function.call"] = "Function",
  ["@variable"] = "Identifier",
  ["@variable.parameter"] = "Special",
  ["@tag"] = "Tag",
  ["@punctuation.delimiter"] = "Delimiter",
}
for group, link in pairs(treesitter) do
  set(0, group, { link = link })
end
