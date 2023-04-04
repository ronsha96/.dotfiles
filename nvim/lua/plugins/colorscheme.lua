return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = false,
		priority = 1000,
		enabled = false,
		config = function()
			require("gruvbox").setup({ contrast = "dark", italics = false })
			vim.cmd([[colorscheme gruvbox]])
		end
	},
	{
		"Shatur/neovim-ayu",
		lazy = false,
		priority = 1000,
		enabled = false,
		config = function()
			local mirage = false
			local colors = require("ayu.colors")
			colors.generate(mirage)

			local ayu = require("ayu")

			ayu.setup({
				mirage = mirage,
				overrides = function()
					return { Comment = { fg = colors.comment } }
				end,
			})

			ayu.colorscheme()
		end
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		enabled = false,
		config = function()
			require("nightfox").setup()
			vim.cmd([[colorscheme nordfox]])
		end
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		enabled = false,
		config = function()
			require("tokyonight").setup({
				style = "storm",
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
				},
			})
			vim.cmd([[colorscheme tokyonight]])
		end
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = false,
		priority = 1000,
		enabled = true,
		config = function()
			require("kanagawa").setup({
				compile = false,
				undercurl = true,
				commentStyle = { italic = false },
				functionStyle = { italic = false },
				keywordStyle = { italic = false },
				statementStyle = { italic = false, bold = true },
				typeStyle = { italic = false },
				variablebuiltinStyle = { italic = false },
				specialReturn = true,
				specialException = true,
				transparent = false,
				dimInactive = false,
				globalStatus = false,
				terminalColors = true,
				colors = {
					theme = {
						all = {
							ui = {
								bg_gutter = "none",
								float = {
									bg = "none"
								}
							}
						}
					}
				},
				overrides = function(colors)
					local theme = colors.theme
					return {
						-- cmp-nvim
						Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
						PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
						PmenuSbar = { bg = theme.ui.bg_m1 },
						PmenuThumb = { bg = theme.ui.bg_p2 },
						-- transparent floats
						NormalFloat = { bg = "none" },
						FloatBorder = { bg = "none" },
						FloatTitle = { bg = "none" },
						NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
						LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
						MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
					}
				end,
				theme = "wave",
				background = {
					dark = "wave",
					light = "lotus",
				}
			})

			vim.cmd([[colorscheme kanagawa]])
		end
	},
}
