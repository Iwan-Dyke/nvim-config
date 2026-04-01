return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'WhoIsSethDaniel/mason-tool-installer.nvim',
    dependencies = { 'mason.nvim' },
    opts = {
      ensure_installed = {
        -- LSP servers
        'lua-language-server',
        'pyright',
        'ruff',
        'yaml-language-server',
        'bash-language-server',
        'sql-language-server',
        'gopls',
        'terraform-ls',
        -- Formatters
        'stylua',
        'shfmt',
        'yamlfmt',
      },
    },
  },
}
