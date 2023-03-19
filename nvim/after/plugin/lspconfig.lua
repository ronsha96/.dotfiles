-- neodev must be set up before lspconfig
-- require("neodev").setup({
-- 	library = {
-- 		types = true,
-- 		plugins = { "nvim-dap-ui" },
-- 	},
-- })

local lsp = require("lspconfig")
local rust_tools = require("rust-tools")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(_, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- vim.keymap.set("n", "gs", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<leader>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "gR", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<leader>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)

	require("lspsaga").setup({
		server_filetype_map = {
			javascript = "javascript",
			typescript = "typescript",
			rust = "rust",
			dart = "dart",
		},
		ui = {
			theme = "round",
			title = true,
			border = "rounded",
			colors = {
				normal_bg = "NONE",
			},
		},
	})

	vim.keymap.set("n", "[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
	vim.keymap.set("n", "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
	vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", bufopts)
	vim.keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", bufopts)
	vim.keymap.set("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", bufopts)
	vim.keymap.set("n", "gs", "<Cmd>Lspsaga goto_definition<CR>", bufopts)
	vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", bufopts)
	vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", bufopts)
	vim.keymap.set("n", "ga", "<Cmd>Lspsaga code_action<CR>", bufopts)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = true,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end

-- TypeScript
lsp.tsserver.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	init_options = {
		preferences = {
			importModuleSpecifierPreference = "relative",
		},
	},
	commands = {
		OrganizeImports = {
			organize_imports,
			description = "Organize Imports",
		},
	},
})

-- Dart/Flutter
require("flutter-tools").setup({
	lsp = {
		on_attach = on_attach,
		capabilities = capabilities,
	},
})
-- lsp.dartls.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })

-- CSS
lsp.cssls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { "vscode-css-language-server", "--stdio" },
})

-- Lua
lsp.lua_ls.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Python
lsp.pyright.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- Rust

local extension_path = vim.env.HOME .. "/codelldb"
local codelldb_path = extension_path .. "/adapters/codelldb"
local liblldb_path = extension_path .. "/lldb/lib/liblldb.so" -- MacOS: This may be dylib

rust_tools.setup({
	tools = {
		runnables = {
			use_telescope = true,
		},
		inlay_hints = {
			auto = true,
			show_parameter_hints = false,
			parameter_hints_prefix = "",
			other_hints_prefix = "",
		},
	},
	-- all the opts to send to nvim-lspconfig
	-- these override the defaults set by rust-tools.nvim
	-- see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md#rust_analyzer
	server = {
		-- on_attach is a callback called when the language server attachs to the buffer
		on_attach = function(client, bufnr)
			on_attach(client, bufnr)
		end,
		settings = {
			-- to enable rust-analyzer settings visit:
			-- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
			["rust-analyzer"] = {
				-- enable clippy on save
				checkOnSave = {
					command = "clippy",
				},
			},
		},
	},
	dap = {
		adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
	},
})

-- require("lsp-colors").setup({
-- 	Error = "#db4b4b",
-- 	Warning = "#e0af68",
-- 	Information = "#0db9d7",
-- 	Hint = "#10B981",
-- })

-- Show diagnostic popup on cursor hover
-- local diag_float_grp = vim.api.nvim_create_augroup("DiagnosticFloat", { clear = true })
-- vim.api.nvim_create_autocmd("CursorHold", {
-- 	callback = function()
-- 		vim.diagnostic.open_float(nil, { focusable = false })
-- 	end,
-- 	group = diag_float_grp,
-- })

require("fidget").setup()
