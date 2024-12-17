-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
map = vim.keymap.set
map("n", "0", "^", { desc = "make 0 jump to first non-empty character" })
