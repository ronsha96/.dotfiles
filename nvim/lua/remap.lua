local opts = { remap = false }

-- Leader
vim.g.mapleader = " "

vim.keymap.set("n", "<Space>", "<Nop>", opts)

-- Unmap arrow keys
vim.keymap.set("n", "<Up>", "<Nop>", opts)
vim.keymap.set("n", "<Down>", "<Nop>", opts)
vim.keymap.set("n", "<Left>", "<Nop>", opts)
vim.keymap.set("n", "<Right>", "<Nop>", opts)

vim.keymap.set("i", "<Up>", "<Nop>", opts)
vim.keymap.set("i", "<Down>", "<Nop>", opts)
vim.keymap.set("i", "<Left>", "<Nop>", opts)
vim.keymap.set("i", "<Right>", "<Nop>", opts)

vim.keymap.set("v", "<Up>", "<Nop>", opts)
vim.keymap.set("v", "<Down>", "<Nop>", opts)
vim.keymap.set("v", "<Left>", "<Nop>", opts)
vim.keymap.set("v", "<Right>", "<Nop>", opts)

-- Unmap visual block
vim.keymap.set("n", "<c-v>", "<Nop>", opts)

-- Yank all
vim.keymap.set("n", "<leader>y", 'ggVG"+y', opts)

-- Window mappings when tmux is not available
if vim.fn.executable("tmux") ~= 1 then
	vim.keymap.set("n", "<c-h>", "<c-w>h", opts)
	vim.keymap.set("n", "<c-j>", "<c-w>j", opts)
	vim.keymap.set("n", "<c-k>", "<c-w>k", opts)
	vim.keymap.set("n", "<c-l>", "<c-w>l", opts)
end

-- Cancel highlight
vim.keymap.set("n", "/\\", ":noh<cr>", opts)

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

vim.keymap.set("n", "<C-D>", "<C-D>zz", opts)
vim.keymap.set("n", "<C-U>", "<C-U>zz", opts)

vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
