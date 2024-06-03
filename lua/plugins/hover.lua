-- https://github.com/lewis6991/hover.nvim
return {
    "lewis6991/hover.nvim",
    event = "BufRead",
    config = function()
        require("hover").setup {
            init = function()
                -- Require providers
                require("hover.providers.lsp")
                -- require('hover.providers.gh')
                -- require('hover.providers.gh_user')
                -- require('hover.providers.man')
                -- require('hover.providers.dictionary')
            end,
            preview_opts = {
                border = 'rounded',
            },
            -- Whether the contents of a currently open hover window should be moved
            -- to a :h preview-window when pressing the hover keymap.
            preview_window = false,
            title = false,
            mouse_delay = 1000
        }

        -- Setup keymaps
        vim.keymap.set("n", "K", require("hover").hover, { noremap = true, silent = true },{ desc = "hover.nvim" })
        vim.keymap.set("n", "gK", require("hover").hover_select, { noremap = true, silent = true },
            { desc = "hover.nvim (select)" })
        -- vim.keymap.set("n", "<C-p>", function() require("hover").hover_switch("previous") end,
        --     { desc = "hover.nvim (previous source)" })
        -- vim.keymap.set("n", "<C-n>", function() require("hover").hover_switch("next") end,
        --     { desc = "hover.nvim (next source)" })
    end
}
