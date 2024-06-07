vim.wo.relativenumber = true;
vim.opt.cursorline = true;
vim.wo.number = true;

vim.g.mapleader = ","
vim.g.localleader = "\\"

require("neofusion").load()
require("ibl").setup()

vim.cmd([[
filetype indent off
]])

require "paq" {
	"savq/paq-nvim",

	"neovim/nvim-lspconfig",
	"simrat39/rust-tools.nvim",
	"nvim-lua/plenary.nvim",
 	"mfussenegger/nvim-dap"
}

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
