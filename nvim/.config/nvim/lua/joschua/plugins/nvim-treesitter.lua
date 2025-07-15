return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		"windwp/nvim-ts-autotag",
	},
	config = function()
		-- import nvim-treesitter plugin
		local treesitter = require("nvim-treesitter.configs")

		-- configure treesitter
		treesitter.setup({ -- enable syntax highlighting
			highlight = {
				enable = true,
			},
			-- enable indentation
			-- indent = { enable = true },
			-- enable autotagging (w/ nvim-ts-autotag plugin)
			-- autotag = {
			-- 	enable = true,
			-- },
			-- ensure these language parsers are installed
			-- ensure_installed = {
			-- 	"json",
			-- 	"javascript",
			-- 	"typescript",
			-- 	"tsx",
			-- 	"yaml",
			-- 	"html",
			-- 	"css",
			-- 	"markdown",
			-- 	"markdown_inline",
			-- 	"svelte",
			-- 	"graphql",
			-- 	"bash",
			-- 	"lua",
			-- 	"vim",
			-- 	"dockerfile",
			-- 	"gitignore",
			-- 	"query",
			-- 	"vue",
			-- 	"pug",
			-- },
			-- incremental_selection = {
			-- 	enable = true,
			-- 	keymaps = {
			-- 		init_selection = "<M-o>",
			-- 		scope_incremental = "<M-O>",
			-- 		node_incremental = "<M-o>",
			-- 		node_decremental = "<M-i>",
			-- 	},
			-- },
		})
	end,
}
