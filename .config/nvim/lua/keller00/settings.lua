-- Setup cursor
vim.opt.guicursor = "n-c-v:block,i-ci:ver30-blinkwait300-blinkon200-blinkoff150"

vim.opt.errorbells = false  -- turn off error ding

vim.opt.number = true  -- absolute line numbers
vim.opt.relativenumber = true  -- relative line numbers
vim.opt.ruler = true  -- show current position
vim.opt.scrolloff = 4  -- start scrolling early
vim.opt.wrapscan = true  -- search wraps around file

vim.opt.expandtab = true  -- use spaces instead of tabs
vim.opt.smarttab = true  -- be smart about tabs
vim.opt.shiftwidth = 4  -- use spaces for indent actions
vim.opt.tabstop = 4

vim.opt.smartindent = true  -- automatically (de/in)dent lines after starting characters, e.g.: {
vim.opt.autoindent = true  -- copy indent from current line when starting a  new one
vim.opt.wrap = false  -- don't wrap lines
vim.opt.incsearch = true  -- make search act like search in modern browsers
vim.opt.hlsearch = false  -- highlight search

vim.opt.swapfile = false  -- don't use swapfiles
vim.opt.wb = false  -- don't create backup file before overwriting file
vim.opt.backup = false  -- don't keep the backup file around afterwards
vim.opt.updatetime = 50  -- trigger coffee making event quickly
vim.opt.undofile = true  -- save an undofile to undodir
vim.opt.signcolumn = "yes"

vim.g.mapleader = " "
vim.opt.termguicolors = true -- rgb terminal colors
