return {
		"hrsh7th/vim-vsnip",
		lazy = false,
    config = function()
				function join(...)
						return table.concat(vim.tbl_flatten({ ... }), "/")
				end
          vim.g.vsnip_snippet_dir = join(vim.fn.stdpath("config"), "snippets")
					vim.g.vsnip_filetypes = {
							javascript = { "typescript" },
							typescript = { "javascript" },
							vue = { "javascript", "typescript" },
					}
    end
}