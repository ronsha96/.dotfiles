return {
	{ "andymass/vim-matchup", event = "VeryLazy" },
	{ "romainl/vim-cool",     event = "VeryLazy" },
	{
		"ggandor/leap.nvim",
		keys = { "s", "S" },
		config = function()
			require("leap").set_default_keymaps()
		end,
	},
	{
		"numToStr/Comment.nvim",
		event = "BufReadPost",
		config = function()
			require("Comment").setup()
		end
	},
	{
		"folke/todo-comments.nvim",
		event = "VeryLazy",
		config = function()
			require("todo-comments").setup({})
		end,
	},
}
