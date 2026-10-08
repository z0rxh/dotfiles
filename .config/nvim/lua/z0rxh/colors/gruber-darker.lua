-- Gruber Darker for Neovim
-- Port of https://github.com/rexim/gruber-darker-theme (Emacs)
-- Original: Jason R. Blevins / Alexey Kutepov (rexim), MIT license.
--
-- Install: save as ~/.config/nvim/colors/gruber-darker.lua
-- Use:     vim.cmd.colorscheme("gruber-darker")   (or :colorscheme gruber-darker)

vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.o.termguicolors = true
vim.g.colors_name = "gruber-darker"

-- Palette (identical to the Emacs theme)
local c = {
  fg        = "#e4e4ef",
  fg1       = "#f4f4ff",
  fg2       = "#f5f5f5",
  white     = "#ffffff",
  black     = "#000000",
  bg_1      = "#101010",
  bg        = "#181818",
  bg1       = "#282828",
  bg2       = "#453d41",
  bg3       = "#484848",
  bg4       = "#52494e",
  red_1     = "#c73c3f",
  red       = "#f43841",
  red1      = "#ff4f58",
  green     = "#73c936",
  yellow    = "#ffdd33",
  brown     = "#cc8c3c",
  quartz    = "#95a99f",
  niagara_2 = "#303540",
  niagara_1 = "#565f73",
  niagara   = "#96a6c8",
  wisteria  = "#9e95c7",
}

local function hl(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

---------------------------------------------------------------------------
-- Editor UI
---------------------------------------------------------------------------
hl("Normal",        { fg = c.fg, bg = c.bg })
hl("NormalNC",      { fg = c.fg, bg = c.bg })
hl("NormalFloat",   { fg = c.fg, bg = c.bg1 })
hl("FloatBorder",   { fg = c.bg4, bg = c.bg1 })
hl("FloatTitle",    { fg = c.yellow, bg = c.bg1, bold = true })
hl("Cursor",        { fg = c.bg, bg = c.yellow })
hl("lCursor",       { fg = c.bg, bg = c.yellow })
hl("CursorIM",      { fg = c.bg, bg = c.yellow })
hl("TermCursor",    { fg = c.bg, bg = c.yellow })
hl("CursorLine",    { bg = c.bg1 })
hl("CursorColumn",  { bg = c.bg1 })
hl("ColorColumn",   { bg = c.bg1 })
hl("LineNr",        { fg = c.bg4, bg = c.bg })
hl("CursorLineNr",  { fg = c.yellow, bg = c.bg })
hl("SignColumn",    { fg = c.bg2, bg = c.bg })
hl("FoldColumn",    { fg = c.bg2, bg = c.bg })
hl("Folded",        { fg = c.quartz, bg = c.bg1 })
hl("VertSplit",     { fg = c.bg2 })
hl("WinSeparator",  { fg = c.bg2 })
hl("EndOfBuffer",   { fg = c.bg })
hl("NonText",       { fg = c.bg2 })
hl("Whitespace",    { fg = c.bg2 })
hl("SpecialKey",    { fg = c.bg2 })
hl("Visual",        { bg = c.bg3 })
hl("VisualNOS",     { bg = c.bg3 })
hl("MatchParen",    { bg = c.bg4 })
hl("Conceal",       { fg = c.bg4 })
hl("Directory",     { fg = c.niagara, bold = true })
hl("Title",         { fg = c.yellow, bold = true })
hl("Question",      { fg = c.green })
hl("MoreMsg",       { fg = c.green })
hl("ModeMsg",       { fg = c.fg, bold = true })
hl("ErrorMsg",      { fg = c.red })
hl("WarningMsg",    { fg = c.yellow })
hl("WildMenu",      { fg = c.bg, bg = c.yellow })
hl("QuickFixLine",  { bg = c.bg1 })

-- Search (isearch: black on fg+2, lazy highlight: fg+1 on niagara-1)
hl("Search",        { fg = c.fg1, bg = c.niagara_1 })
hl("IncSearch",     { fg = c.black, bg = c.fg2 })
hl("CurSearch",     { fg = c.black, bg = c.fg2 })
hl("Substitute",    { fg = c.black, bg = c.red })

-- Status line / tabs / winbar
hl("StatusLine",    { fg = c.white, bg = c.bg1 })
hl("StatusLineNC",  { fg = c.quartz, bg = c.bg1 })
hl("StatusLineTerm",   { fg = c.white, bg = c.bg1 })
hl("StatusLineTermNC", { fg = c.quartz, bg = c.bg1 })
hl("WinBar",        { fg = c.white, bg = c.bg })
hl("WinBarNC",      { fg = c.quartz, bg = c.bg })
hl("TabLine",       { fg = c.bg4, bg = c.bg1 })
hl("TabLineFill",   { bg = c.bg1 })
hl("TabLineSel",    { fg = c.yellow, bg = c.bg, bold = true })

-- Popup menu
hl("Pmenu",         { fg = c.fg, bg = c.bg1 })
hl("PmenuSel",      { fg = c.fg, bg = c.bg_1 })
hl("PmenuSbar",     { bg = c.bg2 })
hl("PmenuThumb",    { bg = c.bg_1 })

-- Spell
hl("SpellBad",      { undercurl = true, sp = c.red })
hl("SpellCap",      { undercurl = true, sp = c.yellow })
hl("SpellRare",     { undercurl = true, sp = c.wisteria })
hl("SpellLocal",    { undercurl = true, sp = c.green })

-- Diff
hl("DiffAdd",       { fg = c.green })
hl("DiffDelete",    { fg = c.red1 })
hl("DiffChange",    { fg = c.yellow })
hl("DiffText",      { fg = c.niagara, bg = c.bg2 })
hl("Added",         { fg = c.green })
hl("Removed",       { fg = c.red1 })
hl("Changed",       { fg = c.yellow })

---------------------------------------------------------------------------
-- Classic Vim syntax groups
-- (Emacs font-lock mapping:
--   keyword = yellow bold, builtin = yellow, comment = brown,
--   constant/type/preprocessor = quartz, function = niagara,
--   string/doc = green, variable = fg+1, warning = red)
---------------------------------------------------------------------------
hl("Comment",        { fg = c.brown })
hl("SpecialComment", { fg = c.brown })
hl("Todo",           { fg = c.red, bold = true })

hl("Constant",       { fg = c.quartz })
hl("String",         { fg = c.green })
hl("Character",      { fg = c.green })
hl("Number",         { fg = c.fg })       -- Emacs leaves numbers uncolored; try c.wisteria if you like
hl("Float",          { fg = c.fg })
hl("Boolean",        { fg = c.quartz })

hl("Identifier",     { fg = c.fg1 })
hl("Function",       { fg = c.niagara })

hl("Statement",      { fg = c.yellow, bold = true })
hl("Conditional",    { fg = c.yellow, bold = true })
hl("Repeat",         { fg = c.yellow, bold = true })
hl("Label",          { fg = c.yellow, bold = true })
hl("Keyword",        { fg = c.yellow, bold = true })
hl("Exception",      { fg = c.yellow, bold = true })
hl("Operator",       { fg = c.fg })

hl("PreProc",        { fg = c.quartz })
hl("Include",        { fg = c.quartz })
hl("Define",         { fg = c.quartz })
hl("Macro",          { fg = c.quartz })
hl("PreCondit",      { fg = c.quartz })

hl("Type",           { fg = c.quartz })
hl("StorageClass",   { fg = c.yellow, bold = true })
hl("Structure",      { fg = c.yellow, bold = true })
hl("Typedef",        { fg = c.yellow, bold = true })

hl("Special",        { fg = c.yellow })
hl("SpecialChar",    { fg = c.green })
hl("Tag",            { fg = c.niagara })
hl("Delimiter",      { fg = c.fg })
hl("Debug",          { fg = c.red })

hl("Underlined",     { fg = c.niagara, underline = true })
hl("Error",          { fg = c.red })
hl("Ignore",         { fg = c.bg4 })

---------------------------------------------------------------------------
-- Treesitter
---------------------------------------------------------------------------
local links = {
  ["@variable"]               = "Identifier",
  ["@variable.builtin"]       = "Special",
  ["@variable.parameter"]     = "Identifier",
  ["@variable.member"]        = "Identifier",
  ["@property"]               = "Identifier",
  ["@field"]                  = "Identifier",
  ["@parameter"]              = "Identifier",

  ["@constant"]               = "Constant",
  ["@constant.builtin"]       = "Constant",
  ["@constant.macro"]         = "Macro",

  ["@module"]                 = "Identifier",
  ["@namespace"]              = "Identifier",
  ["@label"]                  = "Label",

  ["@string"]                 = "String",
  ["@string.escape"]          = "SpecialChar",
  ["@string.special"]         = "SpecialChar",
  ["@character"]              = "Character",
  ["@character.special"]      = "SpecialChar",
  ["@number"]                 = "Number",
  ["@number.float"]           = "Float",
  ["@boolean"]                = "Boolean",

  ["@function"]               = "Function",
  ["@function.call"]          = "Function",
  ["@function.builtin"]       = "Special",
  ["@function.macro"]         = "Macro",
  ["@function.method"]        = "Function",
  ["@function.method.call"]   = "Function",
  ["@method"]                 = "Function",
  ["@constructor"]            = "Function",

  ["@keyword"]                = "Keyword",
  ["@keyword.function"]       = "Keyword",
  ["@keyword.return"]         = "Keyword",
  ["@keyword.operator"]       = "Keyword",
  ["@keyword.conditional"]    = "Conditional",
  ["@keyword.repeat"]         = "Repeat",
  ["@keyword.exception"]      = "Exception",
  ["@keyword.import"]         = "Include",
  ["@keyword.directive"]      = "PreProc",
  ["@keyword.directive.define"] = "Define",
  ["@keyword.storage"]        = "StorageClass",
  ["@storageclass"]           = "StorageClass",
  ["@include"]                = "Include",
  ["@preproc"]                = "PreProc",
  ["@define"]                 = "Define",
  ["@macro"]                  = "Macro",

  ["@type"]                   = "Type",
  ["@type.builtin"]           = "Type",
  ["@type.definition"]        = "Typedef",
  ["@type.qualifier"]         = "Keyword",
  ["@attribute"]              = "PreProc",

  ["@operator"]               = "Operator",
  ["@punctuation"]            = "Delimiter",
  ["@punctuation.delimiter"]  = "Delimiter",
  ["@punctuation.bracket"]    = "Delimiter",
  ["@punctuation.special"]    = "Special",

  ["@comment"]                = "Comment",
  ["@comment.documentation"]  = "String",
  ["@comment.todo"]           = "Todo",
  ["@comment.warning"]        = "Todo",
  ["@comment.error"]          = "Error",
  ["@comment.note"]           = "Comment",

  ["@tag"]                    = "Tag",
  ["@tag.attribute"]          = "Identifier",
  ["@tag.delimiter"]          = "Delimiter",

  ["@markup.heading"]         = "Title",
  ["@markup.strong"]          = { fg = c.fg, bold = true },
  ["@markup.italic"]          = { fg = c.fg, italic = true },
  ["@markup.link"]            = "Underlined",
  ["@markup.link.url"]        = "Underlined",
  ["@markup.raw"]             = "String",
  ["@markup.list"]            = "Special",
}
for group, target in pairs(links) do
  if type(target) == "string" then
    hl(group, { link = target })
  else
    hl(group, target)
  end
end

-- LSP semantic tokens: keep them consistent with the syntax colors
hl("@lsp.type.macro",       { link = "Macro" })
hl("@lsp.type.type",        { link = "Type" })
hl("@lsp.type.class",       { link = "Type" })
hl("@lsp.type.struct",      { link = "Type" })
hl("@lsp.type.enum",        { link = "Type" })
hl("@lsp.type.enumMember",  { link = "Constant" })
hl("@lsp.type.function",    { link = "Function" })
hl("@lsp.type.method",      { link = "Function" })
hl("@lsp.type.variable",    { link = "Identifier" })
hl("@lsp.type.parameter",   { link = "Identifier" })
hl("@lsp.type.property",    { link = "Identifier" })
hl("@lsp.type.namespace",   { link = "Identifier" })
hl("@lsp.type.comment",     { link = "Comment" })

---------------------------------------------------------------------------
-- Diagnostics
---------------------------------------------------------------------------
hl("DiagnosticError",          { fg = c.red })
hl("DiagnosticWarn",           { fg = c.yellow })
hl("DiagnosticInfo",           { fg = c.niagara })
hl("DiagnosticHint",           { fg = c.quartz })
hl("DiagnosticOk",             { fg = c.green })
hl("DiagnosticVirtualTextError", { fg = c.red })
hl("DiagnosticVirtualTextWarn",  { fg = c.yellow })
hl("DiagnosticVirtualTextInfo",  { fg = c.niagara })
hl("DiagnosticVirtualTextHint",  { fg = c.quartz })
hl("DiagnosticUnderlineError", { undercurl = true, sp = c.red })
hl("DiagnosticUnderlineWarn",  { undercurl = true, sp = c.yellow })
hl("DiagnosticUnderlineInfo",  { undercurl = true, sp = c.niagara })
hl("DiagnosticUnderlineHint",  { undercurl = true, sp = c.quartz })
hl("DiagnosticUnderlineOk",    { undercurl = true, sp = c.green })
hl("LspReferenceText",         { bg = c.bg3 })
hl("LspReferenceRead",         { bg = c.bg3 })
hl("LspReferenceWrite",        { bg = c.bg3 })
hl("LspSignatureActiveParameter", { fg = c.yellow, bold = true })

---------------------------------------------------------------------------
-- Plugins
---------------------------------------------------------------------------
-- gitsigns
hl("GitSignsAdd",     { fg = c.green })
hl("GitSignsChange",  { fg = c.yellow })
hl("GitSignsDelete",  { fg = c.red })

-- indent-blankline
hl("IblIndent",       { fg = c.bg1 })
hl("IblScope",        { fg = c.bg4 })

-- Telescope
hl("TelescopeNormal",         { fg = c.fg, bg = c.bg })
hl("TelescopeBorder",         { fg = c.bg4, bg = c.bg })
hl("TelescopePromptNormal",   { fg = c.fg, bg = c.bg1 })
hl("TelescopePromptBorder",   { fg = c.bg1, bg = c.bg1 })
hl("TelescopePromptTitle",    { fg = c.bg, bg = c.yellow, bold = true })
hl("TelescopePreviewTitle",   { fg = c.bg, bg = c.green, bold = true })
hl("TelescopeResultsTitle",   { fg = c.bg, bg = c.niagara, bold = true })
hl("TelescopeSelection",      { bg = c.bg1 })
hl("TelescopeMatching",       { fg = c.yellow, bold = true })

-- nvim-cmp (company-mode colors from the Emacs theme)
hl("CmpItemAbbr",             { fg = c.fg })
hl("CmpItemAbbrMatch",        { fg = c.green })
hl("CmpItemAbbrMatchFuzzy",   { fg = c.green })
hl("CmpItemAbbrDeprecated",   { fg = c.bg4, strikethrough = true })
hl("CmpItemMenu",             { fg = c.brown })
hl("CmpItemKind",             { fg = c.brown })

-- blink.cmp
hl("BlinkCmpMenu",            { fg = c.fg, bg = c.bg1 })
hl("BlinkCmpMenuSelection",   { bg = c.bg_1 })
hl("BlinkCmpLabelMatch",      { fg = c.green })

-- Netrw / NvimTree / neo-tree
hl("NvimTreeFolderName",      { fg = c.niagara })
hl("NvimTreeOpenedFolderName",{ fg = c.niagara, bold = true })
hl("NvimTreeRootFolder",      { fg = c.yellow, bold = true })
hl("NvimTreeExecFile",        { fg = c.green })
hl("NvimTreeSymlink",         { fg = c.yellow })
hl("NeoTreeDirectoryName",    { fg = c.niagara })
hl("NeoTreeDirectoryIcon",    { fg = c.niagara })

-- Oil
hl("OilDir",                  { fg = c.niagara, bold = true })

-- Whichkey
hl("WhichKey",                { fg = c.yellow })
hl("WhichKeyDesc",            { fg = c.fg })
hl("WhichKeyGroup",           { fg = c.niagara })

---------------------------------------------------------------------------
-- Terminal colors (term-color-* from the Emacs theme)
---------------------------------------------------------------------------
vim.g.terminal_color_0  = c.bg3
vim.g.terminal_color_1  = c.red_1
vim.g.terminal_color_2  = c.green
vim.g.terminal_color_3  = c.yellow
vim.g.terminal_color_4  = c.niagara
vim.g.terminal_color_5  = c.wisteria
vim.g.terminal_color_6  = c.quartz
vim.g.terminal_color_7  = c.fg
vim.g.terminal_color_8  = c.bg4
vim.g.terminal_color_9  = c.red1
vim.g.terminal_color_10 = c.green
vim.g.terminal_color_11 = c.yellow
vim.g.terminal_color_12 = c.niagara
vim.g.terminal_color_13 = c.wisteria
vim.g.terminal_color_14 = c.quartz
vim.g.terminal_color_15 = c.white

local plain_groups = {
  "@function", "@function.call", "@function.method",
  "@function.method.call", "@constructor",
  "@constant", "@constant.macro",
  "@lsp.type.function", "@lsp.type.method",
  "@lsp.type.macro", "@lsp.type.enumMember",
}

for _, lang in ipairs({ "c", "cpp", "rust" }) do
  for _, g in ipairs(plain_groups) do
    hl(g .. "." .. lang, { fg = c.fg })
  end
  -- NULL / true / false stay colored
  hl("@constant.builtin." .. lang, { fg = c.quartz })
end
