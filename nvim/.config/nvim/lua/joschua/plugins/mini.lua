return {
	"echasnovski/mini.nvim",
	version = false, -- `main` branch (recommended)
	config = function()
		require("mini.jump").setup()
		require("mini.pairs").setup()
		require("mini.surround").setup()
	end,
}
