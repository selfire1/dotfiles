return {
	-- file explorer
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local keymap = vim.keymap

		-- set custom mappings (without leader waiting for second argument)
		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")
			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end
			-- default mappings
			api.config.mappings.default_on_attach(bufnr)
			-- custom mappings
			vim.keymap.set("n", " ", api.node.open.edit, opts("Open"))
		end

		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		nvimtree.setup({
			view = {
				width = 35,
				relativenumber = true,
			},
			filters = {
				dotfiles = false,
			},
			on_attach = my_on_attach,
			renderer = {
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},
			-- disable window_picker for explorer to work well with window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
		})
		if not vim.g.shadowvim then
			keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
		end
		keymap.set("n", "<leader>fe", ":NvimTreeFindFile<CR>", { desc = "Find file in file explorer" })
	end,
}
