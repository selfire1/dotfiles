return {
	"olimorris/codecompanion.nvim",
	opts = {
		display = {
			diff = {
				enabled = true,
				provider = "mini_diff",
			},
		},
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
				local secrets = require("joschua.secrets")
				return require("codecompanion.adapters").extend("gemini", {
					env = {
						api_key = secrets.geminiKey,
					},
				})
			end,
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
}
