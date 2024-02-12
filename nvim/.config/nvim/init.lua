require("joschua.core")
require("joschua.lazy")

-- format .astro files
-- vim.cmd([[
--    augroup RunCommandOnAstroSave
--      autocmd!
--      autocmd BufWritePost *.astro call system('npx prettier -w ' . expand('%')) | e
--    augroup END
--  ]])

-- PLUGINS
-- require("lazy").setup({
-- 	-- snippets
-- 	"hrsh7th/cmp-nvim-lsp",
-- 	"hrsh7th/cmp-cmdline",
-- 	{
-- 		"glepnir/lspsaga.nvim",
-- 		event = "BufRead",
-- 		config = function()
-- 			require("lspsaga").setup({
-- 				symbol_in_winbar = {
-- 					enable = false,
-- 					separator = " › ",
-- 					color_mode = false,
-- 				},
-- 			})
-- 		end,
-- 		dependencies = { { "nvim-tree/nvim-web-devicons" } },
-- 	},
-- 	"neovim/nvim-lspconfig",
-- 	"jose-elias-alvarez/null-ls.nvim",
-- 	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
-- })

-- devicons
-- require("nvim-web-devicons").setup({
-- 	strict = true,
-- 	override_by_extension = {
-- 		astro = {
-- 			icon = "",
-- 			color = "#EF8547",
-- 			name = "astro",
-- 		},
-- 	},
-- })

-- Diagnostic jump with filters such as only jumping to an error
-- vim.keymap.set("n", "[E", function()
-- 	require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end)
-- vim.keymap.set("n", "]E", function()
-- 	require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end)
--

----------------------
-- Plugin Keybinds
----------------------

-- filtetypes
-- MDX
-- vim.filetype.add({
-- 	extension = {
-- 		mdx = "mdx",
-- 	},
-- })

---------------------
-- Macro keymaps
---------------------
-- local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
-- ft_to_parser.mdx = "markdown"

-- vim.treesitter.language.register("markdown", "mdx") -- the someft filetype will use the python parser and queries.
-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.vue.install_info.url = "https://github.com/zealot128/tree-sitter-vue.git"
