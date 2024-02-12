local wezterm = require("wezterm")
local config = {}

-- In newer versions of wezterm, use the config_builder which will help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- https://github.com/evantravers/dotfiles/blob/master/wezterm/.wezterm.lua
function Scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "zenbones_dark"
	else
		return "zenbones_light"
	end
end

config = {
	color_scheme = Scheme_for_appearance(wezterm.gui.get_appearance()),
	font = wezterm.font_with_fallback({
		{
			family = "Monaspace Neon Var",
			weight = 900,
			harfbuzz_features = {
				"calt",
				"liga",
				"dlig",
				"ss01",
				"ss02",
				"ss03",
				"ss04",
				"ss05",
				"ss06",
				"ss07",
				"ss08",
			},
		},
	}),
	font_size = 16.0,
	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	adjust_window_size_when_changing_font_size = false,
	line_height = 1.1,
	term = "wezterm",
	send_composed_key_when_left_alt_is_pressed = false,
	send_composed_key_when_right_alt_is_pressed = false,
	window_close_confirmation = "NeverPrompt",
}

-- and finally, return the configuration to wezterm
return config
