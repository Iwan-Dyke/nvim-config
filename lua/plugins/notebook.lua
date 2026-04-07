return {
  'meatballs/notebook.nvim',
  ft = 'ipynb',
  keys = {
    { '<leader>na', '<cmd>NBAddCell<cr>', desc = 'Add cell', ft = 'ipynb' },
    { '<leader>ni', '<cmd>NBInsertCell<cr>', desc = 'Insert cell below', ft = 'ipynb' },
    { '<leader>nd', '<cmd>NBDeleteCell<cr>', desc = 'Delete cell', ft = 'ipynb' },
    { '<leader>nk', '<cmd>NBMoveCellUp<cr>', desc = 'Move cell up', ft = 'ipynb' },
    { '<leader>nj', '<cmd>NBMoveCellDown<cr>', desc = 'Move cell down', ft = 'ipynb' },
  },
  config = function()
    require('notebook').setup({
      insert_blank_line = true,
      show_index = true,
      show_cell_type = true,
      virtual_text_style = { fg = _G.theme_palette and _G.theme_palette.accent or "lightblue", italic = true },
    })
  end,
}
