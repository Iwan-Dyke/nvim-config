return {
  dir = vim.fn.stdpath('config'),
  name = 'imperial-theme',
  priority = 1000,
  config = function()
    vim.cmd([[
      highlight clear
      set background=dark
      
      " Basic highlights
      highlight Normal guifg=#ffffff guibg=#000000
      highlight Keyword guifg=#dc143c gui=bold
      highlight Function guifg=#dc143c
      highlight String guifg=#cccccc
      highlight Comment guifg=#666666 gui=italic
      highlight LineNr guifg=#666666
      
      " Borders and separators
      highlight FloatBorder guifg=#cc0000 gui=bold
      highlight VertSplit guifg=#cc0000 guibg=#000000 gui=bold
      highlight WinSeparator guifg=#cc0000 guibg=#000000 gui=bold
      
      " Neo-tree highlights
      highlight NeoTreeNormal guifg=#ffffff guibg=#000000
      highlight NeoTreeNormalNC guifg=#ffffff guibg=#000000
      highlight NeoTreeDirectoryName guifg=#ffffff
      highlight NeoTreeDirectoryIcon guifg=#dc143c
      highlight NeoTreeFileName guifg=#cccccc
      highlight NeoTreeFileIcon guifg=#666666
      highlight NeoTreeGitModified guifg=#dc143c
      highlight NeoTreeGitAdded guifg=#ffffff
      highlight NeoTreeIndentMarker guifg=#666666
      
      " Terminal highlights
      highlight Terminal guifg=#ffffff guibg=#1a1a1a
      highlight TerminalNormal guifg=#ffffff guibg=#1a1a1a
      
      " LSP highlights (Imperial theme)
      highlight @function guifg=#ffffff guibg=NONE
      highlight @function.call guifg=#cccccc guibg=NONE
      highlight @function.builtin guifg=#ff6600 guibg=NONE
      highlight @method guifg=#ffffff guibg=NONE
      highlight @method.call guifg=#cccccc guibg=NONE
      highlight Function guifg=#ffffff guibg=NONE
      highlight Identifier guifg=#aaaaaa guibg=NONE
      
      " Override blue syntax highlights
      highlight @type guifg=#ffffff guibg=NONE
      highlight @type.builtin guifg=#ff6600 guibg=NONE
      highlight @keyword guifg=#cc0000 guibg=NONE
      highlight @keyword.function guifg=#cc0000 guibg=NONE
      highlight @variable guifg=#cccccc guibg=NONE
      highlight @variable.builtin guifg=#ff6600 guibg=NONE
      highlight @constant guifg=#ffffff guibg=NONE
      highlight @constant.builtin guifg=#ff6600 guibg=NONE
      highlight Type guifg=#ffffff guibg=NONE
      highlight Keyword guifg=#cc0000 guibg=NONE
      highlight Constant guifg=#ffffff guibg=NONE
      
      " Brackets and punctuation
      highlight @punctuation.bracket guifg=#ffffff guibg=NONE
      highlight @punctuation.delimiter guifg=#cccccc guibg=NONE
      highlight @punctuation.special guifg=#ff6600 guibg=NONE
      highlight Delimiter guifg=#cccccc guibg=NONE
      highlight Special guifg=#ff6600 guibg=NONE
    ]])
    
    -- Terminal colors (Imperial palette)
    vim.g.terminal_color_0 = '#1a1a1a'   -- black (lighter)
    vim.g.terminal_color_1 = '#cc0000'   -- red
    vim.g.terminal_color_2 = '#6a6a6a'   -- green (much lighter grey)
    vim.g.terminal_color_3 = '#ffff00'   -- yellow
    vim.g.terminal_color_4 = '#0066cc'   -- blue
    vim.g.terminal_color_5 = '#cc0000'   -- magenta (red)
    vim.g.terminal_color_6 = '#ff6600'   -- cyan (orange)
    vim.g.terminal_color_7 = '#f0f0f0'   -- white
    vim.g.terminal_color_8 = '#5a5a5a'   -- bright black (much lighter)
    vim.g.terminal_color_9 = '#ff0000'   -- bright red
    vim.g.terminal_color_10 = '#8a8a8a'  -- bright green (much lighter grey)
    vim.g.terminal_color_11 = '#ffff00'  -- bright yellow
    vim.g.terminal_color_12 = '#0066cc'  -- bright blue
    vim.g.terminal_color_13 = '#ff0000'  -- bright magenta (bright red)
    vim.g.terminal_color_14 = '#ff6600'  -- bright cyan (orange)
    vim.g.terminal_color_15 = '#ffffff'  -- bright white
    
    vim.g.colors_name = 'imperial'
  end,
}
