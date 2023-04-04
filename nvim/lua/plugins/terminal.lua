return {
	{
		"akinsho/toggleterm.nvim",
		event = "VeryLazy",
		keys = {
			{ "<C-\\>", "<Cmd>ToggleTerm size=80 direction=vertical<CR>",   mode = { "n", "t" } },
			{ "<A-\\>", "<Cmd>ToggleTerm size=20 direction=horizontal<CR>", mode = { "n", "t" } },
		},
		config = function()
			require("toggleterm").setup()

			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			end

			-- if you only want these mappings for toggle term use term://*toggleterm#* instead
			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
		end
	},
}
