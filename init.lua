vim.wo.relativenumber = true;
vim.opt.cursorline = true;

vim.g.mapleader = ","
vim.g.localleader = "\\"

require("neofusion").load()
require("ibl").setup()

vim.cmd([[
filetype indent off
]])
