local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.force_reverse_video_cursor = true
config.color_scheme = "Kanagawa (Gogh)"
config.use_fancy_tab_bar = false

config.tab_bar = {
	font_size = 12,
	active_tab = {
		bold = true,
	},
}

config.tab_bar_at_bottom = false

-- config.font = wezterm.font("NotoSansMono Nerd Font")
config.font = wezterm.font("Iosevka Nerd Font")
config.font_size = 16

config.default_prog = { "powershell" }

config.keys = {
	{
		key = "h",
		mods = "CTRL|ALT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CTRL|ALT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "k",
		mods = "CTRL|ALT",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "j",
		mods = "CTRL|ALT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "w",
		mods = "CTRL|ALT",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	{
		key = "'",
		mods = "CTRL|ALT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = '"',
		mods = "CTRL|ALT|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "n",
		mods = "CTRL|ALT",
		action = act.RotatePanes("Clockwise"),
	},
}

return config
