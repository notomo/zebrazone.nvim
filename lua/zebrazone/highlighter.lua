local vim = vim

local Highlighter = {}
Highlighter.__index = Highlighter

--- @param bufnr integer
--- @param hl_groups string[]
function Highlighter.new(bufnr, hl_groups)
  local tbl = {
    _bufnr = bufnr,
    _hl_groups = hl_groups,
    _hl_count = #hl_groups,
  }
  return setmetatable(tbl, Highlighter)
end

local ns = vim.api.nvim_create_namespace("zebrazone")

function Highlighter.highlight(self, row)
  vim.api.nvim_buf_set_extmark(self._bufnr, ns, row, 0, {
    end_line = row + 1,
    hl_group = self._hl_groups[(row % self._hl_count) + 1],
    virt_text_pos = "overlay",
    hl_eol = true,
    ephemeral = true,
    hl_mode = "blend",
  })
end

local highlighters = {}
vim.api.nvim_set_decoration_provider(ns, {})
vim.api.nvim_set_decoration_provider(ns, {
  on_win = function(_, _, bufnr)
    return highlighters[bufnr] ~= nil
  end,
  on_line = function(_, _, bufnr, row)
    highlighters[bufnr]:highlight(row)
    return true
  end,
})

local M = {}

function M.start(bufnr, hl_groups)
  highlighters[bufnr] = Highlighter.new(bufnr, hl_groups)
  vim.cmd("redraw!")
end

function M.stop(bufnr)
  highlighters[bufnr] = nil
end

return M
