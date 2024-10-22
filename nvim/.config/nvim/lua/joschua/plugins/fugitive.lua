return {
	"tpope/vim-fugitive",
	config = function()
		local keymap = vim.keymap -- for conciseness
		-- Git keybinds / fugitive keybinds
		keymap.set("n", "<leader>g", ":G<CR>") -- open Git view
		keymap.set("n", "<leader>go", ":G<CR>") -- open Git view

		keymap.set("n", "<leader>gs", ":Gwrite <CR>") -- git stage
		keymap.set("n", "<leader>gc", ":G commit<CR>") -- git commit

		keymap.set("n", "<leader>gsc", ":Gwrite | :G commit<CR>") -- git stage and commit
		keymap.set("n", "<leader>gg", ":Gwrite | :G commit<CR>") -- git stage and commit

		keymap.set("n", "<leader>gp", ":G push<CR>") -- git push
		keymap.set("n", "<leader>gl", ":G log --pretty --oneline<CR>") -- git log
		keymap.set("n", "<leader>gi", ":G rebase -i<CR>") -- git rebase
	end,
}
