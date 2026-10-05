-- Python provider (isolated venv for Molten/remote plugins)
vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/nvim/bin/python3")

-- Basic Editor Settings
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.wrap = false
vim.opt.breakindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.scrolloff = 8
vim.opt.cursorline = true
vim.opt.guicursor = "a:ver25-Cursor-blinkon1"
vim.api.nvim_set_hl(0, 'Cursor', { bg = '#5b8fbd' })
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.clipboard = "unnamedplus"

-- WSL clipboard provider
if vim.fn.has('wsl') == 1 then
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ['+'] = 'clip.exe',
            ['*'] = 'clip.exe',
        },
        paste = {
            ['+'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['*'] = 'powershell.exe -NoLogo -NoProfile -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
        },
        cache_enabled = 0,
    }
end
vim.opt.undofile = true

-- Prevent status bar conflicts with tmux
vim.opt.laststatus = 3
vim.opt.cmdheight = 1
vim.opt.termsync = false

-- Disable problematic features for WSL
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Force Unix line endings
vim.opt.fileformat = "unix"
vim.opt.fileformats = "unix,dos"

-- Deck profile overrides
if require("config.profile").is_deck() then
    vim.opt.scrolloff = 3
    vim.opt.wrap = true
    vim.opt.number = true
    vim.opt.relativenumber = false
    vim.opt.signcolumn = "no"
    vim.opt.cursorline = false
end

-- Colourscheme
vim.cmd.colorscheme('matrix')
