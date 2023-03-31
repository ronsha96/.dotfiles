local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")

lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"rust_analyzer",
})

lspconfig.lua_ls.setup(lsp.nvim_lua_ls())

lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "gR", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "ga", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
	vim.keymap.set({ "n", "x" }, "<leader>f", function()
		vim.lsp.buf.format({ async = false, timeout_ms = 10000 })
	end, opts)
	lsp.buffer_autoformat()
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
	signs = true,
	update_in_insert = false,
	underline = false,
})

-- TODO: remove?
-- local lsp = require("lspconfig")

-- local on_attach = function(_, bufnr)
-- 	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
--
-- 	local bufopts = { buffer = bufnr, remap = false, silent = true }
--
-- 	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
-- 	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
-- 	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
-- 	vim.keymap.set("n", "go", vim.lsp.buf.type_definition, bufopts)
-- 	vim.keymap.set("n", "gr", vim.lsp.buf.rename, bufopts)
-- 	vim.keymap.set("n", "gR", vim.lsp.buf.references, bufopts)
-- 	vim.keymap.set("n", "ga", vim.lsp.buf.code_action, bufopts)
-- 	vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufopts)
-- 	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
-- 	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
-- 	vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, bufopts)
-- 	vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, bufopts)
--
-- 	-- require("lspsaga").setup({
-- 	-- 	server_filetype_map = {
-- 	-- 		javascript = "javascript",
-- 	-- 		typescript = "typescript",
-- 	-- 		rust = "rust",
-- 	-- 		dart = "dart",
-- 	-- 	},
-- 	-- 	ui = {
-- 	-- 		theme = "round",
-- 	-- 		title = true,
-- 	-- 		border = "rounded",
-- 	-- 		colors = {
-- 	-- 			normal_bg = "NONE",
-- 	-- 		},
-- 	-- 	},
-- 	-- })
--
-- 	-- vim.keymap.set("n", "[d", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", bufopts)
-- 	-- vim.keymap.set("n", "]d", "<Cmd>Lspsaga diagnostic_jump_next<CR>", bufopts)
-- 	-- vim.keymap.set("n", "K", "<Cmd>Lspsaga hover_doc<CR>", bufopts)
-- 	-- vim.keymap.set("n", "gd", "<Cmd>Lspsaga lsp_finder<CR>", bufopts)
-- 	-- vim.keymap.set("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", bufopts)
-- 	-- vim.keymap.set("n", "gs", "<Cmd>Lspsaga goto_definition<CR>", bufopts)
-- 	-- vim.keymap.set("n", "gp", "<Cmd>Lspsaga peek_definition<CR>", bufopts)
-- 	-- vim.keymap.set("n", "gr", "<Cmd>Lspsaga rename<CR>", bufopts)
-- 	-- vim.keymap.set("n", "ga", "<Cmd>Lspsaga code_action<CR>", bufopts)
-- end

-- Underline errors
-- vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
-- 	virtual_text = true,
-- 	signs = true,
-- 	update_in_insert = false,
-- 	underline = true,
-- })

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
--
-- local function organize_imports()
-- 	local params = {
-- 		command = "_typescript.organizeImports",
-- 		arguments = { vim.api.nvim_buf_get_name(0) },
-- 		title = "",
-- 	}
-- 	vim.lsp.buf.execute_command(params)
-- end
--
-- -- TypeScript
-- lsp.tsserver.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	init_options = {
-- 		preferences = {
-- 			importModuleSpecifierPreference = "relative",
-- 		},
-- 	},
-- 	commands = {
-- 		OrganizeImports = {
-- 			organize_imports,
-- 			description = "Organize Imports",
-- 		},
-- 	},
-- })
--
-- -- Dart/Flutter
-- require("flutter-tools").setup({
-- 	lsp = {
-- 		on_attach = on_attach,
-- 		capabilities = capabilities,
-- 	},
-- })
--
-- -- CSS
-- lsp.cssls.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	cmd = { "vscode-css-language-server", "--stdio" },
-- })
--
-- -- Lua
-- lsp.lua_ls.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })
--
-- -- Python
-- lsp.pyright.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })
--
-- -- Rust
--
-- local extension_path = vim.env.HOME .. "/codelldb"
-- local codelldb_path = extension_path .. "/adapters/codelldb"
-- local liblldb_path = extension_path .. "/lldb/lib/liblldb.so" -- MacOS: This may be dylib

-- require("rust_tools").setup({
-- 	tools = {
-- 		-- runnables = {
-- 		-- 	use_telescope = true,
-- 		-- },
-- 		autoSetHints = true,
-- 		inlay_hints = {
-- 			auto = true,
-- 			show_parameter_hints = true,
-- 			parameter_hints_prefix = "",
-- 			other_hints_prefix = "",
-- 		},
-- 	},
-- 	server = {
-- 		on_attach = on_attach,
-- 		settings = {
-- 			["rust-analyzer"] = {
-- 				imports = {
-- 					granularity = {
-- 						group = "module",
-- 					},
-- 					prefix = "self",
-- 				},
-- 				assist = {
-- 					importEnforceGranularity = true,
-- 					importPrefix = "crate",
-- 				},
-- 				cargo = {
-- 					allFeatures = true,
-- 					buildScripts = {
-- 						enable = true,
-- 					},
-- 				},
-- 				checkOnSave = {
-- 					command = "clippy",
-- 				},
-- 				procMacro = {
-- 					enable = true,
-- 				},
-- 			},
-- 		},
-- 	},
-- 	dap = {
-- 		adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
-- 	},
-- })

-- lsp.yamlls.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	settings = {
-- 		yaml = {
-- 			schemas = {
-- 				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
-- 				["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "compose.yaml",
-- 			},
-- 		},
-- 	},
-- })
--
-- lsp.docker_compose_language_service.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- })


local luasnip = require("luasnip")

require("luasnip.loaders.from_vscode").lazy_load()
luasnip.filetype_extend("all", { "_" })

-- cmp

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }

local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local next_item = cmp.mapping(function(fallback)
	if cmp.visible() then
		cmp.select_next_item(cmp_select)
	elseif luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	elseif has_words_before() then
		cmp.complete()
	else
		fallback()
	end
end, { "i", "s" })

local previous_item = cmp.mapping(function(fallback)
	if cmp.visible() then
		cmp.select_prev_item(cmp_select)
	elseif luasnip.jumpable(-1) then
		luasnip.jump(-1)
	else
		fallback()
	end
end, { "i", "s" })

local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-,>"] = cmp.mapping.complete(),
	["<C-Space>"] = cmp.mapping.complete(),
	["<C-e>"] = cmp.mapping.close(),
	["<CR>"] = cmp.mapping.confirm({
		select = true,
		-- behavior = cmp.ConfirmBehavior.Replace,
	}),
	["<Down>"] = next_item,
	["<Up>"] = previous_item,
	["<Tab>"] = next_item,
	["<S-Tab>"] = previous_item,
})

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-,>"] = cmp.mapping.complete(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			select = true,
			-- behavior = cmp.ConfirmBehavior.Replace,
		}),
		["<Down>"] = next_item,
		["<Up>"] = previous_item,
		["<Tab>"] = next_item,
		["<S-Tab>"] = previous_item,
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "path" },
		{ name = "git" },
		{ name = "buffer",  keyword_length = 3 },
		{ name = "luasnip", keyword_length = 2 },
	}),
	formatting = {
		format = require("lspkind").cmp_format({
			mode = "symbol_text",
			preset = "default",
		}),
	},
	window = {
		documentation = cmp.config.window.bordered(),
	},
})

require("cmp_git").setup()

-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
	sources = cmp.config.sources({
		{ name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = "buffer" },
	}),
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ "/", "?" }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = "buffer" },
	},
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{ name = "cmdline" },
	}),
})

vim.cmd([[highlight! default link CmpItemKind CmpItemMenuDefault]])

-- Extras
require("fidget").setup()
