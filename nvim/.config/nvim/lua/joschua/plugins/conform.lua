return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters = {
				prettier = {
					require_cwd = true,
				},
				eslint_d = {
					require_cwd = true,
				},
			},
			formatters_by_ft = {
				vue = { "eslint_d", "prettier" },
				javascript = { "eslint_d", "prettier" },
				typescript = { "eslint_d", "prettier" },
				javascriptreact = { "eslint_d", "prettier" },
				typescriptreact = { "eslint_d", "prettier" },
				svelte = { "eslint_d", "prettier" },
				css = { "eslint_d", "prettier" },
				html = { "eslint_d", "prettier" },
				json = { "eslint_d", "prettier" },
				yaml = { "eslint_d", "prettier" },
				markdown = { "eslint_d", "prettier" },
				graphql = { "eslint_d", "prettier" },
				lua = { "stylua" },
				python = { "isort", "black" },
				swift = { "swiftformat" },
			},
			format_on_save = {
				-- lsp_format = "prefer",
				async = false,
				timeout_ms = 3000,
			},
		})
	end,
}
