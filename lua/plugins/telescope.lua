-- https://github.com/nvim-telescope/telescope.nvim
return {
    "nvim-telescope/telescope.nvim",
    keys = {
        -- disable the keymap to grep files
        -- { "<leader>/",  false },
        -- change a keymap
        -- { "<leader>ff", LazyVim.telescope("files"), desc = "Find Files (Root Dir)" },
        -- { "<leader><space>", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 50 }))<cr>", desc = "Find Files" },
        -- add a keymap to browse plugin files
        -- {
        --     "<leader>fp",
        --     function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
        --     desc = "Find Plugin File",
        -- },
    },
    opts = {
        defaults = {
            layout_config = {
                horizontal = {
                    winblend = 50,
                },
            },
            file_ignore_patterns = { ".git/", "%.min.ts", "%.min.js", "*.min.js", "%.min.css", "*.min.css",
                "node_modules", "*/dist/*", "dist", "*/dist", ".idea/", ".DS_Store", "*/.DS_Store", ".cache",
                "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip", "%.yaml", "%.*lock*" },

        },
        pickers = {
            find_files = {
                -- theme = "ivy",
                winblend = 50,
            }
        },
    }
}
