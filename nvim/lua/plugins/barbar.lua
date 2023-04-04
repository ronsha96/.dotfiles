return {
	{
		"romgrk/barbar.nvim",
		event = "VeryLazy",
		config = function()
			require("barbar").setup({
				animation = false,
			})
		end
	}
}
