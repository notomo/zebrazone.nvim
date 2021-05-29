local M = {}

function M.default(name, attributes)
  local parts = {}
  for attr_name, v in pairs(attributes) do
    local value = v
    if type(v) == "table" then
      local hl_group, default = unpack(v)
      value = M.get_attribute(hl_group, attr_name) or default
    elseif type(v) == "string" then
      value = M.get_attribute(v, attr_name)
    end
    table.insert(parts, ("%s=%s"):format(attr_name, value))
  end

  local cmd = ("highlight default %s %s"):format(name, table.concat(parts, " "))
  vim.cmd(cmd)
  return name
end

local ATTRIBUTES = {
  ctermfg = {"fg", "cterm"},
  guifg = {"fg", "gui"},
  ctermbg = {"bg", "cterm"},
  guibg = {"bg", "gui"},
}
function M.get_attribute(hl_group, name)
  local hl_id = vim.api.nvim_get_hl_id_by_name(hl_group)
  local value = vim.fn.synIDattr(hl_id, unpack(ATTRIBUTES[name]))
  if value ~= "" then
    return value
  end
  return nil
end

return M
