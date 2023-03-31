local nvim_tree = require("nvim-tree")
local api = require("nvim-tree.api")

nvim_tree.setup({
	renderer = {
		full_name = true,
	},
})

local opts = { noremap = true, silent = false }

vim.keymap.set("n", "<leader>e", function()
	api.tree.toggle()
end, opts)

vim.keymap.set("n", "<leader>o", function()
	api.tree.open({
		find_file = true,
	})
end, opts)
