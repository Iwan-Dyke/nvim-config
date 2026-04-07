vim.cmd('highlight clear')
vim.g.colors_name = 'matrix'

local p = require('config.palette').get('matrix')

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
hl('Keyword',    { fg = p.primary, bold = true })
hl('Function',   { fg = p.primary })
hl('String',     { fg = p.primary_mid })
hl('Identifier', { fg = p.primary_mid })
hl('Type',       { fg = p.primary })
hl('Constant',   { fg = p.primary })
hl('Special',    { fg = p.accent })
hl('Delimiter',  { fg = p.primary_dk })

-- Treesitter
hl('@function',              { fg = p.primary })
hl('@function.call',         { fg = p.primary_dk })
hl('@function.builtin',      { fg = p.accent })
hl('@method',                { fg = p.primary })
hl('@method.call',           { fg = p.primary_dk })
hl('@type',                  { fg = p.primary })
hl('@type.builtin',          { fg = p.accent })
hl('@keyword',               { fg = p.primary, bold = true })
hl('@keyword.function',      { fg = p.primary, bold = true })
hl('@variable',              { fg = p.primary_mid })
hl('@variable.builtin',      { fg = p.accent })
hl('@constant',              { fg = p.primary })
hl('@constant.builtin',      { fg = p.accent })
hl('@punctuation.bracket',   { fg = p.primary_dk })
hl('@punctuation.delimiter', { fg = p.primary_dk })
hl('@punctuation.special',   { fg = p.accent })

-- UI elements
hl('FloatBorder',  { fg = p.primary, bold = true })
hl('VertSplit',    { fg = p.primary, bg = p.bg, bold = true })
hl('WinSeparator', { fg = p.primary, bg = p.bg, bold = true })

-- Neo-tree
hl('NeoTreeNormal',        { fg = p.primary, bg = p.bg })
hl('NeoTreeNormalNC',      { fg = p.primary, bg = p.bg })
hl('NeoTreeDirectoryName', { fg = p.primary })
hl('NeoTreeDirectoryIcon', { fg = p.primary_dk })
hl('NeoTreeFileName',      { fg = p.primary_mid })
hl('NeoTreeFileIcon',      { fg = p.muted })
hl('NeoTreeGitModified',   { fg = p.yellow })
hl('NeoTreeGitAdded',      { fg = p.primary })
hl('NeoTreeIndentMarker',  { fg = p.muted })

-- Terminal
hl('Terminal',       { fg = p.primary, bg = p.bg_light })
hl('TerminalNormal', { fg = p.primary, bg = p.bg_light })

-- Gitsigns
hl('GitSignsAdd',    { fg = p.white })
hl('GitSignsChange', { fg = p.orange })
hl('GitSignsDelete', { fg = p.red })

-- Alpha dashboard
hl('AlphaHeader',  { fg = p.primary })
hl('AlphaButtons', { fg = p.primary_dk })
hl('AlphaFooter',  { fg = p.muted })

-- Render-markdown
hl('RenderMarkdownH1',         { fg = p.primary, bold = true })
hl('RenderMarkdownH2',         { fg = p.primary, bold = true })
hl('RenderMarkdownH3',         { fg = p.primary_dk, bold = true })
hl('RenderMarkdownH4',         { fg = p.primary_dk })
hl('RenderMarkdownH5',         { fg = p.primary_mid })
hl('RenderMarkdownH6',         { fg = p.primary_mid })
hl('RenderMarkdownH1Bg',       { bg = p.bg_subtle })
hl('RenderMarkdownH2Bg',       { bg = p.bg_mid })
hl('RenderMarkdownH3Bg',       { bg = p.bg_dim })
hl('RenderMarkdownH4Bg',       {})
hl('RenderMarkdownH5Bg',       {})
hl('RenderMarkdownH6Bg',       {})
hl('RenderMarkdownCode',       { fg = p.primary_mid, bg = p.bg_light })
hl('RenderMarkdownCodeInline', { fg = p.accent, bg = p.bg_light })
hl('RenderMarkdownBullet',     { fg = p.primary })
hl('RenderMarkdownQuote',      { fg = p.muted, italic = true })
hl('RenderMarkdownDash',       { fg = p.primary_dk })
hl('RenderMarkdownLink',       { fg = p.accent, underline = true })
hl('RenderMarkdownTableHead',  { fg = p.primary, bold = true })
hl('RenderMarkdownTableRow',   { fg = p.primary_mid })

-- DAP (debugger)
hl('DapBreakpoint',        { fg = p.red })
hl('DapStopped',           { fg = p.primary, bg = p.bg_subtle })
hl('DapBreakpointLine',    {})
hl('DapStoppedLine',       { bg = p.bg_subtle })

-- Shared palette for lualine/plugins
_G.theme_palette = p

-- Terminal palette (matched to Windows Terminal Matrix scheme)
vim.g.terminal_color_0  = '#000000'
vim.g.terminal_color_1  = '#004D00'
vim.g.terminal_color_2  = p.primary
vim.g.terminal_color_3  = '#7FFF00'
vim.g.terminal_color_4  = '#003B00'
vim.g.terminal_color_5  = '#00FF80'
vim.g.terminal_color_6  = '#39FF14'
vim.g.terminal_color_7  = '#B0FFB0'
vim.g.terminal_color_8  = '#006600'
vim.g.terminal_color_9  = '#00CC44'
vim.g.terminal_color_10 = '#7FFF00'
vim.g.terminal_color_11 = '#CCFF00'
vim.g.terminal_color_12 = '#00AA44'
vim.g.terminal_color_13 = '#66FFB2'
vim.g.terminal_color_14 = '#00FFAA'
vim.g.terminal_color_15 = p.white
