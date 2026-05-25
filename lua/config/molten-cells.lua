local M = {}

function M.run_cell()
  local bufnr = vim.api.nvim_get_current_buf()
  local row = vim.api.nvim_win_get_cursor(0)[1] - 1
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)

  local start_line = 0
  local end_line = #lines - 1

  for i = row, 0, -1 do
    if lines[i + 1]:match('^# %%%%') then
      start_line = i + 1
      break
    end
  end

  for i = row + 1, #lines - 1 do
    if lines[i + 1]:match('^# %%%%') then
      end_line = i - 1
      break
    end
  end

  local ok, err = pcall(vim.fn.MoltenEvaluateRange, start_line + 1, end_line + 1)
  if not ok then
    vim.notify("kernel dead — reconnecting...", vim.log.levels.WARN)
    require('config.molten-spark').restart()
  end
end

return M
