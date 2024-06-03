return {
    "neovim/nvim-lspconfig",
    init = function()
        local keys = require("lazyvim.plugins.lsp.keymaps").get()
        -- change a keymap
        -- keys[#keys + 1] = { "K", "<cmd>echo 'hello'<cr>" }
        -- disable a keymap
        keys[#keys + 1] = { "K", false }
        -- add a keymap
        -- keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
    end,
    ---@class PluginLspOpts
    opts = {
        inlay_hints = {
            enabled = false,
        },
        diagnostics = {
            underline = true,
            update_in_insert = false,
            virtual_text = {
                spacing = 1,
                source = "if_many",
                prefix = "",
                -- this will set set the prefix to a function that returns the diagnostics icon based on the severity
                -- this only works on a recent 0.10.0 build. Will be set to "●" when not supported
                -- prefix = "icons",
            },
            severity_sort = true,
            -- signs = {
            --     text = {
            --         [vim.diagnostic.severity.ERROR] = "",
            --         [vim.diagnostic.severity.WARN] = "",
            --         [vim.diagnostic.severity.HINT] = "",
            --         [vim.diagnostic.severity.INFO] = "",
            --     },
            -- },
            signs = false,
        },
        ---@type lspconfig.options
        -- codelens = {
        --     enabled = true,
        -- },
        -- servers = {
        --     emmet_language_server={},
        --     cssls = {
        --         settings = {
        --             css = {
        --                 validate = true,
        --                 lint = {
        --                     unknownAtRules = "ignore"
        --                 }
        --             },
        --             less = {
        --                 validate = true,
        --                 lint = {
        --                     unknownAtRules = "ignore"
        --                 }
        --             },
        --             scss = {
        --                 validate = true,
        --                 lint = {
        --                     unknownAtRules = "ignore"
        --                 }
        --             }
        --         },
        --         init_options = {
        --             provideFormatter = false
        --         },
        --         single_file_support = true,
        --     },
        --     html = {
        --         init_options = {
        --             provideFormatter = false
        --         },
        --         single_file_support = true,
        --     },
        --     -- biome = {
        --     --     single_file_support = true,
        --     -- },
        --     -- stylelint_lsp = {}
        -- }
    },
}
