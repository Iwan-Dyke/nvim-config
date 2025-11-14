return {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    config = function()

        require('nvim-treesitter.configs').setup({
            ensure_installed = { 'lua', 'python', 'yaml', 'bash', 'sql', 'markdown', 'go' },
            highlight = { enable = true },
            indent = { enable = true},
            incremental_selection = { enable = true},
        })
    end,
}
