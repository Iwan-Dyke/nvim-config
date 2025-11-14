return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        -- Imperial theme colors
        local imperial_theme = {
            normal = {
                a = { fg = '#ffffff', bg = '#cc0000', gui = 'bold' },
                b = { fg = '#ffffff', bg = '#333333' },
                c = { fg = '#cccccc', bg = '#1a1a1a' }
            },
            insert = {
                a = { fg = '#000000', bg = '#ff6600', gui = 'bold' },
                b = { fg = '#ffffff', bg = '#333333' },
                c = { fg = '#cccccc', bg = '#1a1a1a' }
            },
            visual = {
                a = { fg = '#000000', bg = '#ffffff', gui = 'bold' },
                b = { fg = '#ffffff', bg = '#333333' },
                c = { fg = '#cccccc', bg = '#1a1a1a' }
            },
            replace = {
                a = { fg = '#ffffff', bg = '#cc0000', gui = 'bold' },
                b = { fg = '#ffffff', bg = '#333333' },
                c = { fg = '#cccccc', bg = '#1a1a1a' }
            },
            command = {
                a = { fg = '#ffffff', bg = '#cc0000', gui = 'bold' },
                b = { fg = '#ffffff', bg = '#333333' },
                c = { fg = '#cccccc', bg = '#1a1a1a' }
            },
            inactive = {
                a = { fg = '#666666', bg = '#1a1a1a' },
                b = { fg = '#666666', bg = '#1a1a1a' },
                c = { fg = '#666666', bg = '#1a1a1a' }
            }
        }

        require('lualine').setup({
            options = {
                theme = imperial_theme,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                globalstatus = true,
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff' },
                lualine_c = { 'filename' },
                lualine_x = { 'diagnostics', 'encoding', 'fileformat', 'filetype' },
                lualine_y = { 'progress' },
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
