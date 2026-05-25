vim.filetype.add({
  extension = {
    ipynb = function(path)
      local stat = vim.loop.fs_stat(path)
      if stat and stat.size == 0 then
        local skeleton = vim.json.encode({
          cells = {
            { cell_type = "markdown", metadata = {}, source = { "# Untitled\n" } },
            { cell_type = "code", metadata = {}, outputs = {}, source = { "" } },
          },
          metadata = {
            kernelspec = { display_name = "Python 3", language = "python", name = "python3" },
            language_info = { name = "python", version = "3.11.0" },
          },
          nbformat = 4,
          nbformat_minor = 5,
        })
        -- Write to disk so notebook.nvim can read it
        local f = io.open(path, "w")
        if f then
          f:write(skeleton)
          f:close()
        end
        -- Set buffer lines synchronously BEFORE notebook.nvim's BufRead fires
        local buf = vim.api.nvim_get_current_buf()
        vim.api.nvim_buf_set_lines(buf, 0, -1, false, { skeleton })
        vim.bo[buf].modified = false
      end
      return 'ipynb'
    end,
  },
})
