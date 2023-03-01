-- https://github.com/nvim-tree/nvim-tree.lua
return {
  'nvim-tree/nvim-tree.lua',
	lazy = true,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
	keys = {
					{ "<leader>1", "<CMD>NvimTreeToggle<CR>"},
					{ "<leader>2", "<CMD>NvimTreeFindFile<CR>"},
					{ "<leader>7", "<CMD>NvimTreeRefresh<CR>"},
	},
	config =function()
			require("nvim-tree").setup({
				auto_reload_on_write = true,
				disable_netrw = false,
				hijack_cursor = true,
				hijack_netrw = true,
				hijack_unnamed_buffer_when_opening = true,
				respect_buf_cwd = false,
				sort_by = "name",
				sync_root_with_cwd = true,
				update_cwd = true,
				reload_on_bufenter = true,
			
				view = {
					adaptive_size = false,
					centralize_selection = false,
					width = 30,
					side = "left",
					preserve_window_proportions = false,
					number = false,
					relativenumber = false,
					signcolumn = "no",
					hide_root_folder = false,
					mappings = { 
						list = { 
							{ key = "?", action = "toggle_help"}, 
							{ key = "u", action = "dir_up" },
						},
					},
					float = {
						enable = false,
						open_win_config = {
							relative = "editor",
							border = "rounded",
							width = 30,
							height = 30,
							row = 1,
							col = 1,
						},
					},
				},

				renderer = {
					add_trailing = false,
					group_empty = true,
					highlight_git = false,
					full_name = false,
					highlight_opened_files = "none",
					special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "CMakeLists.txt" },
					symlink_destination = true,
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
							folder_arrow = false,
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
												-- arrow_open = " ",
												-- arrow_closed = " ",
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
				hijack_directories = {
					enable = true,
					auto_open = true,
				},
				update_focused_file = {
							enable = true,
							update_cwd = true, -- 
							update_root = true,
							ignore_list = {},
					},

				filters = {
					-- "^.git$" ".git",
							dotfiles = false,
							custom = { "node_modules", "\\.cache", "__pycache__",".DS_Store","thumbs.db",".idea",
								"^.git" },
							exclude = {".gitignore"},
					},
				actions = {
						use_system_clipboard = true,
						change_dir = {
								-- enable = true,
								-- global = true,
								-- restrict_above_cwd = false,
								enable = true,
								global = false,
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

				diagnostics = {
							enable = true,
							show_on_dirs = false,
							debounce_delay = 50,
							icons = {
									error = "",
									warning = "",
									-- info = "ﬤ",
									-- hint = "",
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
				trash = {
							cmd = "trash",
							require_confirm = true,
				},
				live_filter = {
					prefix = "[FILTER]: ",
					always_show_folders = true,
				},
				log = {
					enable = false,
					truncate = false,
					types = {
						all = false,
						config = false,
						copy_paste = false,
						dev = false,
						diagnostics = false,
						git = false,
						profile = false,
						watcher = false,
					},
				},
			})

	end
}