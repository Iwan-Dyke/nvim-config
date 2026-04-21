return {
    'nvim-treesitter/nvim-treesitter',
    event = { "BufReadPre", "BufNewFile" },
    build = ':TSUpdate',
    config = function()

        require('nvim-treesitter.configs').setup({
            ensure_installed = { 'lua', 'python', 'yaml', 'bash', 'sql', 'markdown', 'go', 'mermaid', 'terraform', 'hcl' },
            highlight = { enable = true },
            indent = { enable = true},
            incremental_selection = { enable = false },
        })
    end,
}
