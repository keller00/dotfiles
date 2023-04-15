local nmap = require("keller00.keymap").nmap
local zen_mode = require("zen-mode")

zen_mode.setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  window = {
    width = .45 -- width will be 85% of the editor width
  }
}

nmap('<leader>z', zen_mode.toggle)
