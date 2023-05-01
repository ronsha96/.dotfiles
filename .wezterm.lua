local wezterm = require("wezterm")
local act = wezterm.action

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.default_prog = { "powershell" }

-- local font_noto= "NotoSansMono Nerd Font"
local font_iosevka = "Iosevka Nerd Font"

config.use_fancy_tab_bar = true
config.force_reverse_video_cursor = true

config.color_scheme = "Kanagawa (Gogh)"
config.colors = {
	tab_bar = {
		background = "#0f0f13",
		inactive_tab_edge = "#0f0f13",
		active_tab = {
			bg_color = "#1f1f28",
			fg_color = "#dbd7bc",
		},
		inactive_tab = {
			bg_color = "#0f0f13",
			fg_color = "#727169",
		},
		inactive_tab_hover = {
			bg_color = "#0f0f13",
			fg_color = "#dbd7bc",
		},
		new_tab = {
			bg_color = "#0f0f13",
			fg_color = "#727169",
		},
		new_tab_hover = {
			bg_color = "#251863",
			fg_color = "#dbd7bc",
		},
	},
}

config.window_frame = {
	font = wezterm.font({ family = font_iosevka, weight = "Bold" }),
	font_size = 12,
	active_titlebar_bg = "#0f0f13",
	inactive_titlebar_bg = "#0f0f13",
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.font = wezterm.font(font_iosevka)
config.font_size = 16

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
