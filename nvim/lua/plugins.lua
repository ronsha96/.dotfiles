local status, packer = pcall(require, "packer")
if not status then
	print("Packer is not installed")
	return
end

vim.cmd([[packadd packer.nvim]])

packer.startup(function(use)
	use("wbthomason/packer.nvim")

	-- Better type checking for config development
	use("folke/neodev.nvim")

	-- Themes
	use("ellisonleao/gruvbox.nvim")
	use("Shatur/neovim-ayu")
	use("EdenEast/nightfox.nvim")
	use("folke/tokyonight.nvim")
	use("rebelot/kanagawa.nvim")

	-- Lualine
	use("arkav/lualine-lsp-progress")
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- Lsp
	use("neovim/nvim-lspconfig")
	use("onsails/lspkind-nvim")
	use("glepnir/lspsaga.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("j-hui/fidget.nvim")
	use("simrat39/rust-tools.nvim")
	use("akinsho/flutter-tools.nvim")
	use("folke/lsp-colors.nvim")
	use("nvim-lua/popup.nvim")
	use("reisub0/hot-reload.vim") -- Use for hot-reloading flutter on save

	-- Completion
	use("hrsh7th/nvim-cmp")
	use({
		"L3MON4D3/LuaSnip",
		tag = "v1.*",
		run = "make install_jsregexp",
		requires = { "rafamadriz/friendly-snippets" },
	})
	use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
	use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
	use({ "petertriho/cmp-git", after = "nvim-cmp" })

	-- Run/Test/Debug
	use("stevearc/overseer.nvim")
	use("mfussenegger/nvim-dap")
	use("rcarriga/nvim-dap-ui")

	-- Telescope
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0", requires = { { "nvim-lua/plenary.nvim" } } })
	use("kkharji/sqlite.lua")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("nvim-telescope/telescope-smart-history.nvim")
	use("nvim-telescope/telescope-fzy-native.nvim")
	use("nvim-telescope/telescope-ui-select.nvim")
	use("nvim-telescope/telescope-project.nvim")

	-- Git
	use("dinhhuy258/git.nvim")
	use("lewis6991/gitsigns.nvim")
	use({ "akinsho/git-conflict.nvim", tag = "*" })
	use("TimUntersberger/neogit")
	use("sindrets/diffview.nvim")

	-- DB
	use("tpope/vim-dadbod")
	use("kristijanhusak/vim-dadbod-ui")
	use("kristijanhusak/vim-dadbod-completion")

	-- Misc
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("windwp/nvim-ts-autotag")
	use("windwp/nvim-autopairs")
	use("nvim-tree/nvim-web-devicons")
	use({ "romgrk/barbar.nvim", wants = "nvim-web-devicons" })
	use("numToStr/Comment.nvim")
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup({})
		end,
	})
	use({
		"ggandor/leap.nvim",
		keys = { "s", "S" },
		config = function()
			local leap = require("leap")
			leap.set_default_keymaps()
		end,
	})
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})
	use("mg979/vim-visual-multi")
	use("derektata/lorem.nvim")
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	})
	use("lambdalisue/suda.vim")
	use("ThePrimeagen/harpoon")
	use("andymass/vim-matchup")
	use("akinsho/toggleterm.nvim")
	use("brooth/far.vim")
	use("lukas-reineke/indent-blankline.nvim")
	use("lewis6991/impatient.nvim")
	use({
		"goolord/alpha-nvim",
		requires = { "nvim-tree/nvim-web-devicons" },
	})
end)

-- auto compile plugins
vim.cmd([[
   augroup packer_user_config
     autocmd!
     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
   augroup end
]])
