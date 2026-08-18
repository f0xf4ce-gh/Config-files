vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.g.colors_name = "grim"

local set = vim.api.nvim_set_hl
local none = "NONE"

-- Grim / Transilvanian Hunger palette.
set(0, "Normal", { fg = "#c1c1c1", bg = none })
set(0, "NormalNC", { fg = "#888888", bg = none })
set(0, "EndOfBuffer", { fg = none, bg = none })
set(0, "SignColumn", { bg = none })
set(0, "LineNr", { fg = "#505050", bg = none })
set(0, "CursorLineNr", { fg = "#c1c1c1", bg = none, bold = true })
set(0, "Cursor", { fg = "#000000", bg = "#c1c1c1" })
set(0, "lCursor", { fg = "#000000", bg = "#c1c1c1" })
set(0, "Visual", { bg = "#181818" })
set(0, "Search", { fg = "#ffffff", bg = "#3a3a3a" })
set(0, "IncSearch", { fg = "#000000", bg = "#c1c1c1" })
set(0, "ColorColumn", { bg = "#101010" })
set(0, "Whitespace", { fg = "#505050" })
set(0, "NonText", { fg = "#505050" })
set(0, "VertSplit", { fg = "#3a3a3a", bg = none })
set(0, "WinSeparator", { fg = "#3a3a3a", bg = none })

set(0, "StatusLine", { fg = "#c1c1c1", bg = none })
set(0, "StatusLineNC", { fg = "#505050", bg = none })
set(0, "TabLine", { fg = "#888888", bg = none })
set(0, "TabLineSel", { fg = "#000000", bg = "#c1c1c1", bold = true })
set(0, "TabLineFill", { bg = none })
set(0, "Pmenu", { fg = "#c1c1c1", bg = "#181818" })
set(0, "PmenuSel", { fg = "#000000", bg = "#c1c1c1" })
set(0, "FloatBorder", { fg = "#3a3a3a", bg = none })
set(0, "NormalFloat", { fg = "#c1c1c1", bg = "#101010" })

set(0, "Comment", { fg = "#505050", italic = true })
set(0, "Keyword", { fg = "#ffffff" })
set(0, "Statement", { fg = "#ffffff" })
set(0, "Conditional", { fg = "#ffffff" })
set(0, "Repeat", { fg = "#ffffff" })
set(0, "Operator", { fg = "#888888" })
set(0, "String", { fg = "#c1c1c1" })
set(0, "Constant", { fg = "#ffffff" })
set(0, "Number", { fg = "#ffffff" })
set(0, "Boolean", { fg = "#ffffff" })
set(0, "Type", { fg = "#aaaaaa" })
set(0, "Structure", { fg = "#aaaaaa" })
set(0, "Function", { fg = "#c1c1c1" })
set(0, "Identifier", { fg = "#aaaaaa" })
set(0, "PreProc", { fg = "#ffffff" })
set(0, "Special", { fg = "#aaaaaa" })
set(0, "Delimiter", { fg = "#888888" })
set(0, "Tag", { fg = "#ffffff" })

set(0, "DiagnosticError", { fg = "#ffffff", undercurl = true, sp = "#ffffff" })
set(0, "DiagnosticWarn", { fg = "#aaaaaa", undercurl = true, sp = "#aaaaaa" })
set(0, "DiagnosticInfo", { fg = "#c1c1c1" })
set(0, "DiagnosticHint", { fg = "#888888" })
set(0, "DiffAdd", { fg = "#c1c1c1", bg = none })
set(0, "DiffDelete", { fg = "#888888", bg = none })
set(0, "DiffChange", { fg = "#aaaaaa", bg = none })

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
