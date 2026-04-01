return {
  'meatballs/notebook.nvim',
  config = function()
    require('notebook').setup({
      insert_blank_line = true,
      show_index = true,
      show_cell_type = true,
      virtual_text_style = { fg = _G.theme_palette and _G.theme_palette.green_lt or "lightblue", italic = true },
    })
  end,
}
