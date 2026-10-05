vim.cmd('highlight clear')
vim.g.colors_name = 'skynet'

local p = require('config.palette').get('skynet')

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Core
hl('Normal',      { fg = p.primary, bg = p.bg })
hl('Comment',     { fg = p.muted, italic = true })
hl('LineNr',      { fg = p.primary_dk })
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
hl('@function.builtin',      { fg = p.primary_lt })
hl('@method',                { fg = p.primary })
hl('@method.call',           { fg = p.primary_mid })
hl('@type',                  { fg = p.white })
hl('@type.builtin',          { fg = p.primary_lt })
hl('@keyword',               { fg = p.white, bold = true })
hl('@keyword.function',      { fg = p.white, bold = true })
hl('@variable',              { fg = p.primary })
hl('@variable.builtin',      { fg = p.primary_lt })
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
hl('VertSplit',    { fg = p.primary_dk, bg = p.bg })
hl('WinSeparator', { fg = p.primary_dk, bg = p.bg })

-- Neo-tree
hl('NeoTreeNormal',        { fg = p.primary, bg = p.bg })
hl('NeoTreeNormalNC',      { fg = p.primary, bg = p.bg })
hl('NeoTreeDirectoryName', { fg = p.primary_lt })
hl('NeoTreeDirectoryIcon', { fg = p.primary_dk })
hl('NeoTreeFileName',      { fg = p.grey })
hl('NeoTreeFileIcon',      { fg = p.muted })
hl('NeoTreeGitModified',   { fg = p.accent })
hl('NeoTreeGitAdded',      { fg = p.primary_lt })
hl('NeoTreeIndentMarker',  { fg = p.grey_dk })

-- Terminal
hl('Terminal',       { fg = p.primary, bg = p.bg_light })
hl('TerminalNormal', { fg = p.primary, bg = p.bg_light })

-- Gitsigns
hl('GitSignsAdd',    { fg = p.primary_lt })
hl('GitSignsChange', { fg = p.accent })
hl('GitSignsDelete', { fg = p.red })

-- Alpha dashboard
hl('AlphaHeader',  { fg = p.red })
hl('AlphaButtons', { fg = p.primary_mid })
hl('AlphaFooter',  { fg = p.muted })

-- Render-markdown
hl('RenderMarkdownH1',         { fg = p.primary_lt, bold = true })
hl('RenderMarkdownH2',         { fg = p.primary, bold = true })
hl('RenderMarkdownH3',         { fg = p.primary_mid, bold = true })
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
hl('RenderMarkdownDash',       { fg = p.grey_dk })
hl('RenderMarkdownLink',       { fg = p.primary_lt, underline = true })
hl('RenderMarkdownTableHead',  { fg = p.white, bold = true })
hl('RenderMarkdownTableRow',   { fg = p.primary })

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

-- Terminal palette (Skynet)
vim.g.terminal_color_0  = '#0a0000'
vim.g.terminal_color_1  = '#ff0000'
vim.g.terminal_color_2  = '#ff3030'
vim.g.terminal_color_3  = '#ff6600'
vim.g.terminal_color_4  = '#881515'
vim.g.terminal_color_5  = '#aa3030'
vim.g.terminal_color_6  = '#cc2020'
vim.g.terminal_color_7  = '#ff3030'
vim.g.terminal_color_8  = '#441010'
vim.g.terminal_color_9  = '#ff4444'
vim.g.terminal_color_10 = '#ff6060'
vim.g.terminal_color_11 = '#ff8040'
vim.g.terminal_color_12 = '#cc2020'
vim.g.terminal_color_13 = '#cc4040'
vim.g.terminal_color_14 = '#ff6060'
vim.g.terminal_color_15 = '#ffcccc'
