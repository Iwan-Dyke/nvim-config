return {
  {
    'mfussenegger/nvim-dap',
    keys = {
      { '<leader>db', function() require('dap').toggle_breakpoint() end, desc = 'Toggle breakpoint' },
      { '<leader>dc', function() require('dap').continue() end, desc = 'Start/continue debug' },
      { '<leader>do', function() require('dap').step_over() end, desc = 'Step over' },
      { '<leader>di', function() require('dap').step_into() end, desc = 'Step into' },
      { '<leader>dO', function() require('dap').step_out() end, desc = 'Step out' },
      { '<leader>dr', function() require('dap').repl.open() end, desc = 'Open REPL' },
      { '<leader>dl', function() require('dap').run_last() end, desc = 'Run last config' },
      { '<leader>dx', function() require('dap').terminate() end, desc = 'Terminate session' },
    },
  },
  {
    'rcarriga/nvim-dap-ui',
    dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
    keys = {
      { '<leader>du', function() require('dapui').toggle() end, desc = 'Toggle DAP UI' },
    },
    config = function()
      local dapui = require('dapui')
      dapui.setup()

      local dap = require('dap')
      dap.listeners.after.event_initialized['dapui_config'] = function() dapui.open() end
      dap.listeners.before.event_terminated['dapui_config'] = function() dapui.close() end
      dap.listeners.before.event_exited['dapui_config'] = function() dapui.close() end
    end,
  },
  {
    'mfussenegger/nvim-dap-python',
    dependencies = { 'mfussenegger/nvim-dap' },
    ft = 'python',
    config = function()
      local mason_debugpy = vim.fn.stdpath('data') .. '/mason/packages/debugpy/venv/bin/python'
      local debugpy_path = vim.uv.fs_stat(mason_debugpy) and mason_debugpy or 'python3'
      require('dap-python').setup(debugpy_path)
      require('dap-python').test_runner = 'pytest'
    end,
  },
  {
    'leoluz/nvim-dap-go',
    dependencies = { 'mfussenegger/nvim-dap' },
    ft = 'go',
    opts = {},
  },
}
