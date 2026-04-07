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
    opts = function()
      -- Map mason package names to the executable they provide.
      -- Only install via Mason if the executable is not already on PATH.
      local tools = {
        { mason = 'lua-language-server',  exe = 'lua-language-server' },
        { mason = 'pyright',              exe = 'pyright-langserver' },
        { mason = 'ruff',                 exe = 'ruff' },
        { mason = 'yaml-language-server', exe = 'yaml-language-server' },
        { mason = 'bash-language-server', exe = 'bash-language-server' },
        { mason = 'gopls',                exe = 'gopls' },
        { mason = 'terraform-ls',         exe = 'terraform-ls' },
        { mason = 'delve',                exe = 'dlv' },
        { mason = 'stylua',               exe = 'stylua' },
        { mason = 'shfmt',                exe = 'shfmt' },
        { mason = 'yamlfmt',              exe = 'yamlfmt' },
      }

      local to_install = {}
      for _, tool in ipairs(tools) do
        if vim.fn.executable(tool.exe) == 0 then
          table.insert(to_install, tool.mason)
        end
      end

      return { ensure_installed = to_install }
    end,
  },
}
