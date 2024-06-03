local fileformat = {
    function()
        return ""
    end,
    -- color = { bg = "", fg = "#a6e3a1" },
    separator = { left = " " },
}
return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
        sections = {
            lualine_c = {
                LazyVim.lualine.root_dir(),
                {
                    "diagnostics",
                    symbols = {
                        error = " ",
                        warn = " ",
                        info = " ",
                        hint = " ",
                    },
                    separator = ""
                },
                -- { "filetype",                   icon_only = true, separator = "", padding = { left = 1, right = 0 } },
                { LazyVim.lualine.pretty_path() },
            },
            lualine_y = {
                { "progress", separator = " ",                  padding = { left = 1, right = 0 } },
                -- { "location", padding = { left = 0, right = 1 } },
            },
            lualine_z = {
                fileformat
            },
        }
    }
}
