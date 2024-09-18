return {
	"mcchrish/zenbones.nvim",
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		-- load the colorscheme here
		vim.cmd("colorscheme zenbones")
		vim.cmd("highlight Folded guibg=NONE guifg=#6E6763")
	end,
	dependencies = {
		"rktjmp/lush.nvim",
	},
}
