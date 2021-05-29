local Command = require("zebrazone.command").Command

local M = {}

--- Start highlighting.
--- @param opts table: default = {bufnr = 0, hl_groups = {"ZebrazoneDefault", "NONE"}}
function M.start(opts)
  return Command.new("start", opts)
end

--- Stop highlighting.
--- @param opts table: default = {bufnr = 0}
function M.stop(opts)
  return Command.new("stop", opts)
end

return M
