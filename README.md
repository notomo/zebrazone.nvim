This is a toy highlight plugin that makes buffer striped.

```lua
-- Default
require("zebrazone").start()
require("zebrazone").stop()

-- Rainbow
local colors = {"f5b090", "fcd7a1", "fff9b1", "a5d4ad", "a3bce2", "a59aca", "cfa7cd"}
local hl_groups = vim.tbl_map(function(color)
  local name = "Zebrazone_" .. color
  vim.cmd(("highlight! %s guibg=#%s"):format(name, color))
  return name
end, colors)
require("zebrazone").start({hl_groups = hl_groups})
```
