local palette = require('palette')

-- Setup mini.base16
require('mini.base16').setup({
  palette = palette,
  use_cterm = true,
  plugins = {
    default = true,
  },
})

vim.g.colors_name = "cactusbuddy"

-- Helper to set custom overrides
local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ==============================================================================
-- CUSTOM OVERRIDES (SPECIFIC COLORS/STYLES)
-- ==============================================================================

hl('Normal',       { fg = palette.base06, bg = palette.base00 })
hl('Header',       { fg = palette.base07 })
hl('Noise',        { fg = palette.base05 })
hl('Comment',      { fg = palette.base04 })
hl('LspInlayHint', { fg = palette.base03 })
hl('Special',      { fg = palette.base0E })
hl('Number',       { fg = palette.base0C })
hl('Title',        { fg = palette.base0D })
hl('Todo',         { fg = palette.base0F })
hl('Error',        { fg = palette.base08 })
hl('Warning',      { fg = palette.base09 })

hl('User1',        { fg = palette.base0A })
hl('User2',        { fg = palette.base0D })
hl('User3',        { fg = palette.base08 })

hl('StatusLine',   { bg = palette.base01 })
hl('StatusLineNC', { fg = palette.base04, bg = palette.base01 })

hl('Search',       { fg = palette.base0F, underline = true })
hl('CurSearch',    { fg = palette.base00, bg = palette.base0F, underline = true, sp = palette.base0F })
hl('IncSearch',    { link = 'CurSearch' })

hl('MatchParen',   { fg = palette.base0D })

hl('DiagnosticUnderlineError', { underline = true, sp = palette.base08 })
hl('DiagnosticUnderlineWarn',  { underline = true, sp = palette.base09 })
hl('DiagnosticUnderlineHint',  { underline = true })
hl('DiagnosticUnderlineInfo',  { underline = true })

-- ==============================================================================
-- HIGHLIGHT LINK OVERRIDES
-- ==============================================================================

-- Standard Syntax Links
hl('Boolean',           { link = 'Number' })
hl('Character',         { link = 'Number' })
hl('Conditional',       { link = 'Noise' })
hl('Constant',          { link = 'Normal' })
hl('Debug',             { link = 'Todo' })
hl('Delimiter',         { link = 'Normal' })
hl('Directory',         { link = 'String' })
hl('Exception',         { link = 'Noise' })
hl('Function',          { link = 'Normal' })
hl('Identifier',        { link = 'Normal' })
hl('Include',           { link = 'Noise' })
hl('Keyword',           { link = 'Noise' })
hl('Label',             { link = 'User2' })
hl('Macro',             { link = 'Noise' })
hl('Operator',          { link = 'Noise' })
hl('PreProc',           { link = 'Noise' })
hl('Repeat',            { link = 'Noise' })
hl('SpecialChar',       { link = 'Special' })
hl('SpecialKey',        { link = 'Special' })
hl('Statement',         { link = 'Normal' })
hl('StorageClass',      { link = 'Noise' })
hl('Structure',         { link = 'Noise' })
hl('Tag',               { link = 'User2' })
hl('Type',              { link = 'Normal' })
hl('TypeDef',           { link = 'Normal' })

-- Language Specific Links
hl('@constant.builtin', { link = 'User1' })
hl('@constructor',      { link = 'Noise' })
hl('@exception.operator', { link = 'Special' })
hl('@keyword.storage',  { link = 'User2' })
hl('@punctuation.special', { link = 'Normal' })
hl('@variable',         { link = 'Normal' })
hl('@variable.builtin', { link = 'String' })
hl('@function.macro',   { link = 'Macro' })
hl('@keyword.return',   { link = 'Noise' })
hl('@namespace',        { link = 'Include' })
hl('@number.float',     { link = 'Number' })
hl('@self',             { link = 'String' })
hl('@type.builtin',     { link = 'Include' })
hl('@type.qualifier',   { link = 'Keyword' })

hl('rustCommentBlockDoc',   { link = 'Comment' })
hl('rustCommentLineDoc',    { link = 'Comment' })
hl('rustModPathSep',        { link = 'Include' })
hl('rustSelf',              { link = 'String' })
hl('rustEnumVariant',       { link = 'User1' })

-- UI Elements Links
hl('ColorColumn',   { link = 'CursorLine' })
hl('Conceal',       { link = 'Comment' })
hl('CursorLine',    { link = 'StatusLine' })
hl('CursorLineNr',  { link = 'Normal' })
hl('EndOfBuffer',   { link = 'NonText' })
hl('ErrorMsg',      { link = 'Error' })
hl('FloatBorder',   { link = 'NonText' })
hl('FoldColumn',    { link = 'LineNr' })
hl('Folded',        { link = 'NonText' })
hl('LineNr',        { link = 'NonText' })
hl('ModeMsg',       { link = 'Normal' })
hl('MoreMsg',       { link = 'Normal' })
hl('NormalFloat',   { link = 'Normal' })
hl('Question',      { link = 'Warning' })
hl('SignColumn',    { link = 'LineNr' })
hl('TabLine',       { link = 'Normal' })
hl('TabLineFill',   { link = 'Normal' })
hl('TabLineSel',    { link = 'Special' })
hl('VertSplit',     { link = 'NonText' })
hl('WarningMsg',    { link = 'Warning' })
hl('Whitespace',    { link = 'NonText' })
hl('WinSeparator',  { link = 'NonText' })
hl('NvimInternalError', { link = 'Error' })

-- Plugin Specific Links

-- diagnostics and git signs
hl('DiagnosticError',       { link = 'Error' })
hl('DiagnosticWarn',        { link = 'Warning' })
hl('DiagnosticHint',        { link = 'Comment' })
hl('DiagnosticInfo',        { link = 'Comment' })
hl('DiagnosticOk',          { link = 'String' })

hl('GitSignsAdd',           { link = 'NonText' })
hl('GitSignsChange',        { link = 'NonText' })
hl('GitSignsDelete',        { link = 'NonText' })

-- aerial
hl('AerialInterfaceIcon',   { link = 'User2' })
hl('AerialLine',            { link = 'Special' })
hl('AerialStructIcon',      { link = 'User1' })

-- mini.diff
hl('MiniDiffSignAdd',       { link = 'NonText' })
hl('MiniDiffSignChange',    { link = 'NonText' })
hl('MiniDiffSignDelete',    { link = 'NonText' })

-- nvim-tree
hl('NvimTreeExecFile',      { link = 'User1' })
hl('NvimTreeGitDeleted',    { link = 'Noise' })
hl('NvimTreeGitDirty',      { link = 'Noise' })
hl('NvimTreeGitIgnored',    { link = 'Noise' })
hl('NvimTreeGitMerge',      { link = 'Warning' })
hl('NvimTreeGitNew',        { link = 'Noise' })
hl('NvimTreeGitRenamed',    { link = 'Noise' })
hl('NvimTreeGitStaged',     { link = 'Noise' })
hl('NvimTreeImageFile',     { link = 'Noise' })
hl('NvimTreeIndentMarker',  { link = 'String' })
hl('NvimTreeRootFolder',    { link = 'Noise' })
hl('NvimTreeSpecialFile',   { link = 'Noise' })
hl('NvimTreeSymlink',       { link = 'User2' })
hl('NvimTreeWindowPicker',  { link = 'PmenuThumb' })

-- telescope
hl('TelescopeBorder',       { link = 'Noise' })
hl('TelescopeMatching',     { link = 'User1' })
hl('TelescopePromptCounter', { link = 'Noise' })
