return {
    -- lua with packer.nvim
    "max397574/better-escape.nvim",
    event = "VeryLazy",
    config = function()
        require("better_escape").setup {
            mapping = { "jj" },        -- a table with mappings to use
            timeout = 200,             -- the time in which the keys must be hit in ms. Use option timeoutlen by default
            clear_empty_lines = false, -- clear line after escaping if there is only whitespace
            keys = "<Esc>",            -- keys used for escaping, if it is a function will use the result everytime
            -- example(recommended)
            -- keys = function()
            --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
            -- end,
        }
    end,
}
