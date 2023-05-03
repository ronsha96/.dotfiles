return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle pin" },
		{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
	},
	config = function()
		require("bufferline").setup({
			options = {
				close_command = function(n)
					require("mini.bufremove").delete(n, false)
				end,
				right_mouse_command = function(n)
					require("mini.bufremove").delete(n, false)
				end,
				diagnostics = "nvim_lsp",
				always_show_bufferline = false,
				offsets = {
					{
						filetype = "neo-tree",
						text = "Neo-tree",
						highlight = "Directory",
						text_align = "left",
					},
				},
			},
		})

		for i = 1, 9, 1 do
			vim.keymap.set(
				"n",
				"<leader>b" .. i,
				"<cmd>BufferLineGoToBuffer " .. i .. "<cr>",
				{ desc = "Buffer: Go to 1" }
			)
		end

		vim.keymap.set("n", "<leader>b,", "<cmd>BufferLineCyclePrev<cr>", { desc = "Buffer: Cycle prev" })
		vim.keymap.set("n", "<leader>b.", "<cmd>BufferLineCycleNext<cr>", { desc = "Buffer: Cycle next" })

		vim.keymap.set("n", "<leader>b<", "<cmd>BufferLineMovePrev<cr>", { desc = "Buffer: Move prev" })
		vim.keymap.set("n", "<leader>b>", "<cmd>BufferLineMoveNext<cr>", { desc = "Buffer: Move next" })

		vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "Buffer: Toggle pin" })

		vim.keymap.set("n", "<leader>p", "<cmd>BufferLinePick<cr>", { desc = "Buffer: Pick" })
	end,
}
