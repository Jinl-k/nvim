
-- https://github.com/akinsho/bufferline.nvim
  return {
    'akinsho/bufferline.nvim',
    event = 'BufReadPre',
			-- enabled =false,
		opts ={
			options = {
				max_name_length = 14,
				max_prefix_length = 13,
				color_icons = true,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_buffer_default_icon = true,
				show_tab_indicators = true,
				enforce_regular_tabs = true,
				persist_buffer_sort = true,
				always_show_bufferline = true,
			
				themable = true,
				close_command = "bdelete! %d",
				show_close_icon = true,
				-- ordinal
				tab_size = 20,
				numbers = "none",
				buffer_close_icon = "",
				modified_icon = "●",
				close_icon = "",
				left_trunc_marker = "",
				right_trunc_marker = "",
				separator_style = "thin",
				indicator = { icon = "▎", style = "icon" },
				highlights = {},
        -- 使用 nvim 内置lsp
        diagnostics = "nvim_lsp",
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
                    text = "File Explorer",
                    highlight = "Directory",
                    text_align = "center",
                },{
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
