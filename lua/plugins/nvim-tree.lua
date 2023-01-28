-- https://github.com/nvim-tree/nvim-tree.lua
return {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly',
	keys = {
					{ "<leader>1", "<CMD>NvimTreeToggle<CR>"},
					{ "<leader>2","<CMD>NvimTreeFindFile<CR>"},
	},
	config =function()
	require("nvim-tree").setup({
			disable_netrw = false,
			hijack_netrw = false,
			hijack_cursor = true,
			update_cwd = true,
			ignore_ft_on_setup = { "dashboard","alpha" },
			reload_on_bufenter = true,
			sort_by = "case_sensitive",
			hijack_directories = {
				enable = true,
				auto_open = true,
			},
 			update_focused_file = {
            enable = true,
            update_cwd = false,
        },
			view = {
            side = "left",
            width = 35,
            hide_root_folder = false,
            signcolumn = "no",
            mappings = {
                list = {
                    { key = "?", action = "toggle_help" },
										{ key = "u", action = "dir_up" },
                },
            },
        },
			trash = {
            cmd = "trash",
            require_confirm = true,
			},
			diagnostics = {
            enable = true,
            show_on_dirs = false,
						debounce_delay = 50,
            icons = {
								-- hint = "",
								-- info = "",
								warning = "",
								error = "",
            },
        },
			actions = {
					use_system_clipboard = true,
					change_dir = {
							enable = true,
							global = true,
							restrict_above_cwd = false,
					},
					open_file = {
							resize_window = true,
							window_picker = {
									enable = true,
							},
					},
			},
			filesystem_watchers = {
				enable = true,
				debounce_delay = 50,
			},
			git = {
				enable = true,
				ignore = true,
				show_on_dirs = true,
				timeout = 400,
			},
			renderer = {
					group_empty = true,
					add_trailing = false,
					highlight_git = true,
					highlight_opened_files = "none",
					indent_markers = {
						enable = true,
						icons = {
							corner = "└ ",
							edge = "│ ",
							item = "│ ",
							none = "  ",
						},
					},
					icons = {
						webdev_colors = true,
							show = {
									file = true,
									folder = true,
									folder_arrow = true,
									git = true,
							},
							glyphs = {
									default = "",
									symlink = "",
									git = {
											unstaged = "",
											staged = "",
											unmerged = "",
											renamed = "凜",
											untracked = "",
											deleted = "✖",
											ignored = "",
									},
									folder = {
											arrow_open = "",
											arrow_closed = "",
											default = "",
											open = "",
											empty = "ﰊ",
											empty_open = "ﰊ",
											symlink = "",
											symlink_open = "",
									},
							},
					},
        },
			filters = {
            dotfiles = false,
            custom = { "node_modules", "\\.cache", "__pycache__",".DS_Store","thumbs.db",".idea",
								".git", },
            exclude = {},
        },
		})
	end
}