return {
	"williamboman/mason.nvim",
	-- event = "BufReadPre",
	dependencies = {
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
					"json-lsp",
					"lua-language-server",
					-- "markdownlint",
					"prettier",
					-- "stylua",
					-- "tailwindcss-language-server",
					"typescript-language-server",
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

			require("mason-null-ls").setup({
					ensure_installed = { "stylua", "prettier" },
					automatic_installation = true,
    			automatic_setup = true,
			})
	end
}
