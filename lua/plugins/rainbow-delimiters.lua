return {
    "HiPhish/rainbow-delimiters.nvim",
    event = "VeryLazy",
    config = function(_)
        local rainbow_delimiters = require 'rainbow-delimiters'

        vim.g.rainbow_delimiters = {
            strategy = {
                [''] = rainbow_delimiters.strategy['global'],
                vim = rainbow_delimiters.strategy['local'],
            },
            query = {
                [''] = 'rainbow-delimiters',
                lua = 'rainbow-blocks',
                -- javascript = "rainbow-delimiters-react",
                -- vue = 'rainbow-delimiters',
            },
            highlight = {
                "RainbowDelimiterRed",
                "RainbowDelimiterOrange",
                "RainbowDelimiterYellow",
                -- "RainbowDelimiterGreen",
                "RainbowDelimiterViolet",
                "RainbowDelimiterBlue",
                -- "RainbowDelimiterCyan",
            },
        }
    end
}
