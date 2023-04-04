return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		keys = {
			{ "<leader>e", "<cmd>Neotree toggle<cr>",            desc = "NeoTree" },
			{ "<leader>o", "<cmd>Neotree filesystem reveal<cr>", desc = "NeoTree" },
		},
		config = function()
			vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

			vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "", texthl = "DiagnosticSignHint" })

			require("neo-tree").setup({
				close_if_last_window = false,
				popup_border_style = "rounded",
				enable_git_status = true,
				enable_diagnostics = true,
				open_files_do_not_replace_types = {
					"terminal", "trouble", "qf",
					"toggleterm", "NeogitStatus", "NeogitPopup"
				},
				filesystem = {
					follow_current_file = false,
				}
			})
		end
	},
}
