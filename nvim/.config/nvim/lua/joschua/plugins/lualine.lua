return {
	-- statusline
	"nvim-lualine/lualine.nvim",
	config = function()
		local lualine = require("lualine")
		lualine.setup({
			options = {
				theme = "zenbones",
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = {
					{ "filetype", icon_only = true },
					{ "filename", path = 4, symbols = { modified = "●" } },
					"diff",
				},
				-- lualine_b = {  },
				lualine_c = { { "diagnostics", sources = { "nvim_diagnostic" } } },
				-- ---
				lualine_x = { { "branch", icons_enabled = false } },
				lualine_y = {},
				lualine_z = { "progress" },
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {
					{ "filetype", icon_only = true, colored = false },
					{ "filename", path = 4, symbols = { modified = "●" } },
				},
				lualine_c = { "" },
				lualine_x = { "" },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
