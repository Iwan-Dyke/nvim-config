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
                vim.keymap.set('n', ']c', gs.next_hunk, {buffer = bufnr})
                vim.keymap.set('n', '[c', gs.prev_hunk, {buffer = bufnr})

                -- Actions
                vim.keymap.set('n', '<leader>hs', gs.stage_hunk, {buffer = bufnr})
                vim.keymap.set('n', '<leader>hr', gs.reset_hunk, {buffer = bufnr})
                vim.keymap.set('n', '<leader>hp', gs.preview_hunk, {buffer = bufnr})
            end
        })
        
        -- Imperial Theme Colours
        vim.api.nvim_set_hl(0, "GitSignsAdd", { fg = "#ffffff" })
        vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#ff6600" })
        vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#cc0000" })
    end,
}
