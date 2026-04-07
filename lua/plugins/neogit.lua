return {
    "NeogitOrg/neogit",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "sindrets/diffview.nvim",
        "nvim-telescope/telescope.nvim",
    },
    keys = {
        { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Open Neogit' },
        { '<leader>gd', '<cmd>DiffviewOpen<cr>', desc = 'Diff view' },
        { '<leader>gf', '<cmd>DiffviewFileHistory %<cr>', desc = 'File history' },
        { '<leader>gc', '<cmd>DiffviewClose<cr>', desc = 'Close diff view' },
    },
    opts = {},
}
