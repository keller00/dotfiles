local nmap = require("keller00.keymap").nmap
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

nmap('<leader>a', mark.add_file)
nmap('<C-e>', ui.toggle_quick_menu)

nmap('<C-h>', function() ui.nav_file(1) end)
nmap('<C-t>', function() ui.nav_file(2) end)
nmap('<C-n>', function() ui.nav_file(3) end)
nmap('<C-s>', function() ui.nav_file(4) end)
