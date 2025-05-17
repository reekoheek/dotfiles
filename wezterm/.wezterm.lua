-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = "Gruvbox Dark (Gogh)"
config.color_scheme = "Gruvbox dark, hard (base16)"

config.font_size = 13

config.font = wezterm.font_with_fallback({
	{
		family = "JetBrains Mono",
	},
	{
		family = "JetBrainsMono Nerd Font",
	},
	-- {
	-- 	family = "FiraCode Nerd Font",
	-- },
	-- {
	-- 	family = "VictorMono Nerd Font",
	-- },
	-- {
	-- 	family = "Symbols Nerd Font",
	-- },
	-- {
	-- 	family = "Font Awesome 6 Free",
	-- },
})

config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
	left = 10,
	right = 10,
	top = 0,
	bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
