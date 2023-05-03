local opts = { remap = false, silent = true }

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

-- Window mappings
vim.keymap.set("n", "<c-h>", "<c-w>h", opts)
vim.keymap.set("n", "<c-j>", "<c-w>j", opts)
vim.keymap.set("n", "<c-k>", "<c-w>k", opts)
vim.keymap.set("n", "<c-l>", "<c-w>l", opts)

-- Cancel highlight
vim.keymap.set("n", "/\\", ":noh<cr>", opts)

-- Move to previous/next
vim.keymap.set("n", "<leader>t,", "<cmd>BufferPrevious<cr>", opts)
vim.keymap.set("n", "<leader>t.", "<cmd>BufferNext<cr>", opts)

-- Re-order to previous/next
vim.keymap.set("n", "<leader>t<", "<cmd>BufferMovePrevious<cr>", opts)
vim.keymap.set("n", "<leader>t>", "<cmd>BufferMoveNext<cr>", opts)

-- Goto buffer in position...
vim.keymap.set("n", "<leader>t1", "<cmd>BufferGoto 1<cr>", opts)
vim.keymap.set("n", "<leader>t2", "<cmd>BufferGoto 2<cr>", opts)
vim.keymap.set("n", "<leader>t3", "<cmd>BufferGoto 3<cr>", opts)
vim.keymap.set("n", "<leader>t4", "<cmd>BufferGoto 4<cr>", opts)
vim.keymap.set("n", "<leader>t5", "<cmd>BufferGoto 5<cr>", opts)
vim.keymap.set("n", "<leader>t6", "<cmd>BufferGoto 6<cr>", opts)
vim.keymap.set("n", "<leader>t7", "<cmd>BufferGoto 7<cr>", opts)
vim.keymap.set("n", "<leader>t8", "<cmd>BufferGoto 8<cr>", opts)
vim.keymap.set("n", "<leader>t9", "<cmd>BufferGoto 9<cr>", opts)
vim.keymap.set("n", "<leader>t0", "<cmd>BufferLast<cr>", opts)

-- Buffer closing & such
vim.keymap.set("n", "<leader>tc", "<cmd>BufferClose<cr>", opts)
vim.keymap.set("n", "<leader>bx", "<cmd>BufferClose<cr>", opts)
vim.keymap.set("n", "<leader>bp", "<cmd>BufferPin<cr>", opts)
vim.keymap.set("n", "<leader>bc", "<cmd>BufferCloseAllButPinned<cr>", opts)
vim.keymap.set("n", "<leader>bv", "<cmd>BufferCloseAllButVisible<cr>", opts)

-- Magic buffer-picking mode
vim.keymap.set("n", "<C-p>", "<cmd>BufferPick<cr>", opts)

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, opts)

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-D>", "<C-D>zz", opts)
vim.keymap.set("n", "<C-U>", "<C-U>zz", opts)

vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)
