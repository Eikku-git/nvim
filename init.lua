vim.wo.relativenumber = true;
vim.wo.number = true;

vim.opt.cursorline = true;
vim.opt.tabstop = 4;
vim.opt.shiftwidth = 4
vim.opt.smartindent = true;

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
	"mfussenegger/nvim-dap",

	"neoclide/coc.nvim",

	"nvim-treesitter/nvim-treesitter",
	"tikhomirov/vim-glsl",
	"wakatime/vim-wakatime",

	{ "williamboman/mason.nvim",
		ensure_installed = {
			"clangd"
		}
	}
}

vim.cmd([[
	inoremap <silent><expr> <tab> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<TAB>"
]]
)

require("mason").setup()

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

require 'nvim-treesitter.install'.prefer_git = false
require 'nvim-treesitter.install'.compilers = { 'clangd' }

require("custom.lspconfig")
