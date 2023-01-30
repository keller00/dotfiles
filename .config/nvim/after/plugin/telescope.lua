local builtin = require('telescope.builtin')
local nmap = require("keller00.keymap").nmap

nmap('<leader>ff', builtin.find_files)
nmap('<C-p>', builtin.git_files)
nmap('<leader>fs', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
