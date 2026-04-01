vim.cmd('highlight clear')
vim.g.colors_name = 'imperial'

local p = {
  bg        = '#000000',
  bg_light  = '#1a1a1a',
  bg_subtle = '#1a0000',
  bg_mid    = '#140000',
  bg_dim    = '#0f0000',
  green     = '#ffffff',
  green_mid = '#cccccc',
  green_dk  = '#aaaaaa',
  green_dim = '#666666',
  green_lt  = '#ff6600',
  red       = '#cc0000',
  red_bright = '#ff0000',
  orange    = '#ff6600',
  yellow    = '#ffff00',
  white     = '#ffffff',
  black     = '#000000',
  grey      = '#cccccc',
  grey_dk   = '#666666',
  grey_bg   = '#333333',
  bg_dark   = '#1a1a1a',
}

local hl = function(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Core
hl('Normal',      { fg = p.white, bg = p.bg })
hl('Comment',     { fg = p.green_dim, italic = true })
hl('LineNr',      { fg = p.green_dim })
hl('CursorLine',  { bg = p.bg_light })
hl('Visual',      { bg = p.bg_subtle })

-- Syntax
hl('Keyword',    { fg = p.red, bold = true })
hl('Function',   { fg = p.white })
hl('String',     { fg = p.grey })
hl('Identifier', { fg = p.green_dk })
hl('Type',       { fg = p.white })
hl('Constant',   { fg = p.white })
hl('Special',    { fg = p.orange })
hl('Delimiter',  { fg = p.grey })

-- Treesitter
hl('@function',              { fg = p.white })
hl('@function.call',         { fg = p.grey })
hl('@function.builtin',      { fg = p.orange })
hl('@method',                { fg = p.white })
hl('@method.call',           { fg = p.grey })
hl('@type',                  { fg = p.white })
hl('@type.builtin',          { fg = p.orange })
hl('@keyword',               { fg = p.red, bold = true })
hl('@keyword.function',      { fg = p.red, bold = true })
hl('@variable',              { fg = p.grey })
hl('@variable.builtin',      { fg = p.orange })
hl('@constant',              { fg = p.white })
hl('@constant.builtin',      { fg = p.orange })
hl('@punctuation.bracket',   { fg = p.white })
hl('@punctuation.delimiter', { fg = p.grey })
hl('@punctuation.special',   { fg = p.orange })

-- UI elements
hl('FloatBorder',  { fg = p.red, bold = true })
hl('VertSplit',    { fg = p.red, bg = p.bg, bold = true })
hl('WinSeparator', { fg = p.red, bg = p.bg, bold = true })

-- Neo-tree
hl('NeoTreeNormal',        { fg = p.white, bg = p.bg })
hl('NeoTreeNormalNC',      { fg = p.white, bg = p.bg })
hl('NeoTreeDirectoryName', { fg = p.white })
hl('NeoTreeDirectoryIcon', { fg = p.red })
hl('NeoTreeFileName',      { fg = p.grey })
hl('NeoTreeFileIcon',      { fg = p.green_dim })
hl('NeoTreeGitModified',   { fg = p.red })
hl('NeoTreeGitAdded',      { fg = p.white })
hl('NeoTreeIndentMarker',  { fg = p.green_dim })

-- Terminal
hl('Terminal',       { fg = p.white, bg = p.bg_light })
hl('TerminalNormal', { fg = p.white, bg = p.bg_light })

-- Gitsigns
hl('GitSignsAdd',    { fg = p.white })
hl('GitSignsChange', { fg = p.orange })
hl('GitSignsDelete', { fg = p.red })

-- Alpha dashboard
hl('AlphaHeader',  { fg = p.white })
hl('AlphaButtons', { fg = p.grey })
hl('AlphaFooter',  { fg = p.orange })

-- Render-markdown
hl('RenderMarkdownH1',         { fg = p.white, bold = true })
hl('RenderMarkdownH2',         { fg = p.white, bold = true })
hl('RenderMarkdownH3',         { fg = p.red, bold = true })
hl('RenderMarkdownH4',         { fg = p.red })
hl('RenderMarkdownH5',         { fg = p.grey })
hl('RenderMarkdownH6',         { fg = p.grey })
hl('RenderMarkdownH1Bg',       { bg = p.bg_subtle })
hl('RenderMarkdownH2Bg',       { bg = p.bg_mid })
hl('RenderMarkdownH3Bg',       { bg = p.bg_dim })
hl('RenderMarkdownH4Bg',       {})
hl('RenderMarkdownH5Bg',       {})
hl('RenderMarkdownH6Bg',       {})
hl('RenderMarkdownCode',       { fg = p.grey, bg = p.bg_light })
hl('RenderMarkdownCodeInline', { fg = p.orange, bg = p.bg_light })
hl('RenderMarkdownBullet',     { fg = p.red })
hl('RenderMarkdownQuote',      { fg = p.green_dim, italic = true })
hl('RenderMarkdownDash',       { fg = p.red })
hl('RenderMarkdownLink',       { fg = p.orange, underline = true })
hl('RenderMarkdownTableHead',  { fg = p.white, bold = true })
hl('RenderMarkdownTableRow',   { fg = p.grey })

-- Shared palette for lualine/plugins
_G.theme_palette = p

-- Terminal palette (Imperial)
vim.g.terminal_color_0  = '#1a1a1a'
vim.g.terminal_color_1  = '#cc0000'
vim.g.terminal_color_2  = '#6a6a6a'
vim.g.terminal_color_3  = '#ffff00'
vim.g.terminal_color_4  = '#0066cc'
vim.g.terminal_color_5  = '#cc0000'
vim.g.terminal_color_6  = '#ff6600'
vim.g.terminal_color_7  = '#f0f0f0'
vim.g.terminal_color_8  = '#5a5a5a'
vim.g.terminal_color_9  = '#ff0000'
vim.g.terminal_color_10 = '#8a8a8a'
vim.g.terminal_color_11 = '#ffff00'
vim.g.terminal_color_12 = '#0066cc'
vim.g.terminal_color_13 = '#ff0000'
vim.g.terminal_color_14 = '#ff6600'
vim.g.terminal_color_15 = '#ffffff'
