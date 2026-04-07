return {
    'akinsho/toggleterm.nvim',
    version = "*",
    keys = {
        { '<C-t>', desc = 'Toggle popup terminal' },
        { '<leader>tq', desc = 'Toggle Q terminal' },
        { '<leader>th', desc = 'Toggle horizontal terminal' },
    },
    config = function()
        local ai_cmd = "codex"
        local ok, agent = pcall(require, "agent")
        if ok and type(agent) == "table" and agent.chat_cmd then
            ai_cmd = agent.chat_cmd
        end

        require('toggleterm').setup({
            open_mapping = false,
            persist_mode = false,
            insert_mappings = false,
        })

        local Terminal = require('toggleterm.terminal').Terminal

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

        local q_terminal = Terminal:new({
            cmd = ai_cmd,
            direction = "vertical",
            size = function() return 25 end,
            close_on_exit = false,
            count = 2,
            hidden = true,
            on_open = function()
                vim.cmd("wincmd L")
                vim.cmd("vertical resize 25")
            end,
        })

        local horizontal_terminal = Terminal:new({
            direction = "horizontal",
            size = function() return 5 end,
            count = 3,
            hidden = true,
            on_open = function()
                vim.cmd("wincmd J")
                vim.cmd("resize 5")
            end,
        })

        vim.keymap.set('n', '<C-t>', function() popup_terminal:toggle() end, { desc = "Toggle popup terminal" })
        vim.keymap.set('n', '<leader>tq', function() q_terminal:toggle() end, { desc = "Toggle Q terminal" })
        vim.keymap.set('n', '<leader>th', function() horizontal_terminal:toggle() end, { desc = "Toggle horizontal terminal" })

        vim.keymap.set('t', '<C-t>', function() popup_terminal:toggle() end)
        vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
        vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')
        vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l')
    end,
}
