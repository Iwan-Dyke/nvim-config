return {
    'saghen/blink.cmp',
    version = '1.*',
    opts = {
        keymap = {
            ['<C-Space>'] = { 'show' },
            ['<CR>'] = { 'accept', 'fallback' },
            ['<C-n>'] = { 'select_next', 'fallback' },
            ['<C-p>'] = { 'select_prev', 'fallback' },
        },
        sources = {
            default = { 'lsp', 'buffer', 'path' },
        },
        cmdline = { enabled = false },
    },
}
