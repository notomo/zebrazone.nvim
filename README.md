# zebrazone.nvim

This is a toy highlight plugin that makes buffer striped.

## Default

```lua
require("zebrazone").start()
require("zebrazone").stop()
```

<img src="https://raw.github.com/wiki/notomo/zebrazone.nvim/image/default.png" width="1280">

## Rainbow

```lua
local colors = {"f5b090", "fcd7a1", "fff9b1", "a5d4ad", "a3bce2", "a59aca", "cfa7cd"}
local hl_groups = vim.tbl_map(function(color)
  local name = "Zebrazone_" .. color
  vim.cmd(("highlight! %s guibg=#%s"):format(name, color))
  return name
end, colors)
require("zebrazone").start({hl_groups = hl_groups})
```

<img src="https://raw.github.com/wiki/notomo/zebrazone.nvim/image/rainbow.png" width="1280">
