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
		require("mini.jump2d").setup()
		require("mini.pick").setup()
		require("mini.extra").setup()
		vim.keymap.set("n", "<leader>ff", "<Cmd>Pick files<CR>")
		vim.keymap.set("n", "<leader>fs", "<Cmd>Pick grep_live<CR>")
		vim.keymap.set("n", "<leader>fh", "<Cmd>Pick git_hunks<CR>")
	end,
}
