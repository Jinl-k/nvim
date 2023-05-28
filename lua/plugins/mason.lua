return {
	"williamboman/mason.nvim",
	dependencies = {
		'jose-elias-alvarez/null-ls.nvim',
    "jay-babu/mason-null-ls.nvim",
	},
	opts = {
		pip = {
			upgrade_pip = true,
		},
		ui = {
			border = "rounded",
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	},
	config = function(_, opts)
			mason_packages = {
					"css-lsp",
					-- "eslint-lsp",
					"html-lsp",
					-- "json-lsp",
					-- "lua-language-server",
					-- "markdownlint",
					"emmet-ls",
					"prettier",
					-- "stylua",
					-- "tailwindcss-language-server",
					-- "typescript-language-server",
					"vue-language-server",
			}
			require("mason").setup(opts)
			local mr = require("mason-registry")
			local packages = mason_packages
			for _, package in ipairs(packages) do
				local p = mr.get_package(package)
				if not p:is_installed() then
					p:install()
				end
			end


			local null_ls = require("null-ls")
			-- Please set additional flags for the supported servers here
			-- Don't specify any config here if you are using the default one.
			local sources = {
				null_ls.builtins.formatting.prettier.with({
					filetypes = {
						"vue",
						"typescript",
						"javascript",
						"typescriptreact",
						"javascriptreact",
						"yaml",
						"html",
						"css",
						"scss",
						"sh",
						"markdown",
					},
				}),
			}

			null_ls.setup({
				border = "rounded",
				debug = false,
				log_level = "warn",
				update_in_insert = false,
				sources = {},
			})

			require("mason-null-ls").setup({
				ensure_installed = { "prettier" },
				automatic_installation = true,
				handlers = {},
			})
	end
}
