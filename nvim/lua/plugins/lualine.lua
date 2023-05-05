return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"arkav/lualine-lsp-progress",
		},
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					globalstatus = true,
					disabled_filetypes = { statusline = { "dashboard", "alpha" } },
					section_separators = { left = " ", right = " " },
					component_separators = { left = "|", right = "|" },
				},
				sections = {
					lualine_a = { "mode" },
					lualine_b = { "branch" },
					lualine_c = {
						{
							"filename",
							file_status = true, -- displays file status (readonly status, modified status)
							path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
						},
						"lsp_progress",
					},
					lualine_x = {
						{
							"diagnostics",
							sources = { "nvim_diagnostic" },
							symbols = { error = " ", warn = " ", info = " ", hint = " " },
						},
						{
							require("lazy.status").updates,
							cond = require("lazy.status").has_updates,
							-- color = { fg = "ff9e64" },
						},
						-- "encoding",
						"filetype",
					},
					lualine_y = {
						{
							"progress",
							separator = " ",
							padding = { left = 1, right = 0 },
						},
						{
							"location",
							padding = { left = 0, right = 1 },
						},
					},
					lualine_z = {
						function()
							return " " .. os.date("%R")
						end,
					},
				},
				extensions = { "fugitive", "neo-tree", "lazy" },
			})
		end,
	},
}
