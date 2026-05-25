local M = {}

-- Map local ~/code/<project> to container path /workspace/<project>
local function container_path()
  local cwd = vim.fn.getcwd()
  local code_dir = vim.fn.expand("~/code")
  if cwd:find(code_dir, 1, true) == 1 then
    return "/workspace" .. cwd:sub(#code_dir + 1)
  end
  return nil
end

local function do_init(project)
  vim.api.nvim_create_autocmd("User", {
    pattern = "MoltenKernelReady",
    once = true,
    callback = function()
      if project then
        vim.cmd("MoltenEvaluateArgument import os; os.chdir('" .. project .. "')")
      end
    end,
  })
  vim.cmd("MoltenInit http://localhost:8888")
end

function M.init()
  local project = container_path()
  if not project then
    vim.cmd("MoltenInit")
    return
  end

  vim.notify("injecting deps: " .. vim.fn.fnamemodify(project, ":t"), vim.log.levels.INFO)

  vim.fn.jobstart(
    { "docker", "exec", "spark-delta", "/opt/inject-deps.sh", project },
    {
      stdout_buffered = true,
      on_stdout = function(_, data)
        local out = table.concat(data, "")
        if out:find("deps:ok") or out:find("deps:none") then
          vim.schedule(function() do_init(project) end)
        else
          vim.schedule(function()
            vim.notify("dep inject: " .. out, vim.log.levels.WARN)
            do_init(project)
          end)
        end
      end,
      on_stderr = function(_, data)
        local err = table.concat(data, "")
        if err ~= "" then
          vim.schedule(function() vim.notify("inject-deps: " .. err, vim.log.levels.ERROR) end)
        end
      end,
    }
  )
end

function M.restart()
  pcall(vim.cmd, "MoltenDeinit")
  vim.defer_fn(function() M.init() end, 200)
end

return M
