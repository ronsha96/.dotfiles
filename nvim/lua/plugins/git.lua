return {
	{
		"dinhhuy258/git.nvim",
		event = "BufRead",
		config = function()
			require("git").setup({
				keymaps = {
					default_mappings = false,
					keymaps = {
						-- Open blame window
						blame = "<leader>gb",
						-- Close blame window
						quit_blame = "q",
						-- Open blame commit
						blame_commit = "<cr>",
						-- Open file/folder in git repository
						browse = "<leader>go",
						-- Open pull request of the current branch
						open_pull_request = "<leader>gp",
						-- Create a pull request with the target branch is set in the `target_branch` option
						create_pull_request = "<leader>gn",
						-- Opens a new diff that compares against the current index
						-- diff = "<leader>gd",
						-- Close git diff
						-- diff_close = "<leader>gD",
						-- Revert to the specific commit
						revert = "<leader>gr",
						-- Revert the current file to the specific commit
						revert_file = "<leader>gR",
					},
					-- Default target branch when create a pull request
					target_branch = "master",
				},
			})
		end
	},
	{
		"lewis6991/gitsigns.nvim",
		event = "BufRead",
		config = function()
			local gitsigns = require("gitsigns")

			gitsigns.setup({
				current_line_blame = true,
			})

			vim.keymap.set("n", "<leader>gB", function()
				gitsigns.blame_line({ full = true })
			end, { remap = false, silent = false })
		end
	},
	{
		"akinsho/git-conflict.nvim",
		event = "BufRead",
		config = function()
			require("git-conflict").setup()
			vim.keymap.set("n", "<leader>gl", ":GitConflictListQf")
		end
	},
	{
		"TimUntersberger/neogit",
		keys = {
			{ "<leader>gs", "<cmd>Neogit kind=split<cr>" }
		},
		config = function()
			require("neogit").setup({
				kind = "tab",
				integrations = { diffview = true },
				disable_insert_on_commit = false,
				disable_commit_confirmation = true,
				disable_builtin_notifications = true,
			})
		end,
		dependencies = {
			{
				"sindrets/diffview.nvim",
				keys = {
					{ "<leader>gd", "<cmd>DiffviewOpen<cr>" },
					{ "<leader>gD", "<cmd>DiffviewClose<cr>" },
				},
			},
		}
	},
}
