return {
	"echasnovski/mini.nvim",
	version = false, -- `main` branch (recommended)
	config = function()
		require("mini.jump").setup()
		require("mini.pairs").setup()
		require("mini.surround").setup()
		require("mini.bracketed").setup()
		require("mini.indentscope").setup()
	end,
}
