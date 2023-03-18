local null_ls = require("null-ls")

null_ls.setup({
	on_attach = function(client, bufnr)
		local bufopts = { noremap = true, silent = true, buffer = bufnr }

		if client.server_capabilities.documentFormattingProvider then
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, bufopts)
		end
	end,
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.diagnostics.zsh,
		null_ls.builtins.formatting.taplo,
		null_ls.builtins.formatting.sqlfluff.with({
			filetypes = { "sql", "mysql", "plsql" },
			extra_args = { "--dialect", "mysql" },
		}),
		-- null_ls.builtins.formatting.rustfmt,
	},
})
