return {
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  {
    'neovim/nvim-lspconfig',
    dependencies = { 'mason.nvim' },
    config = function()
      -- LSP keymaps
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(ev)
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        end,
      })

      -- Setup language servers using new API
      vim.lsp.config.lua_ls = { cmd = { 'lua-language-server' } }
      vim.lsp.config.pyright = { cmd = { 'pyright-langserver', '--stdio' } }
      vim.lsp.config.yamlls = { cmd = { 'yaml-language-server', '--stdio' } }
      vim.lsp.config.bashls = { cmd = { 'bash-language-server', 'start' } }
      vim.lsp.config.sqlls = { cmd = { 'sql-language-server', 'up', '--method', 'stdio' } }
      vim.lsp.config.gopls = { cmd = { 'gopls' } }
    end,
  },
}
