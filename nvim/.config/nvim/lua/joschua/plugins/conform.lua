return {
	"stevearc/conform.nvim",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to disable, comment this out
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				vue = { "eslint_d" },
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				svelte = { "eslint_d" },
				css = { "eslint_d" },
				html = { "eslint_d" },
				json = { "eslint_d" },
				yaml = { "eslint_d" },
				markdown = { "eslint_d" },
				graphql = { "eslint_d" },
				lua = { "stylua" },
				python = { "isort", "black" },
				swift = { "swiftformat" },
			},
			format_on_save = {
				lsp_format = "fallback",
				async = false,
				timeout_ms = 3000,
			},
		})
	end,
}
