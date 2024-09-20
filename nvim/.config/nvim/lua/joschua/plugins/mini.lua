return {
	"echasnovski/mini.nvim",
	version = false, -- `main` branch (recommended)
	config = function()
		require("mini.jump").setup()
		require("mini.pairs").setup()
		require("mini.surround").setup()
		require("mini.bracketed").setup()
		require("mini.indentscope").setup()
		require("mini.diff").setup()
		-- Quickly stage and reset
		vim.keymap.set("n", "ghs", "ghgh", { remap = true })
		vim.keymap.set("n", "ghr", "gHgh", { remap = true })
		-- Toggle overlay
		vim.keymap.set("n", "ghp", "<Cmd>lua MiniDiff.toggle_overlay()<CR>")
	end,
}
