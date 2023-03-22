require("nvim-treesitter.configs").setup({
	matchup = {
		enable = true,
	},
	highlight = {
		enable = true,
		disable = {},
	},
	indent = {
		enable = true,
		disable = {},
	},
	ensure_installed = {
		"rust",
		"toml",
		"markdown",
		"markdown_inline",
		"c",
		"json",
		"yaml",
		"tsx",
		"fish",
		"json",
		"css",
		"html",
		"lua",
		"vim",
	},
	autotag = {
		enable = true,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

if is_windows() then
	local install = require("nvim-treesitter.install")
	install.prefer_git = false
	install.compilers = { "clang" }
end
