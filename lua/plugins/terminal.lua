return {
    'akinsho/toggleterm.nvim',
    version = "*",
    keys = {
        { '<C-t>', desc = 'Toggle popup terminal' },
        { '<leader>gg', desc = 'Toggle lazygit' },
        { '<leader>tc', desc = 'Toggle Claude terminal' },
        { '<leader>tk', desc = 'Toggle Kiro terminal' },
        { '<leader>th', desc = 'Toggle horizontal terminal' },
    },
    config = function()
        local claude_cmd = "claude"
        local kiro_cmd = "kiro-cli chat"
        local ok, agent = pcall(require, "agent")
        if ok and type(agent) == "table" then
            claude_cmd = agent.claude_cmd or claude_cmd
            kiro_cmd = agent.kiro_cmd or kiro_cmd
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

        local ai_opts = {
            direction = "vertical",
            size = function() return 25 end,
            close_on_exit = false,
            hidden = true,
            on_open = function()
                vim.cmd("wincmd L")
                vim.cmd("vertical resize 25")
            end,
        }

        local claude_terminal = Terminal:new(vim.tbl_extend("force", ai_opts, { cmd = claude_cmd, count = 2 }))
        local kiro_terminal = Terminal:new(vim.tbl_extend("force", ai_opts, { cmd = kiro_cmd, count = 5 }))

        local function toggle_ai(target, other)
            if other:is_open() then other:close() end
            target:toggle()
        end

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

        local lazygit = Terminal:new({
            cmd = "lazygit",
            direction = "float",
            float_opts = {
                border = "double",
                width = math.floor(vim.o.columns * 0.95),
                height = math.floor(vim.o.lines * 0.95),
            },
            count = 4,
            hidden = true,
        })

        vim.keymap.set('n', '<C-t>', function() popup_terminal:toggle() end, { desc = "Toggle popup terminal" })
        vim.keymap.set('n', '<leader>gg', function() lazygit:toggle() end, { desc = "Toggle lazygit" })
        vim.keymap.set('n', '<leader>tc', function() toggle_ai(claude_terminal, kiro_terminal) end, { desc = "Toggle Claude terminal" })
        vim.keymap.set('n', '<leader>tk', function() toggle_ai(kiro_terminal, claude_terminal) end, { desc = "Toggle Kiro terminal" })
        vim.keymap.set('n', '<leader>th', function() horizontal_terminal:toggle() end, { desc = "Toggle horizontal terminal" })

        vim.keymap.set('t', '<C-t>', function() popup_terminal:toggle() end)
        vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')
        vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h')
        vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l')
    end,
}
