return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    keys = {
        { '<leader>cf', function() require('conform').format() end, desc = 'Format buffer' },
    },
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            python = { 'ruff_organize_imports', 'ruff_format' },
            go = { 'gofmt' },
            terraform = { 'terraform_fmt' },
            bash = { 'shfmt' },
            sh = { 'shfmt' },
            yaml = { 'yamlfmt' },
        },
        format_on_save = {
            timeout_ms = 1000,
            lsp_format = 'fallback',
        },
    },
}
