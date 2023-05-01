local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.force_reverse_video_cursor = true
config.color_scheme = "Kanagawa (Gogh)"

-- config.font = wezterm.font("NotoSansMono Nerd Font")
config.font = wezterm.font("Iosevka Nerd Font")
config.font_size = 16

config.default_prog = { "powershell" }

return config
