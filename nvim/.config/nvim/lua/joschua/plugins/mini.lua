return {
	"echasnovski/mini.nvim",
	version = false, -- `main` branch (recommended)
	config = function()
		require("mini.surround").setup()
		require("mini.bracketed").setup()
		require("mini.indentscope").setup()
		require("mini.diff").setup()
		require("mini.jump2d").setup()
		-- Quickly stage and reset
		vim.keymap.set("n", "ghs", "ghgh", { remap = true })
		vim.keymap.set("n", "ghr", "gHgh", { remap = true })
		-- Toggle overlay
		vim.keymap.set("n", "ghp", "<Cmd>lua MiniDiff.toggle_overlay()<CR>")
		require("mini.pick").setup()
		require("mini.extra").setup()
		vim.keymap.set("n", "<leader>ff", "<Cmd>Pick files<CR>")
		vim.keymap.set("n", "<leader>fs", "<Cmd>Pick grep_live<CR>")
		vim.keymap.set("n", "<leader>fh", "<Cmd>Pick git_hunks<CR>")

		local MiniNotify = require("mini.notify") -- notifications
		local ids = {} -- CodeCompanion request ID --> MiniNotify notification ID
		local group = vim.api.nvim_create_augroup("CodeCompanionMiniNotifyHooks", {})

		local function format_status(ev)
			local name = ev.data.adapter.formatted_name or ev.data.adapter.name
			local msg = name .. " " .. ev.data.strategy .. " request..."
			local level, hl_group = "INFO", "DiagnosticInfo"
			if ev.data.status then
				msg = msg .. ev.data.status
				if ev.data.status ~= "success" then
					level, hl_group = "ERROR", "DiagnosticError"
				end
			end
			return msg, level, hl_group
		end

		vim.api.nvim_create_autocmd({ "User" }, {
			pattern = "CodeCompanionRequestStarted",
			group = group,
			callback = function(ev)
				local msg, level, hl_group = format_status(ev)
				ids[ev.data.id] = MiniNotify.add(msg, level, hl_group)
			end,
		})

		vim.api.nvim_create_autocmd({ "User" }, {
			pattern = "CodeCompanionRequestFinished",
			group = group,
			callback = function(ev)
				local msg, level, hl_group = format_status(ev)
				local mini_id = ids[ev.data.id]
				if mini_id then
					ids[ev.data.id] = nil
					MiniNotify.update(mini_id, { msg = msg, level = level, hl_group = hl_group })
				else
					mini_id = MiniNotify.add(msg, level, hl_group)
				end
				vim.defer_fn(function()
					MiniNotify.remove(mini_id)
				end, 5000)
			end,
		})
	end,
}
