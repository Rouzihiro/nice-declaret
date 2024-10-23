-- this plugin for formatting


return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				require("none-ls.diagnostics.eslint_d"), -- ts/js
				null_ls.builtins.formatting.stylua, -- lua
				null_ls.builtins.formatting.prettier, -- *
				null_ls.builtins.formatting.black, -- py
				null_ls.builtins.formatting.isort, -- py
				null_ls.builtins.formatting.gofumpt, -- go
				null_ls.builtins.formatting.goimports_reviser, -- go
				null_ls.builtins.formatting.golines, -- go
				null_ls.builtins.formatting.alejandra, -- nix
			},
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({
						group = augroup,
						buffer = bufnr,
					})
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})

		vim.keymap.set("n", "gf", vim.lsp.buf.format, { desc = "file format" })
	end
}
