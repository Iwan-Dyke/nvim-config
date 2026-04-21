return {
  {
    'williamboman/mason.nvim',
    event = "VeryLazy",
    config = function()
      require('mason').setup()
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'mason.nvim' },
    opts = {
      ensure_installed = {
        'lua-language-server',
        'pyright',
        'ruff',
        'yaml-language-server',
        'bash-language-server',
        'gopls',
        'terraform-ls',
        'dockerfile-language-server',
        'delve',
        'stylua',
        'shfmt',
        'yamlfmt',
      },
    },
  },
}
