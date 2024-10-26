local M = {}

--- Start highlighting.
--- @param opts {bufnr:integer?,hl_groups:string[]?}? default = {bufnr = 0, hl_groups = {"ZebrazoneDefault", "NONE"}}
function M.start(opts)
  require("zebrazone.command").start(opts)
end

--- Stop highlighting.
--- @param opts {bufnr:integer?}? default = {bufnr = 0}
function M.stop(opts)
  require("zebrazone.command").stop(opts)
end

return M
