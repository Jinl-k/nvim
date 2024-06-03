return {
    "neovim/nvim-lspconfig",
    opts = {
        -- make sure mason installs the server
        servers = {
            vtsls = {
                settings = {
                    typescript = {
                        inlayHints = {
                            enumMemberValues = { enabled = false },
                            functionLikeReturnTypes = { enabled = false },
                            parameterNames = { enabled = "literals" },
                            parameterTypes = { enabled = false },
                            propertyDeclarationTypes = { enabled = false },
                            variableTypes = { enabled = false },
                        },
                        -- implementationsCodeLens = {
                        --     enabled = true
                        -- },
                        -- referencesCodeLens = {
                        --     enabled = true
                        -- }
                    },
                },
                keys = {
                    {
                        "gD",
                        function()
                            require("vtsls").commands.goto_source_definition(0)
                        end,
                        desc = "Goto Source Definition",
                    },
                    {
                        "gR",
                        function()
                            require("vtsls").commands.file_references(0)
                        end,
                        desc = "File References",
                    },
                    {
                        "<leader>co",
                        function()
                            require("vtsls").commands.organize_imports(0)
                        end,
                        desc = "Organize Imports",
                    },
                    {
                        "<leader>cM",
                        function()
                            require("vtsls").commands.add_missing_imports(0)
                        end,
                        desc = "Add missing imports",
                    },
                    {
                        "<leader>cD",
                        function()
                            require("vtsls").commands.fix_all(0)
                        end,
                        desc = "Fix all diagnostics",
                    },
                    {
                        "<leader>cV",
                        function()
                            require("vtsls").commands.select_ts_version(0)
                        end,
                        desc = "Select TS workspace version",
                    },
                },
            }
        },
    },
}
