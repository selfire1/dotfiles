return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp", -- connect language servers to completion
		{ "antosha417/nvim-lsp-file-operations", config = true },
		{ "folke/neodev.nvim", opts = {} }, -- improved lua language server when working with nvim config
	},
	config = function()
		-- import lspconfig plugin
		local lspconfig = require("lspconfig")

		-- setup swift lsp
		lspconfig.sourcekit.setup({
			capabilities = {
				workspace = {
					didChangeWatchedFiles = {
						dynamicRegistration = true,
					},
				},
			},
		})

		-- import mason_lspconfig plugin
		local mason_lspconfig = require("mason-lspconfig")

		-- import cmp-nvim-lsp plugin
		local cmp_nvim_lsp = require("cmp_nvim_lsp")

		local keymap = vim.keymap -- for conciseness

		local diagnostic_opts = {
			float = { border = "double" },
			-- Show gutter sings
			signs = {
				-- With highest priority
				priority = 9999,
				-- Only for warnings and errors
				severity = { min = "WARN", max = "ERROR" },
			},
			-- Show virtual text only for errors
			virtual_text = { severity = { min = "ERROR", max = "ERROR" } },
			-- Don't update diagnostics when typing
			update_in_insert = false,
		}

		vim.diagnostic.config(diagnostic_opts)

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf, silent = true }

				-- set keybindings
				opts.desc = "Show LSP references"
				keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

				opts.desc = "Declaration"
				keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

				opts.desc = "Definition"
				keymap.set("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definitions

				opts.desc = "Show LSP implementations"
				keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

				opts.desc = "Show LSP type definitions"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

				opts.desc = "See available code actions"
				keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

				opts.desc = "Show buffer diagnostics"
				keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

				opts.desc = "Show line diagnostics"
				keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

				opts.desc = "Go to previous diagnostic"
				keymap.set("n", "[d", function()
					vim.diagnostic.goto_prev({
						severity = { min = vim.diagnostic.severity.WARN },
					})
				end, { noremap = true, silent = true })

				opts.desc = "Go to next diagnostic"
				keymap.set("n", "]d", function()
					vim.diagnostic.goto_next({
						severity = { min = vim.diagnostic.severity.WARN },
					})
				end, { noremap = true, silent = true })

				opts.desc = "Show documentation for what is under cursor"
				keymap.set("n", "<leader>h", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
			end,
		})

		-- used to enable autocompletion (assign to every lsp server config)
		local capabilities = cmp_nvim_lsp.default_capabilities()

		mason_lspconfig.setup_handlers({
			["lua_ls"] = function()
				lspconfig["lua_ls"].setup({
					capabilities = capabilities,
					settings = {
						Lua = {
							-- make the language server recognize "vim" global
							diagnostics = {
								globals = { "vim", "hs" },
							},
							completion = {
								callSnippet = "Replace",
							},
						},
					},
				})
			end,
			["volar"] = function()
				lspconfig["volar"].setup({
					capabilities = capabilities,
					settings = {
						init_options = {
							typescript = {
								tsdk = "/Users/joschuag/.nvm/versions/node/v18.16.0/lib/node_modules/typescript/lib",
							},
						},
						filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
					},
				})
			end,
			["ts_ls"] = function()
				lspconfig["ts_ls"].setup({
					init_options = {
						plugins = {
							{
								name = "@vue/typescript-plugin",
								location = "/Users/joschuag/.nvm/versions/node/v18.16.0/lib/node_modules/@vue/typescript-plugin",
								languages = { "javascript", "typescript", "vue" },
							},
						},
					},
					filetypes = {
						"javascript",
						"typescript",
						"vue",
					},
					capabilities = capabilities,
				})
			end,
			["html"] = function()
				lspconfig["html"].setup({
					capabilities = capabilities,
				})
			end,
			["cssls"] = function()
				lspconfig["cssls"].setup({
					capabilities = capabilities,
				})
			end,
			["tailwindcss"] = function()
				lspconfig["tailwindcss"].setup({
					capabilities = capabilities,
				})
			end,
		})
	end,
}
