-- TODO

-- Map Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Line Numbers
vim.o.number = true
vim.o.relativenumber = true

-- Dont show the mode at the bottom
vim.o.showmode = false

-- Connect Host Clipboard
vim.schedule(function()
	vim.o.clipboard = "unnamedplus"
end)

-- Saves Undo History
vim.o.undofile = true

-- Search Case Sensitivity
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.scrolloff = 10

-- Tabbing
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

-- NeoVim Colorscheme
vim.cmd.colorscheme("habamax")

-- Loading Plugins
require("config.lazy")
require("config.yank")
require("config.keybinds")
