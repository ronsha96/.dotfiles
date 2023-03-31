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
	{ "ellisonleao/gruvbox.nvim", lazy = true },
	{ "Shatur/neovim-ayu", lazy = true },
	{ "EdenEast/nightfox.nvim", lazy = true },
	{ "folke/tokyonight.nvim", lazy = true },
	{ "rebelot/kanagawa.nvim", lazy = true },

	-- Tab line
	"romgrk/barbar.nvim",

	-- Status line
	"nvim-lualine/lualine.nvim",
	"arkav/lualine-lsp-progress",

	-- Lsp
	"neovim/nvim-lspconfig",
	"onsails/lspkind-nvim",
	"glepnir/lspsaga.nvim",
	"jose-elias-alvarez/null-ls.nvim",
	"j-hui/fidget.nvim",
	"simrat39/rust-tools.nvim",
	"akinsho/flutter-tools.nvim",
	"folke/lsp-colors.nvim",
	"nvim-lua/popup.nvim",
	"reisub0/hot-reload.vim",

	-- Completion
	"hrsh7th/nvim-cmp",
	{
		"L3MON4D3/LuaSnip",
		version = "v1.*",
		build = "make install_jsregexp",
		dependencies = { "rafamadriz/friendly-snippets" },
	},
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"petertriho/cmp-git",

	-- Run/Test/Debug
	"stevearc/overseer.nvim",
	"mfussenegger/nvim-dap",
	"rcarriga/nvim-dap-ui",

	-- Telescope
	"nvim-lua/plenary.nvim",
	{ "nvim-telescope/telescope.nvim", version = "0.1.0" },
	"kkharji/sqlite.lua",
	"nvim-telescope/telescope-file-browser.nvim",
	"nvim-telescope/telescope-smart-history.nvim",
	"nvim-telescope/telescope-fzy-native.nvim",
	"nvim-telescope/telescope-ui-select.nvim",
	"nvim-telescope/telescope-project.nvim",

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
	"windwp/nvim-ts-autotag",
	"windwp/nvim-autopairs",
	"nvim-tree/nvim-web-devicons",
	"numToStr/Comment.nvim",
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
	"ThePrimeagen/harpoon",
	"andymass/vim-matchup",
	"akinsho/toggleterm.nvim",
	"romainl/vim-cool",
	"goolord/alpha-nvim",
	"lukas-reineke/indent-blankline.nvim",
})
