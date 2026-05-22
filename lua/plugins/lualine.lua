return {
    'nvim-lualine/lualine.nvim',
    event = "VeryLazy",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local p = _G.theme_palette or require('config.palette').get('matrix')

        local theme = {
            normal = {
                a = { fg = p.white, bg = p.mode_normal or p.red, gui = 'bold' },
                b = { fg = p.primary, bg = p.bg },
                c = { fg = p.grey, bg = p.bg }
            },
            insert = {
                a = { fg = p.black, bg = p.mode_insert or p.orange, gui = 'bold' },
                b = { fg = p.primary, bg = p.bg },
                c = { fg = p.grey, bg = p.bg }
            },
            visual = {
                a = { fg = p.black, bg = p.white, gui = 'bold' },
                b = { fg = p.primary, bg = p.bg },
                c = { fg = p.grey, bg = p.bg }
            },
            replace = {
                a = { fg = p.white, bg = p.mode_normal or p.red, gui = 'bold' },
                b = { fg = p.primary, bg = p.bg },
                c = { fg = p.grey, bg = p.bg }
            },
            command = {
                a = { fg = p.white, bg = p.mode_normal or p.red, gui = 'bold' },
                b = { fg = p.primary, bg = p.bg },
                c = { fg = p.grey, bg = p.bg }
            },
            inactive = {
                a = { fg = p.grey_dk, bg = p.bg },
                b = { fg = p.grey_dk, bg = p.bg },
                c = { fg = p.grey_dk, bg = p.bg }
            }
        }

        local is_deck = require("config.profile").is_deck()

        require('lualine').setup({
            options = {
                theme = theme,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                globalstatus = true,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = is_deck and {} or { 'branch', 'diff' },
                lualine_c = { 'filename' },
                lualine_x = is_deck and { 'filetype' } or { 'diagnostics', 'encoding', 'fileformat', 'filetype' },
                lualine_y = is_deck and {} or { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
        })
    end
}
