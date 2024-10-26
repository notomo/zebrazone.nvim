local setup_highlight_groups = function()
  local highlightlib = require("zebrazone.vendor.misclib.highlight")
  return {
    ZebrazoneDefault = highlightlib.define("ZebrazoneDefault", {
      bg = vim.api.nvim_get_hl(0, { name = "StatusLineNC" }).bg or "#3a4b5c",
    }),
  }
end

local group = vim.api.nvim_create_augroup("zebrazone", {})
vim.api.nvim_create_autocmd({ "ColorScheme" }, {
  group = group,
  pattern = { "*" },
  callback = function()
    setup_highlight_groups()
  end,
})

return setup_highlight_groups()
