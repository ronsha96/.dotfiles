local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	-- Better type checking for config development
	{
		"folke/neodev.nvim",
		config = function()
			require("neodev").setup({
				library = {
					types = true,
					plugins = { "nvim-dap-ui" },
				},
			})
		end,
	},

	-- Themes/Colors
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
				undercurl = true, -- enable undercurls
				commentStyle = { italic = false },
				functionStyle = { italic = false },
				keywordStyle = { italic = false },
				statementStyle = { italic = false, bold = true },
				typeStyle = { italic = false },
				variablebuiltinStyle = { italic = false },
				specialReturn = true, -- special highlight for the return keyword
				specialException = true, -- special highlight for exception handling keywords
				transparent = false, -- do not set background color
				dimInactive = false, -- dim inactive window `:h hl-NormalNC`
				globalStatus = false, -- adjust window separators highlight for laststatus=3
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = {},
				overrides = function()
					return {}
				end,
				theme = "default", -- Load "default" theme or the experimental "light" theme
			})

			vim.cmd([[colorscheme kanagawa]])
		end
	},

	-- Tab line
	"romgrk/barbar.nvim",

	-- Status line
	"nvim-lualine/lualine.nvim",
	"arkav/lualine-lsp-progress",

	-- Lsp
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- Lsp
			"neovim/nvim-lspconfig",
			{
				"williamboman/mason.nvim",
				build = function()
					vim.cmd [[MasonUpdate]]
				end,
			},
			"williamboman/mason-lspconfig.nvim",
			"onsails/lspkind-nvim",
			"j-hui/fidget.nvim",

			-- Completion
			{
				"hrsh7th/nvim-cmp",
				dependencies = {
					"hrsh7th/cmp-nvim-lsp",
					{
						"L3MON4D3/LuaSnip",
						version = "v1.*",
						build = "make install_jsregexp",
						dependencies = { "rafamadriz/friendly-snippets" },
					},
					"saadparwaiz1/cmp_luasnip",
					"hrsh7th/cmp-buffer",
					"hrsh7th/cmp-path",
					"hrsh7th/cmp-cmdline",
					"petertriho/cmp-git",
				}
			},
		},
	},

	-- Flutter tools
	{ "akinsho/flutter-tools.nvim",                  event = "VeryLazy" },
	{ "reisub0/hot-reload.vim",                      event = "VeryLazy" },

	-- Run/Test/Debug
	{ "stevearc/overseer.nvim",                      event = "VeryLazy" },
	{ "mfussenegger/nvim-dap",                       event = "VeryLazy" },
	{ "rcarriga/nvim-dap-ui",                        event = "VeryLazy" },

	-- Telescope
	{ "nvim-lua/plenary.nvim",                       lazy = true },
	{ "nvim-telescope/telescope.nvim",               version = "0.1.0" },
	{ "kkharji/sqlite.lua",                          lazy = true },
	{ "nvim-telescope/telescope-file-browser.nvim",  lazy = true },
	{ "nvim-telescope/telescope-smart-history.nvim", lazy = true },
	{ "nvim-telescope/telescope-fzy-native.nvim",    lazy = true },
	{ "nvim-telescope/telescope-ui-select.nvim",     lazy = true },
	{ "nvim-telescope/telescope-project.nvim",       lazy = true },

	-- Git
	"dinhhuy258/git.nvim",
	"lewis6991/gitsigns.nvim",
	"TimUntersberger/neogit",
	"sindrets/diffview.nvim",
	{ "akinsho/git-conflict.nvim", version = "*" },

	-- Misc
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup()
		end
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup()
		end
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = true,
		config = function()
			require("nvim-web-devicons").setup()
		end
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end
	},
	{
		"folke/todo-comments.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	},
	{
		"ggandor/leap.nvim",
		keys = { "s", "S" },
		config = function()
			require("leap").set_default_keymaps()
		end,
	},
	{
		"nvim-tree/nvim-tree.lua",
		version = "nightly",
	},
	"mg979/vim-visual-multi",
	"derektata/lorem.nvim",
	"lambdalisue/suda.vim",
	{ "ThePrimeagen/harpoon",      lazy = true },
	"andymass/vim-matchup",
	"akinsho/toggleterm.nvim",
	"romainl/vim-cool",
	"goolord/alpha-nvim",
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("indent_blankline").setup({})
		end
	},
})
