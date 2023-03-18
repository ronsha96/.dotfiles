require("nvim-tree").setup({
	renderer = {
		full_name = true,
	},
})

local opts = { noremap = true, silent = true }

vim.keymap.set("n", "<leader>e", "<CMD>NvimTreeToggle<CR>", opts)
vim.keymap.set("n", "<leader>o", "<CMD>NvimTreeFindFile<CR>", opts)
