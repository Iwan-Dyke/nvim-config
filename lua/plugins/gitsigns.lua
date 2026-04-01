return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("gitsigns").setup({
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
            },
            current_line_blame = true,
            on_attach = function(bufnr)
                local gs = package.loaded.gitsigns

                -- Navigation
                vim.keymap.set('n', ']c', gs.next_hunk, {buffer = bufnr, desc = "Next git hunk"})
                vim.keymap.set('n', '[c', gs.prev_hunk, {buffer = bufnr, desc = "Previous git hunk"})

                -- Actions
                vim.keymap.set('n', '<leader>hs', gs.stage_hunk, {buffer = bufnr, desc = "Stage hunk"})
                vim.keymap.set('n', '<leader>hr', gs.reset_hunk, {buffer = bufnr, desc = "Reset hunk"})
                vim.keymap.set('n', '<leader>hp', gs.preview_hunk, {buffer = bufnr, desc = "Preview hunk"})
            end
        })
    end,
}
