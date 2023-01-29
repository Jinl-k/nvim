-- https://github.com/ray-x/lsp_signature.nvim
local M = {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "williamboman/mason-lspconfig.nvim",
				'ray-x/lsp_signature.nvim',
    },
		-- keys ={
		-- 		{ "<leader>gd","<cmd>Telescope lsp_definitions<cr>"},
		-- 		{ "<leader>gD","<cmd>lua vim.lsp.buf.declaration()<cr>" },
		-- },
    config = function(_, opts)
        local utils = require("utils")
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = require("lspconfig")
        local lsp_utils = require("plugins.lsp.lsp-utils")
				local util = require("lspconfig.util")
        lsp_utils.setup()
        mason_lspconfig.setup({
            ensure_installed = utils.lsp_servers,
        })
        mason_lspconfig.setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    on_attach = lsp_utils.on_attach,
                    capabilities = lsp_utils.capabilities,
                })
            end,
            ["sumneko_lua"] = function ()
                lspconfig.sumneko_lua.setup({
                    on_attach = lsp_utils.on_attach,
                    capabilities = lsp_utils.capabilities,
                    filetypes = { "lua" },
										single_file_support = true,
                    cmd = { "lua-language-server" },
										root_dir = util.root_pattern(".luarc.json", ".luarc.jsonc", ".luacheckrc", ".stylua.toml", "stylua.toml", "selene.toml", "selene.yml", ".git"),
                    settings = {
                      Lua = {
                        diagnostics = { globals = { "vim" } },
                        workspace = {
                          library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                          },
                          maxPreload = 100000,
                          preloadFileSize = 10000,
                        },
                        telemetry = { enable = false },
                        -- Do not override treesitter lua highlighting with sumneko lua highlighting
                        semantic = { enable = false },
                      },
                    },
                })
            end,
            ["html"] = function()
                lspconfig.html.setup({
									cmd = { "vscode-html-language-server", "--stdio" },
									filetypes = { "html" },
									root_dir = util.root_pattern("package.json", ".git"),
									init_options = {
										configurationSection = { "html", "css", "javascript" },
										embeddedLanguages = {
											css = true,
											javascript = true
										},
										provideFormatter = true
									},
									settings = {},
									single_file_support = true,
									capabilities = lsp_utils.capabilities,
									on_attach = lsp_utils.on_attach,
								})
            end,
						["cssls"] = function()
                lspconfig.cssls.setup({
									cmd = { "vscode-css-language-server", "--stdio" },
									filetypes ={ "css", "scss", "less" },
									root_dir = util.root_pattern("package.json", ".git"),
									settings = {
										css = {
											validate = true,
											lint = {
																unknownAtRules = "ignore"
														}
										},
										less = {
											validate = true,
											lint = {
																unknownAtRules = "ignore"
														}
										},
										scss = {
											validate = true,
											lint = {
																unknownAtRules = "ignore"
														}
										}
									},
									capabilities = lsp_utils.capabilities,
									on_attach = lsp_utils.on_attach,
								})
            end,
						["emmet_ls"] = function()
                lspconfig.emmet_ls.setup({
									cmd = { "emmet-ls", "--stdio" },
									filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "eruby" },
									root_dir = util.root_pattern("package.json", ".git"),
									single_file_support = true,
									capabilities = lsp_utils.capabilities,
									on_attach = lsp_utils.on_attach,
								})
            end,
						["tsserver"] = function()
                lspconfig.tsserver.setup({
									cmd = { "typescript-language-server", "--stdio" },
									filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
									init_options = { 
										hostInfo = "neovim",
										maxTsServerMemory = 12288,
            				preferences = {
                				importModuleSpecifierPreference = "relative",
            				}, 
									},
									root_dir = util.root_pattern("tsconfig.json",".git"),
									single_file_support = true,
									capabilities = lsp_utils.capabilities,
									on_attach = lsp_utils.on_attach,
								})
            end,
						["volar"] = function()
									local function get_typescript_server_path(root_dir)
									local global_ts = '/opt/homebrew/lib/node_modules/typescript/lib'
									-- Alternative location if installed as root:
									-- local global_ts = '/usr/local/lib/node_modules/typescript/lib'
									local found_ts = ''
									local function check_dir(path)
										found_ts =  util.path.join(path, 'node_modules', 'typescript', 'lib')
										if util.path.exists(found_ts) then
											return path
										end
									end
										if util.search_ancestors(root_dir, check_dir) then
											return found_ts
										else
											return global_ts
										end
									end


                lspconfig.volar.setup({
									cmd = { "vue-language-server", "--stdio" },
									on_new_config = function(new_config, new_root_dir)
										new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
									end,
									filetypes = {'vue'},
									-- filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
									init_options = {
										typescript = {
											-- tsdk = '/Users/kevin/Library/pnpm/global/5/.pnpm/typescript@4.9.4/node_modules/typescript/lib'
											tsdk = '/opt/homebrew/lib/node_modules/typescript/lib'
										}
									},
									root_dir = util.root_pattern("package.json", "tsconfig.json", "jsconfig.json", ".git", "vite.config.ts", "vite.config.js"),
									-- root_dir = util.root_pattern(".git", "vite.config.ts", "vite.config.js"),
									single_file_support = true,
									capabilities = lsp_utils.capabilities,
									on_attach = lsp_utils.on_attach,
								})
            end,
						["jsonls"] = function()
								lspconfig.jsonls.setup({
								flags = { debounce_text_changes = 500 },
								capabilities = lsp_utils.capabilities,
								on_attach = lsp_utils.on_attach,
								settings = {
									json = {
									-- Schemas https://www.schemastore.org
										schemas = {
												{
													fileMatch = { "package.json" },
													url = "https://json.schemastore.org/package.json",
												},
												{
													fileMatch = { "tsconfig*.json" },
													url = "https://json.schemastore.org/tsconfig.json",
												},
												{
													fileMatch = {
														".prettierrc",
														".prettierrc.json",
														"prettier.config.json",
													},
													url = "https://json.schemastore.org/prettierrc.json",
												},
												{
													fileMatch = { ".eslintrc", ".eslintrc.json" },
													url = "https://json.schemastore.org/eslintrc.json",
												},
												{
													fileMatch = {
														".babelrc",
														".babelrc.json",
														"babel.config.json",
													},
													url = "https://json.schemastore.org/babelrc.json",
												},
												{
													fileMatch = { "lerna.json" },
													url = "https://json.schemastore.org/lerna.json",
												},
												{
													fileMatch = {
														".stylelintrc",
														".stylelintrc.json",
														"stylelint.config.json",
													},
													url = "http://json.schemastore.org/stylelintrc.json",
												},
												{
													fileMatch = { "/.github/workflows/*" },
													url = "https://json.schemastore.org/github-workflow.json",
												},
										},
									},
								},
							})
						end,
            ["clangd"] = function()
                local capabilities_cpp = lsp_utils.capabilities
                capabilities_cpp.offsetEncoding = { "uts-16" }
                lspconfig.clangd.setup({
                    on_attach = lsp_utils.on_attach,
                    capabilities = capabilities_cpp,
                })
            end,
        })
    end,
}

return M
