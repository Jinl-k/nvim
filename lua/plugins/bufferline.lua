-- https://github.com/akinsho/bufferline.nvim
return {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    opts = {
        options = {
            buffer_close_icon = "",
            -- modified_icon = "●",
            -- close_icon = "",
            -- left_trunc_marker = "",
            -- right_trunc_marker = "",
            -- diagnostics_indicator = function(_, _, diag)
            --     local icons = {
            --         Error = " ",
            --         Warn  = " ",
            --         Hint  = " ", --
            --         Info  = " ",
            --     }
            --     local ret = (diag.error and icons.Error .. diag.error .. " " or "")
            --         .. (diag.warning and icons.Warn .. diag.warning or "")
            --     return vim.trim(ret)
            -- end,
            diagnostics_indicator = false,
            -- 左侧让出 nvim-tree 的位置
            offsets = {
                {
                    filetype = "NvimTree",
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "center",
                },
                {
                    filetype = "neo-tree",
                    text = "Neo-tree",
                    highlight = "Directory",
                    text_align = "left",
                  },
                {
                    filetype = "aerial",
                    text = "Outline Explorer",
                    highlight = "Directory",
                    text_align = "center",
                },
                { filetype = "alpha", text = "", padding = 1 },
                {
                    filetype = "undotree",
                    text = "Undo Explorer",
                    highlight = "Directory",
                    text_align = "center",
                },
                {
                    filetype = "dbui",
                    text = "Database Explorer",
                    highlight = "Directory",
                    text_align = "center",
                },
                {
                    filetype = "spectre_panel",
                    text = "Project Blurry Search",
                    highlight = "Directory",
                    text_align = "center",
                },
                {
                    filetype = "toggleterm",
                    text = "Integrated Terminal",
                    highlight = "Directory",
                    text_align = "center",
                },
            }
        }
    },
}
