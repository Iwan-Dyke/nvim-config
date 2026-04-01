vim.cmd('highlight clear')
vim.g.colors_name = 'matrix'

local p = {
  bg        = '#000000',
  bg_light  = '#0a0a0a',
  bg_subtle = '#001a00',
  bg_mid    = '#001400',
  bg_dim    = '#000f00',
  green     = '#00ff41',
  green_mid = '#33ff77',
  green_dk  = '#00cc33',
  green_dim = '#006622',
  green_lt  = '#66ff99',
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
hl('Normal',      { fg = p.green, bg = p.bg })
hl('Comment',     { fg = p.green_dim, italic = true })
hl('LineNr',      { fg = p.green_dim })
hl('CursorLine',  { bg = p.bg_light })
hl('Visual',      { bg = p.bg_subtle })

-- Syntax
hl('Keyword',    { fg = p.green, bold = true })
hl('Function',   { fg = p.green })
hl('String',     { fg = p.green_mid })
hl('Identifier', { fg = p.green_mid })
hl('Type',       { fg = p.green })
hl('Constant',   { fg = p.green })
hl('Special',    { fg = p.green_lt })
hl('Delimiter',  { fg = p.green_dk })

-- Treesitter
hl('@function',              { fg = p.green })
hl('@function.call',         { fg = p.green_dk })
hl('@function.builtin',      { fg = p.green_lt })
hl('@method',                { fg = p.green })
hl('@method.call',           { fg = p.green_dk })
hl('@type',                  { fg = p.green })
hl('@type.builtin',          { fg = p.green_lt })
hl('@keyword',               { fg = p.green, bold = true })
hl('@keyword.function',      { fg = p.green, bold = true })
hl('@variable',              { fg = p.green_mid })
hl('@variable.builtin',      { fg = p.green_lt })
hl('@constant',              { fg = p.green })
hl('@constant.builtin',      { fg = p.green_lt })
hl('@punctuation.bracket',   { fg = p.green_dk })
hl('@punctuation.delimiter', { fg = p.green_dk })
hl('@punctuation.special',   { fg = p.green_lt })

-- UI elements
hl('FloatBorder',  { fg = p.green, bold = true })
hl('VertSplit',    { fg = p.green, bg = p.bg, bold = true })
hl('WinSeparator', { fg = p.green, bg = p.bg, bold = true })

-- Neo-tree
hl('NeoTreeNormal',        { fg = p.green, bg = p.bg })
hl('NeoTreeNormalNC',      { fg = p.green, bg = p.bg })
hl('NeoTreeDirectoryName', { fg = p.green })
hl('NeoTreeDirectoryIcon', { fg = p.green_dk })
hl('NeoTreeFileName',      { fg = p.green_mid })
hl('NeoTreeFileIcon',      { fg = p.green_dim })
hl('NeoTreeGitModified',   { fg = p.yellow })
hl('NeoTreeGitAdded',      { fg = p.green })
hl('NeoTreeIndentMarker',  { fg = p.green_dim })

-- Terminal
hl('Terminal',       { fg = p.green, bg = p.bg_light })
hl('TerminalNormal', { fg = p.green, bg = p.bg_light })

-- Gitsigns
hl('GitSignsAdd',    { fg = p.white })
hl('GitSignsChange', { fg = p.orange })
hl('GitSignsDelete', { fg = p.red })

-- Alpha dashboard
hl('AlphaHeader',  { fg = p.green })
hl('AlphaButtons', { fg = p.green_dk })
hl('AlphaFooter',  { fg = p.green_dim })

-- Render-markdown
hl('RenderMarkdownH1',         { fg = p.green, bold = true })
hl('RenderMarkdownH2',         { fg = p.green, bold = true })
hl('RenderMarkdownH3',         { fg = p.green_dk, bold = true })
hl('RenderMarkdownH4',         { fg = p.green_dk })
hl('RenderMarkdownH5',         { fg = p.green_mid })
hl('RenderMarkdownH6',         { fg = p.green_mid })
hl('RenderMarkdownH1Bg',       { bg = p.bg_subtle })
hl('RenderMarkdownH2Bg',       { bg = p.bg_mid })
hl('RenderMarkdownH3Bg',       { bg = p.bg_dim })
hl('RenderMarkdownH4Bg',       {})
hl('RenderMarkdownH5Bg',       {})
hl('RenderMarkdownH6Bg',       {})
hl('RenderMarkdownCode',       { fg = p.green_mid, bg = p.bg_light })
hl('RenderMarkdownCodeInline', { fg = p.green_lt, bg = p.bg_light })
hl('RenderMarkdownBullet',     { fg = p.green })
hl('RenderMarkdownQuote',      { fg = p.green_dim, italic = true })
hl('RenderMarkdownDash',       { fg = p.green_dk })
hl('RenderMarkdownLink',       { fg = p.green_lt, underline = true })
hl('RenderMarkdownTableHead',  { fg = p.green, bold = true })
hl('RenderMarkdownTableRow',   { fg = p.green_mid })

-- Shared palette for lualine/plugins
_G.theme_palette = p

-- Terminal palette (matched to Windows Terminal Matrix scheme)
vim.g.terminal_color_0  = '#000000'    -- black
vim.g.terminal_color_1  = '#004D00'    -- red (dark green)
vim.g.terminal_color_2  = p.green      -- green
vim.g.terminal_color_3  = '#7FFF00'    -- yellow (lime green)
vim.g.terminal_color_4  = '#003B00'    -- blue (darker green)
vim.g.terminal_color_5  = '#00FF80'    -- purple (mint green)
vim.g.terminal_color_6  = '#39FF14'    -- cyan (neon green)
vim.g.terminal_color_7  = '#B0FFB0'    -- white (pale green)
vim.g.terminal_color_8  = '#006600'    -- bright black
vim.g.terminal_color_9  = '#00CC44'    -- bright red (medium green)
vim.g.terminal_color_10 = '#7FFF00'    -- bright green (lime)
vim.g.terminal_color_11 = '#CCFF00'    -- bright yellow (yellow-green)
vim.g.terminal_color_12 = '#00AA44'    -- bright blue (green)
vim.g.terminal_color_13 = '#66FFB2'    -- bright purple (light mint)
vim.g.terminal_color_14 = '#00FFAA'    -- bright cyan (aqua green)
vim.g.terminal_color_15 = p.white      -- bright white
