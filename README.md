# nvim-config

Neovim config for Python, Go, Terraform, SQL, and Bash. Lazy.nvim, custom colourschemes, AI CLI integration, in-editor notebook execution.

## Plugins

| Category | Plugins |
|----------|---------|
| LSP | pyright, gopls, terraform-ls, lua-ls, bash-ls, yaml-ls, dockerfile-ls, sqls |
| Formatting | ruff, stylua, shfmt, yamlfmt (conform.nvim) |
| Debugging | debugpy, delve (nvim-dap) |
| Notebooks | molten-nvim, notebook.nvim → remote Jupyter kernel |
| Git | lazygit (toggleterm), gitsigns, diffview |
| AI | Claude, Kiro, Codex via toggleterm |
| Completion | blink.cmp |
| Navigation | telescope, oil.nvim, neo-tree |
| Colourschemes | matrix, imperial (custom, no deps) |

## Structure

```
init.lua              Bootstrap + module loading
lua/config/           Options, keymaps, LSP, profiles
lua/plugins/          One file per plugin (lazy-loaded)
colors/               Custom colourschemes
bin/setup             First-run installer (macOS, Linux, SteamOS)
bin/deckvim           Steam Deck launcher (stripped UI)
lua/agent.lua.example AI CLI config template (gitignored when real)
```

## Install

```bash
git clone https://github.com/<you>/nvim-config ~/.config/nvim
bin/setup
cp lua/agent.lua.example lua/agent.lua  # set your AI CLI commands
```

## Requirements

- Neovim ≥ 0.10
- Python 3.11+ (`~/.virtualenvs/nvim/` with pynvim, jupyter_client)
- Node.js
- Nerd Font
