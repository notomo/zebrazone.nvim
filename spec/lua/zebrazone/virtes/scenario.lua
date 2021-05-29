local scenario = function(ctx)
  vim.o.termguicolors = true
  vim.o.background = "dark"

  vim.api.nvim_buf_set_lines(0, 0, -1, false, {"hoge", "foo", "bar"})

  ctx:screenshot()

  require("zebrazone").start()
  ctx:screenshot()

  require("zebrazone").stop()
  ctx:screenshot()
end

local main = function(result_dir)
  vim.o.runtimepath = vim.fn.getcwd() .. "," .. vim.o.runtimepath

  local test = require("virtes").setup({scenario = scenario, result_dir = result_dir})
  test:run():write_replay_script()
end

return main
