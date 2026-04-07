-- LSP keymaps (applied when a server attaches to a buffer)
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = ev.buf, desc = "Go to definition" })
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, desc = "Find references" })
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = ev.buf, desc = "Hover documentation" })
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = ev.buf, desc = "Code action" })
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = ev.buf, desc = "Rename symbol" })
  end,
})

-- Server configurations
vim.lsp.config('lua_ls', {
  cmd = { 'lua-language-server' },
  root_markers = { '.luarc.json', '.luarc.jsonc', '.git' },
  filetypes = { 'lua' },
})

-- Pyright handles go-to-definition and hover only; all diagnostics
-- are delegated to ruff via ignore = { '*' }
vim.lsp.config('pyright', {
  cmd = { 'pyright-langserver', '--stdio' },
  root_markers = { 'pyproject.toml', 'setup.py', '.git' },
  filetypes = { 'python' },
  settings = {
    pyright = { disableOrganizeImports = true },
    python = { analysis = { ignore = { '*' } } },
  },
})

vim.lsp.config('ruff', {
  cmd = { 'ruff', 'server' },
  root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
  filetypes = { 'python' },
})

vim.lsp.config('yamlls', {
  cmd = { 'yaml-language-server', '--stdio' },
  root_markers = { '.git' },
  filetypes = { 'yaml', 'yaml.docker-compose' },
})

vim.lsp.config('bashls', {
  cmd = { 'bash-language-server', 'start' },
  root_markers = { '.git' },
  filetypes = { 'sh', 'bash' },
})

vim.lsp.config('gopls', {
  cmd = { 'gopls' },
  root_markers = { 'go.mod', '.git' },
  filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
})

vim.lsp.config('terraformls', {
  cmd = { 'terraform-ls', 'serve' },
  root_markers = { '.terraform', '.git' },
  filetypes = { 'terraform', 'terraform-vars' },
})

vim.lsp.config('dockerls', {
  cmd = { 'docker-langserver', '--stdio' },
  root_markers = { 'Dockerfile', '.git' },
  filetypes = { 'dockerfile' },
})

-- Activate all configured servers
vim.lsp.enable({ 'lua_ls', 'pyright', 'ruff', 'yamlls', 'bashls', 'gopls', 'terraformls', 'dockerls' })
