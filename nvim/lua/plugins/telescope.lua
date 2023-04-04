return {
	{ "nvim-lua/plenary.nvim", lazy = true },
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
		},
		config = function()
			local utils = require("utils")
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local builtin = require("telescope.builtin")

			local history_file_name = "telescope_history.sqlite3"
			local history_path = utils.is_windows()
				and os.getenv("localappdata") .. "\\share\\nvim\\databases\\" .. history_file_name
				or "~/.local/share/nvim/databases/" .. history_file_name

			telescope.setup({
				defaults = {
					path_display = { "smart" },
					mappings = {
						n = {
							["q"] = actions.close,
						},
					},
					history = {
						path = history_path,
						limit = 100,
					},
					-- preview = {
					-- 	filesize_hook = function(filepath, bufnr, opts)
					-- 		local max_bytes = 10000
					-- 		local cmd = { "head", "-c", max_bytes, filepath }
					-- 		require("telescope.previewers.utils").job_maker(cmd, bufnr, opts)
					-- 	end,
					-- },
					-- vimgrep_arguments = {
					-- 	"rg",
					-- 	"-L",
					-- 	"--color=never",
					-- 	"--no-heading",
					-- 	"--with-filename",
					-- 	"--line-number",
					-- 	"--column",
					-- 	"--smart-case",
					-- },
					prompt_prefix = "   ",
					selection_caret = "󰅂 ",
					entry_prefix = "  ",
					initial_mode = "insert",
					selection_strategy = "reset",
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
							results_width = 0.8,
						},
						vertical = {
							mirror = false,
						},
						width = 0.87,
						height = 0.80,
						preview_cutoff = 120,
					},
					file_ignore_patterns = { "node_modules" },
					winblend = 0,
					border = {},
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					color_devicons = true,
					set_env = { ["COLORTERM"] = "truecolor" },
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
					buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
				},
			})

			-- Extensions
			telescope.load_extension("fzy_native")
			telescope.load_extension("smart_history")
			telescope.load_extension("ui-select")
			telescope.load_extension("project")

			-- Mappings

			vim.keymap.set("n", ";f", function()
				builtin.find_files({
					no_ignore = false,
					hidden = true,
				})
			end)

			vim.keymap.set("n", ";g", function()
				builtin.git_files({
					no_ignore = false,
					hidden = true,
				})
			end)

			vim.keymap.set({ "n", "v" }, ";r", function()
				local function get_visual_selection()
					vim.cmd('noau normal! "vy"')
					local text = vim.fn.getreg("v")
					vim.fn.setreg("v", {})

					text = string.gsub(text, "\n", "")
					if #text > 0 then
						return text
					else
						return ""
					end
				end

				local selected_text = get_visual_selection()
				builtin.live_grep({
					default_text = selected_text,
				})
			end)

			vim.keymap.set("n", ";w", function()
				builtin.grep_string({})
			end)

			vim.keymap.set("n", ";c", function()
				builtin.commands({})
			end)

			vim.keymap.set("n", ";t", function()
				builtin.colorscheme({})
			end)

			vim.keymap.set("n", ";;", function()
				builtin.resume({})
			end)

			vim.keymap.set("n", ";p", function()
				telescope.extensions.project.project({ display_type = "full" })
			end)

			vim.keymap.set("n", ";e", function()
				builtin.diagnostics({})
			end)
		end
	},
}
