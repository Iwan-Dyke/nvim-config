return {
  'meatballs/notebook.nvim',
  event = { 'BufReadPre *.ipynb', 'BufNewFile *.ipynb' },
  config = function()
    require('notebook').setup({
      insert_blank_line = true,
      show_index = true,
      show_cell_type = true,
      virtual_text_style = { fg = _G.theme_palette and _G.theme_palette.accent or "lightblue", italic = true },
    })

    local function attach_keymaps(buf)
      local opts = { buffer = buf }
      vim.keymap.set('n', '<leader>na', '<cmd>NBAddCell<cr>', vim.tbl_extend('force', opts, { desc = 'Add cell' }))
      vim.keymap.set('n', '<leader>ni', '<cmd>NBInsertCell<cr>', vim.tbl_extend('force', opts, { desc = 'Insert cell below' }))
      vim.keymap.set('n', '<leader>nd', '<cmd>NBDeleteCell<cr>', vim.tbl_extend('force', opts, { desc = 'Delete cell' }))
      vim.keymap.set('n', '<leader>nk', '<cmd>NBMoveCellUp<cr>', vim.tbl_extend('force', opts, { desc = 'Move cell up' }))
      vim.keymap.set('n', '<leader>nj', '<cmd>NBMoveCellDown<cr>', vim.tbl_extend('force', opts, { desc = 'Move cell down' }))
    end

    -- Attach after notebook renders (it changes ft to python/r/julia)
    vim.api.nvim_create_autocmd("User", {
      pattern = "NBPostRender",
      callback = function()
        attach_keymaps(vim.api.nvim_get_current_buf())
      end,
    })
  end,
}
