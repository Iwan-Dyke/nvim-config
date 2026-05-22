vim.cmd('highlight clear')
vim.g.colors_name = 'wayne-tech'

local p = require('config.palette').get('wayne-tech')

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Core
hl('Normal',      { fg = p.primary, bg = p.bg })
hl('Comment',     { fg = p.muted, italic = true })
hl('LineNr',      { fg = p.muted })
hl('CursorLine',  { bg = p.bg_light })
hl('Visual',      { bg = p.bg_subtle })

-- Syntax
hl('Keyword',    { fg = p.white, bold = true })
hl('Function',   { fg = p.primary })
hl('String',     { fg = p.grey })
hl('Identifier', { fg = p.primary_mid })
hl('Type',       { fg = p.white })
hl('Constant',   { fg = p.accent })
hl('Special',    { fg = p.accent })
hl('Delimiter',  { fg = p.primary_dim })

-- Treesitter
hl('@function',              { fg = p.primary })
hl('@function.call',         { fg = p.primary_mid })
hl('@function.builtin',      { fg = p.accent })
hl('@method',                { fg = p.primary })
hl('@method.call',           { fg = p.primary_mid })
hl('@type',                  { fg = p.white })
hl('@type.builtin',          { fg = p.accent })
hl('@keyword',               { fg = p.white, bold = true })
hl('@keyword.function',      { fg = p.white, bold = true })
hl('@variable',              { fg = p.primary })
hl('@variable.builtin',      { fg = p.accent })
hl('@constant',              { fg = p.accent })
hl('@constant.builtin',      { fg = p.accent })
hl('@punctuation.bracket',   { fg = p.primary_dim })
hl('@punctuation.delimiter', { fg = p.primary_dim })
hl('@punctuation.special',   { fg = p.accent })

-- Completion menu
hl('Pmenu',      { fg = p.primary_mid, bg = p.bg_light })
hl('PmenuSel',   { fg = p.white, bg = p.bg_subtle })
hl('PmenuSbar',  { bg = p.bg_subtle })
hl('PmenuThumb', { bg = p.primary_dk })

-- UI elements
hl('FloatBorder',  { fg = p.primary_dk, bold = true })
hl('VertSplit',    { fg = p.primary_dk, bg = p.bg, bold = true })
hl('WinSeparator', { fg = p.primary_dk, bg = p.bg, bold = true })

-- Neo-tree
hl('NeoTreeNormal',        { fg = p.primary, bg = p.bg })
hl('NeoTreeNormalNC',      { fg = p.primary, bg = p.bg })
hl('NeoTreeDirectoryName', { fg = p.primary_mid })
hl('NeoTreeDirectoryIcon', { fg = p.primary_dk })
hl('NeoTreeFileName',      { fg = p.grey })
hl('NeoTreeFileIcon',      { fg = p.muted })
hl('NeoTreeGitModified',   { fg = p.orange })
hl('NeoTreeGitAdded',      { fg = p.accent })
hl('NeoTreeIndentMarker',  { fg = p.muted })

-- Terminal
hl('Terminal',       { fg = p.primary, bg = p.bg_light })
hl('TerminalNormal', { fg = p.primary, bg = p.bg_light })

-- Gitsigns
hl('GitSignsAdd',    { fg = p.accent })
hl('GitSignsChange', { fg = p.orange })
hl('GitSignsDelete', { fg = p.red })

-- Alpha dashboard
hl('AlphaHeader',  { fg = p.primary_dk })
hl('AlphaButtons', { fg = p.primary_mid })
hl('AlphaFooter',  { fg = p.muted })

-- Render-markdown
hl('RenderMarkdownH1',         { fg = p.primary_lt, bold = true })
hl('RenderMarkdownH2',         { fg = p.primary_mid, bold = true })
hl('RenderMarkdownH3',         { fg = p.primary_dk, bold = true })
hl('RenderMarkdownH4',         { fg = p.primary_dk })
hl('RenderMarkdownH5',         { fg = p.grey })
hl('RenderMarkdownH6',         { fg = p.grey })
hl('RenderMarkdownH1Bg',       { bg = p.bg_subtle })
hl('RenderMarkdownH2Bg',       { bg = p.bg_mid })
hl('RenderMarkdownH3Bg',       { bg = p.bg_dim })
hl('RenderMarkdownH4Bg',       {})
hl('RenderMarkdownH5Bg',       {})
hl('RenderMarkdownH6Bg',       {})
hl('RenderMarkdownCode',       { fg = p.primary_mid, bg = p.bg_light })
hl('RenderMarkdownCodeInline', { fg = p.accent, bg = p.bg_light })
hl('RenderMarkdownBullet',     { fg = p.primary_dk })
hl('RenderMarkdownQuote',      { fg = p.muted, italic = true })
hl('RenderMarkdownDash',       { fg = p.grey })
hl('RenderMarkdownLink',       { fg = p.accent, underline = true })
hl('RenderMarkdownTableHead',  { fg = p.primary_lt, bold = true })
hl('RenderMarkdownTableRow',   { fg = p.primary_mid })

-- DAP (debugger)
hl('DapBreakpoint',        { fg = p.red })
hl('DapStopped',           { fg = p.accent, bg = p.bg_subtle })
hl('DapBreakpointLine',    {})
hl('DapStoppedLine',       { bg = p.bg_subtle })

-- Diagnostics
hl('DiagnosticError',      { fg = p.red })
hl('DiagnosticWarn',       { fg = p.orange })
hl('DiagnosticInfo',       { fg = p.primary_mid })
hl('DiagnosticHint',       { fg = p.muted })
hl('DiagnosticSignError',  { fg = p.red })
hl('DiagnosticSignWarn',   { fg = p.orange })
hl('DiagnosticSignInfo',   { fg = p.primary_mid })
hl('DiagnosticSignHint',   { fg = p.muted })
hl('Error',                { fg = p.red })
hl('ErrorMsg',             { fg = p.red })
hl('WarningMsg',           { fg = p.orange })
hl('NvimInternalError',    { fg = p.red })
hl('@error',               { fg = p.red })
hl('@text.danger',         { fg = p.red })

-- Shared palette for lualine/plugins
_G.theme_palette = p

-- Terminal palette (Batcomputer)
vim.g.terminal_color_0  = '#121a24'
vim.g.terminal_color_1  = '#8b3040'
vim.g.terminal_color_2  = '#4fc3f7'
vim.g.terminal_color_3  = '#c0a050'
vim.g.terminal_color_4  = '#1a6baa'
vim.g.terminal_color_5  = '#5a5080'
vim.g.terminal_color_6  = '#4fc3f7'
vim.g.terminal_color_7  = '#a0b4cc'
vim.g.terminal_color_8  = '#2a3a4a'
vim.g.terminal_color_9  = '#a04050'
vim.g.terminal_color_10 = '#6ad4f7'
vim.g.terminal_color_11 = '#d0b060'
vim.g.terminal_color_12 = '#6a9fd8'
vim.g.terminal_color_13 = '#7a70a0'
vim.g.terminal_color_14 = '#6ad4f7'
vim.g.terminal_color_15 = '#e0eaf5'
