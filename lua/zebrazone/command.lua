local Highlighter = require("zebrazone.highlighter").Highlighter
local messagelib = require("zebrazone.lib.message")
local highlightlib = require("zebrazone.lib.highlight")

local M = {}

local Command = {}
Command.__index = Command
M.Command = Command

function Command.new(name, ...)
  local args = { ... }
  local f = function()
    return Command[name](unpack(args))
  end

  local ok, msg = xpcall(f, debug.traceback)
  if not ok then
    return messagelib.error(msg)
  elseif msg then
    return messagelib.warn(msg)
  end
  return nil
end

highlightlib.default("ZebrazoneDefault", {
  ctermbg = { "StatusLineNC", 235 },
  guibg = { "StatusLineNC", "#3a4b5c" },
})

function Command.start(opts)
  vim.validate({ opts = { opts, "table", true } })
  opts = opts or {}

  vim.validate({ ["opts.bufnr"] = { opts.bufnr, "number", true } })
  local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()

  vim.validate({ ["opts.hl_groups"] = { opts.hl_groups, "table", true } })
  local hl_groups = opts.hl_groups or { "ZebrazoneDefault", "NONE" }

  return Highlighter.start(bufnr, hl_groups)
end

function Command.stop(opts)
  vim.validate({ opts = { opts, "table", true } })
  opts = opts or {}

  vim.validate({ ["opts.bufnr"] = { opts.bufnr, "number", true } })
  local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()

  return Highlighter.stop(bufnr)
end

return M
