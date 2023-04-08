return {
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		keys = {
			{ "<C-\\>", "<cmd>ToggleTerm size=80 direction=vertical<cr>",   mode = { "n", "t" } },
			{ "<A-\\>", "<cmd>ToggleTerm size=20 direction=horizontal<cr>", mode = { "n", "t" } },
		},
		config = function()
			require("toggleterm").setup()

			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-h>", [[<cmd>wincmd h<cr>]], opts)
				vim.keymap.set("t", "<C-j>", [[<cmd>wincmd j<cr>]], opts)
				vim.keymap.set("t", "<C-k>", [[<cmd>wincmd k<cr>]], opts)
				vim.keymap.set("t", "<C-l>", [[<cmd>wincmd l<cr>]], opts)
			end

			-- if you only want these mappings for toggle term use term://*toggleterm#* instead
			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		end,
	},
}
