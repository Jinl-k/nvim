return {
    "jose-elias-alvarez/null-ls.nvim",
    event = "BufReadPre",
		-- enabled = false,
		config = function()
				local null_ls = require("null-ls")
				local formatting = null_ls.builtins.formatting
				local diagnostics = null_ls.builtins.diagnostics
				local code_actions = null_ls.builtins.code_actions
				local completion = null_ls.builtins.completion

				local lsp_formatting = function(bufnr)
					vim.lsp.buf.format({
							filter = function(client)
									-- apply whatever logic you want (in this example, we'll only use null-ls)
									return client.name == "null-ls"
							end,
							bufnr = bufnr,
						})
				end
				local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
				local on_attach = function(client, bufnr)
						if client.supports_method("textDocument/formatting") then
								vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
								vim.api.nvim_create_autocmd("BufWritePre", {
										group = augroup,
										buffer = bufnr,
										callback = function()
												lsp_formatting(bufnr)
										end,
								})
						end
				end
				require("null-ls").setup({
					debug = false,
					sources = {
							-- formatter
							formatting.stylua,
							formatting.prettier,
							-- diagnostics.eslint,	
							code_actions.gitsigns,
					},
					on_attach = on_attach
				})
		
    end,
}
