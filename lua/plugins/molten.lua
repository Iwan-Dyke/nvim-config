return {
  'benlubas/molten-nvim',
  version = '^1.0.0',
  lazy = false,
  build = ':UpdateRemotePlugins',
  keys = {
    { '<leader>mi', function() require('config.molten-spark').init() end, desc = 'Molten init kernel' },
    { '<leader>mx', function() require('config.molten-spark').restart() end, desc = 'Molten reconnect' },
    { '<leader>mr', '<cmd>MoltenEvaluateLine<cr>', desc = 'Molten run line' },
    { '<leader>mr', ':<C-u>MoltenEvaluateVisual<cr>', mode = 'v', desc = 'Molten run selection' },
    { '<leader>mc', function() require('config.molten-cells').run_cell() end, desc = 'Molten run cell' },
    { '<leader>ma', function() require('config.molten-cells').run_all() end, desc = 'Molten run all' },
    { '<leader>md', '<cmd>MoltenDelete<cr>', desc = 'Molten delete output' },
    { '<leader>ms', '<cmd>MoltenInterrupt<cr>', desc = 'Molten stop/interrupt' },
    { '<leader>mo', '<cmd>MoltenShowOutput<cr>', desc = 'Molten show output' },
    { '<leader>mh', '<cmd>MoltenHideOutput<cr>', desc = 'Molten hide output' },
  },
  init = function()
    vim.g.molten_output_win_max_height = 20
    vim.g.molten_auto_open_output = false
    vim.g.molten_output_win_hide_on_leave = true
    vim.g.molten_virt_text_output = true
    vim.g.molten_virt_text_max_lines = 30
  end,
}
