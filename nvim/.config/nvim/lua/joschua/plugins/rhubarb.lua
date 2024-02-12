return {
	"tpope/vim-rhubarb", -- github integration
	config = function()
		vim.keymap.set("n", "<leader>gy", ":.GBrowse!<CR>") -- yank github link
		vim.keymap.set("x", "<leader>gy", ":'<'>GBrowse!<CR>") -- yank github link when selecting lines
	end,
}
