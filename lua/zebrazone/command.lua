local M = {}

--- @param opts {bufnr:integer?,hl_groups:string[]?}?
function M.start(opts)
  opts = opts or {}

  local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()
  local hl_groups = opts.hl_groups or { require("zebrazone.highlight_group").ZebrazoneDefault, "NONE" }

  require("zebrazone.highlighter").start(bufnr, hl_groups)
end

--- @param opts {bufnr:integer?}?
function M.stop(opts)
  opts = opts or {}

  local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()

  require("zebrazone.highlighter").stop(bufnr)
end

return M
