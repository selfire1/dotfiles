return {
	-- commenting with gc
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()
		local ft = require("Comment.ft")
		ft.set("pug", "//-%s")
	end,
}
