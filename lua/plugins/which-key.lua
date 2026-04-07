return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  config = function()
    local wk = require('which-key')
    wk.setup({
      icons = { mappings = false },
    })
    wk.add({
      { '<leader>c', group = 'Code' },
      { '<leader>d', group = 'Debug' },
      { '<leader>f', group = 'Find' },
      { '<leader>g', group = 'Git' },
      { '<leader>h', group = 'Git hunks' },
      { '<leader>m', group = 'Markdown' },
      { '<leader>r', group = 'Refactor' },
      { '<leader>n', group = 'Notebook' },
      { '<leader>t', group = 'Terminal' },
      { '<leader>x', group = 'Trouble' },
    })
  end,
}
