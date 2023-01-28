-- https://github.com/nvim-tree/nvim-tree.lua
return {
  'nvim-tree/nvim-tree.lua',
	lazy = true,
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  tag = 'nightly',
	keys = {
					{ "<leader>1", "<CMD>NvimTreeToggle<CR>"},
					{ "<leader>2","<CMD>NvimTreeFindFile<CR>"},
					{ "<leader>7","<CMD>NvimTreeRefresh<CR>"},
	},
	config =function()
	require("nvim-tree").setup({
			create_in_closed_folder = false,
			respect_buf_cwd = false,
			auto_reload_on_write = true,
			hijack_netrw = true,
			hijack_unnamed_buffer_when_opening = true,
			ignore_buffer_on_setup = false,
			open_on_setup = false,
			open_on_setup_file = false,
			open_on_tab = false,
			sync_root_with_cwd = true,
			disable_netrw = false,
			hijack_cursor = true,
			update_cwd = true,
			ignore_ft_on_setup = { "dashboard","alpha" },
			reload_on_bufenter = true,
			sort_by = "name",
			hijack_directories = {
				enable = true,
				auto_open = true,
			},
 			update_focused_file = {
            enable = true,
            update_cwd = true,
						update_root = true,
						ignore_list = {},
        },
			view = {
						adaptive_size = false,
						centralize_selection = false,
						preserve_window_proportions = false,
						number = false,
						relativenumber = false,
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
							global = false,
							restrict_above_cwd = false,
					},
					open_file = {
							quit_on_open = false,
							resize_window = false,
							window_picker = {
								enable = true,
								chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
								exclude = {
									filetype = { "notify", "qf", "diff", "fugitive", "fugitiveblame" },
									buftype = { "terminal", "help" },
								},
							},
					},
					remove_file = {
						close_window = true,
					},
			},
			live_filter = {
				prefix = "[FILTER]: ",
				always_show_folders = true,
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
					highlight_git = false,
					full_name = false,
					special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "CMakeLists.txt" },
					symlink_destination = true,
					group_empty = true,
					add_trailing = false,
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
					-- root_folder_label = ":.:s?.*?/..?",
					icons = {
						webdev_colors = true,
						git_placement = "before",
							show = {
									file = true,
									folder = true,
									folder_arrow = true,
									git = true,
							},
							padding = " ",
							symlink_arrow = "  ",
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