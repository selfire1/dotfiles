-- Pull in the wezterm API
local wezterm = require("wezterm")

local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

-- Set colour scheme based on appearance
local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "zenbones_dark"
	else
		return "zenbones_light"
	end
end

return {
	-- fonts
	font = wezterm.font_with_fallback({
		{
			family = "JetBrains Mono",
			weight = 700,
			harfbuzz_features = {
				"calt",
				"liga",
				"dlig",
				"ss01",
			},
		},
	}),
	keys = {
		{
			key = "Enter",
			mods = "OPT",
			action = wezterm.action.DisableDefaultAssignment,
		},
		{
			key = "L",
			mods = "CMD|SHIFT",
			action = wezterm.action.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, pane, line)
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
	},
	font_size = 13.0,
	line_height = 1.02,
	-- theme
	color_scheme = scheme_for_appearance(get_appearance()),
	-- window and UI
	window_padding = {
		left = "2cell",
		right = "2cell",
		top = "1cell",
		bottom = "1cell",
	},
	window_decorations = "RESIZE",
	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	default_cursor_style = "BlinkingUnderline",
	-- term
	term = "wezterm",
}
