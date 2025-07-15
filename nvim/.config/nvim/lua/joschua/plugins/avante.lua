return {
	"olimorris/codecompanion.nvim",
	opts = {
		strategies = {
			chat = {
				adapter = "gemini",
				keymaps = {
					close = {
						modes = { n = "<C-q>", i = "<C-q>" },
						opts = {},
					},
				},
			},
			inline = {
				adapter = "gemini",
			},
			cmd = {
				adapter = "gemini",
			},
		},
		adapters = {
			gemini = function()
				local keysPath = vim.fn.expand("~/.dotfiles/keys/gemini_api_key.gpg")
				return require("codecompanion.adapters").extend("gemini", {
					env = {
						api_key = "cmd: gpg --batch --quiet --decrypt " .. keysPath,
					},
				})
			end,
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	config = function()
		vim.keymap.set(
			{ "n", "v" },
			"<leader>A",
			"<cmd>CodeCompanionActions<cr>",
			{ noremap = true, silent = true, desc = "✨ Actions" }
		)
		vim.keymap.set(
			{ "n", "v" },
			"<leader>a",
			"<cmd>CodeCompanionChat Toggle<cr>",
			{ noremap = true, silent = true, desc = "✨ Toggle Chat" }
		)
		vim.keymap.set(
			"v",
			"<leader>c",
			"<cmd>CodeCompanionChat Add<cr>",
			{ noremap = true, silent = true, desc = "✨ Add to Chat" }
		)

		-- Expand 'cc' into 'CodeCompanion' in the command line
		vim.cmd([[cab cc CodeCompanion]])
	end,
}
