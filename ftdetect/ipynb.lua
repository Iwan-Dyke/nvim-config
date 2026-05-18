vim.filetype.add({
  extension = {
    ipynb = function(path)
      local stat = vim.loop.fs_stat(path)
      if stat and stat.size == 0 then
        local skeleton = vim.json.encode({
          cells = {},
          metadata = { kernelspec = { display_name = "Python 3", language = "python", name = "python3" }, language_info = { name = "python", version = "3.11.0" } },
          nbformat = 4,
          nbformat_minor = 5,
        })
        -- Write to disk
        local f = io.open(path, "w")
        if f then
          f:write(skeleton)
          f:close()
        end
        -- Load into current buffer so plugins see valid JSON without a reload
        vim.schedule(function()
          local buf = vim.api.nvim_get_current_buf()
          local lines = vim.split(skeleton, "\n")
          vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
          vim.bo[buf].modified = false
        end)
      end
      return 'ipynb'
    end,
  },
})
