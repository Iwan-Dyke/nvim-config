return {
  'benlubas/molten-nvim',
  version = '^1.0.0',
  lazy = false,
  build = ':UpdateRemotePlugins',
  keys = {
    { '<leader>mi', '<cmd>MoltenInit<cr>', desc = 'Molten init kernel' },
    { '<leader>mr', '<cmd>MoltenEvaluateLine<cr>', desc = 'Molten run line' },
    { '<leader>mr', ':<C-u>MoltenEvaluateVisual<cr>', mode = 'v', desc = 'Molten run selection' },
    { '<leader>mc', function()
      local ok, api = pcall(require, 'notebook.api')
      if not ok then
        vim.cmd('MoltenReevaluateCell')
        return
      end
      local extmark = api.current_extmark()
      if not extmark then
        vim.notify('[Molten] Not inside a notebook cell', vim.log.levels.WARN)
        return
      end
      local start_line = extmark[1] + 1
      local end_line = extmark[3].end_row
      vim.fn.MoltenEvaluateRange(start_line, end_line)
    end, desc = 'Molten run cell' },
    { '<leader>md', '<cmd>MoltenDelete<cr>', desc = 'Molten delete output' },
    { '<leader>mo', '<cmd>MoltenShowOutput<cr>', desc = 'Molten show output' },
  },
  init = function()
    vim.g.molten_output_win_max_height = 20
    vim.g.molten_auto_open_output = false
    vim.g.molten_virt_text_output = true
  end,
}
