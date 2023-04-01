local utils = require("utils")

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
		"json",
		"yaml",
		"toml",
		"rust",
		"markdown",
		"markdown_inline",
		"c",
		"tsx",
		"fish",
		"css",
		"html",
		"lua",
		"vim",
		"regex",
		"bash",
	},
	autotag = {
		enable = true,
	},
})

local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "typescript.tsx" }

if utils.is_windows() then
	local install = require("nvim-treesitter.install")
	install.prefer_git = false
	install.compilers = { "clang" }
end
