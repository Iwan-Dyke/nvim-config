return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require('toggleterm').setup({
            open_mapping = false, -- Disable default mapping
            persist_mode = false, -- Don't persist terminal mode
            insert_mappings = false, -- Disable insert mode mappings
        })

        local Terminal = require('toggleterm.terminal').Terminal
        
        -- Floating popup terminal
        local popup_terminal = Terminal:new({
            direction = "float",
            float_opts = {
                border = "double",
                width = math.floor(vim.o.columns * 0.8),
                height = math.floor(vim.o.lines * 0.8),
            },
            count = 1,
            hidden = true,
        })
        
        -- Amazon Q Terminal (Persistent Vertical Right)
        local q_terminal = Terminal:new({
            cmd = "kiro-cli chat",
            direction = "vertical",
            size = function()
                return 25  -- Fixed 25 columns
            end,
            close_on_exit = false,
            count = 2,
            hidden = true,
            on_open = function(term)
                vim.cmd("wincmd L") -- Force to rightmost position
                vim.cmd("vertical resize 25") -- Force resize after opening
            end,
        })

        -- Horizontal Terminal (Persistent Bottom)
        local horizontal_terminal = Terminal:new({
            direction = "horizontal",
            size = function()
                return 5  -- Fixed 5 rows
            end,
            count = 3,
            hidden = true,
            on_open = function(term)
                vim.cmd("wincmd J") -- Force to bottom position
                vim.cmd("resize 5") -- Force resize after opening
            end,
        })

        -- State tracking
        local terminals_state = {
            q_open = false,
            horizontal_open = false,
        }

        -- Functions with conflict prevention
        function _popup_terminal_toggle()
            popup_terminal:toggle()
        end
        
        function _q_terminal_toggle()
            if terminals_state.q_open then
                q_terminal:close()
                terminals_state.q_open = false
            else
                q_terminal:open()
                terminals_state.q_open = true
            end
        end

        function _horizontal_terminal_toggle()
            if terminals_state.horizontal_open then
                horizontal_terminal:close()
                terminals_state.horizontal_open = false
            else
                horizontal_terminal:open()
                terminals_state.horizontal_open = true
            end
        end

        -- Keymaps
        vim.keymap.set('n', '<C-t>', _popup_terminal_toggle, { desc = "Toggle popup terminal" })
        vim.keymap.set('n', '<leader>tq', _q_terminal_toggle, { desc = "Toggle Q terminal" })
        vim.keymap.set('n', '<leader>th', _horizontal_terminal_toggle, { desc = "Toggle horizontal terminal" })
        
        -- Terminal mode keymaps
        vim.keymap.set('t', '<C-t>', '<C-\\><C-n>:lua _popup_terminal_toggle()<CR>')
        vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
        vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')
        vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l')
    end,
}
