return {
	"williamboman/mason.nvim",
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
					-- "bash-language-server",
					-- "black",
					-- "clang-format",
					-- "clangd",
					-- "codelldb",
					"css-lsp",
					-- "eslint-lsp",
					-- "graphql-language-service-cli",
					"html-lsp",
					-- "jdtls",
					"json-lsp",
					-- "lua-language-server",
					-- "markdownlint",
					"prettier",
					-- "pyright",
					-- "shfmt",
					-- "stylua",
					-- "tailwindcss-language-server",
					-- "taplo",
					"typescript-language-server",
					"vue-language-server",
					-- "yaml-language-server",
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
		--  local installer_tools = {
    --     lsp = {
          
    --         "css-lsp",
    --         "json-lsp",
    --         "html-lsp",
    --         "emmet-ls",
    --         -- "vetur-vls",
    --         -- "vim-language-server",
    --         "lua-language-server",
		-- 				"vue-language-server",
    --         -- "bash-language-server",
    --         "typescript-language-server",
    --         -- "tailwindcss-language-server",
    --     },
    --     dap = {
    --         "js-debug-adapter@v1.74.1",
    --     },
    --     linter = {
    --         "pylint",
    --     },
    --     formatter = {
    --         -- "shfmt",
    --         -- "autopep8",
    --         "prettier",
    --         -- "sql-formatter",
    --         "stylua",
    --     },
    -- }


		-- local installed_packages = {}

    -- for _, package_kind in pairs(installer_tools) do
    --     for _, package_name_version in pairs(package_kind) do
    --         local name, version = unpack(vim.split(package_name_version, "@"))
    --         if not mr.is_installed(name) then
    --             if not mr.has_package(name) then
    --                 -- vim.notify(string.format("Invalid package name : %s", name), "ERROR", { title = "Mason" })
    --             else
    --                 local params = #version ~= 0 and { version = version } or nil
    --                 mr.get_package(name):install(params)
    --                 table.insert(installed_packages, package_name_version)
    --             end
    --         end
    --     end
    -- end

		

	end
}
