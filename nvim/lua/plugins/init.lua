return {
	-- UI
	{
		"stevearc/dressing.nvim",
		event = "VeryLazy",
		config = function()
			require("dressing").setup({
				input = {
					prompt_align = "left",
					insert_only = false,
					start_in_insert = true,
					win_options = {
						winblend = 0,
						wrap = false,
					},
				},
				select = {
					telescope = require('telescope.themes').get_cursor()
				}
			})
		end
	},
	{
		"romgrk/barbar.nvim",
		event = "VeryLazy",
		config = function()
			require("barbar").setup({
				animation = false,
			})
		end
	},
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		dependencies = {
			"arkav/lualine-lsp-progress"
		}
	},

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
			{
				"j-hui/fidget.nvim",
				event = "BufRead",
				config = function()
					require("fidget").setup({})
				end
			},
			"simrat39/rust-tools.nvim",
			"jose-elias-alvarez/null-ls.nvim",

			-- Completion
			{
				"hrsh7th/nvim-cmp",
				dependencies = {
					"hrsh7th/cmp-nvim-lsp",
					{
						"L3MON4D3/LuaSnip",
						event = "InsertCharPre",
						version = "v1.*",
						build = "make install_jsregexp",
						dependencies = { {
							"rafamadriz/friendly-snippets",
							event = "InsertCharPre",
						} },
					},
					"saadparwaiz1/cmp_luasnip",
					"hrsh7th/cmp-buffer",
					"hrsh7th/cmp-path",
					"hrsh7th/cmp-cmdline",
					"petertriho/cmp-git",
					"onsails/lspkind-nvim",
					"derektata/lorem.nvim",
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
				}
			},
		},
	},

	-- Flutter tools
	{ "akinsho/flutter-tools.nvim", event = "VeryLazy" },
	{ "reisub0/hot-reload.vim",     event = "VeryLazy" },

	-- Run/Test/Debug
	{ "mfussenegger/nvim-dap",      event = "VeryLazy" },
	{ "rcarriga/nvim-dap-ui",       event = "VeryLazy" },

	-- Telescope
	{ "nvim-lua/plenary.nvim",      lazy = true },
	{
		"nvim-telescope/telescope.nvim",
		version = "0.1.0",
		dependencies = {
			{ "nvim-telescope/telescope-file-browser.nvim",  lazy = true },
			{ "nvim-telescope/telescope-smart-history.nvim", lazy = true },
			{ "nvim-telescope/telescope-fzy-native.nvim",    lazy = true },
			{ "nvim-telescope/telescope-ui-select.nvim",     lazy = true },
			{ "nvim-telescope/telescope-project.nvim",       lazy = true },
			{ "kkharji/sqlite.lua",                          lazy = true },
		}
	},

	-- Git
	{ "dinhhuy258/git.nvim",       event = "BufEnter" },
	{ "lewis6991/gitsigns.nvim",   event = "BufEnter" },
	{ "TimUntersberger/neogit",    event = "VeryLazy" },
	{ "sindrets/diffview.nvim",    event = "VeryLazy" },
	{ "akinsho/git-conflict.nvim", version = "*" },

	-- Misc
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"nvim-treesitter/nvim-treesitter-context"
		}
	},
	"goolord/alpha-nvim",
}
