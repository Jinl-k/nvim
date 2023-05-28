-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/nvim-telescope/telescope-file-browser.nvim
-- https://github.com/nvim-telescope/telescope-project.nvim
return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	cmd = "Telescope",
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		"nvim-lua/plenary.nvim",
		"nvim-lua/popup.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
		{ "nvim-telescope/telescope-project.nvim" },
		{ "nvim-telescope/telescope-frecency.nvim", dependencies = {
			{ "kkharji/sqlite.lua" },
		} },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
	},
	opts = function()
		local actions = require("telescope.actions")
		local theme = require("telescope.themes")
		local telescope_actions = require("telescope.actions.set")
		local fixfolds = {
			hidden = true,
			-- theme = "cursor",
			attach_mappings = function(_)
				telescope_actions.select:enhance({
					post = function()
						vim.api.nvim_command([[:normal! zx"]])
					end,
				})
				return true
			end,
		}
		local lga_actions = require("telescope-live-grep-args.actions")
		local fb_actions = require("telescope").extensions.file_browser.actions
		return {
			defaults = {
				initial_mode = "insert", --insert
				prompt_prefix = "  ",
				selection_caret = "  ",
				entry_prefix = " ",
				scroll_strategy = "limit",
				results_title = false,

				mappings = {
					i = {
						-- Moving up and down
						["<C-j>"] = "move_selection_next",
						["<C-k>"] = "move_selection_previous",
						["<Down>"] = "move_selection_next",
						["<Up>"] = "move_selection_previous",
						-- history record
						["<C-n>"] = "cycle_history_next",
						["<C-p>"] = "cycle_history_prev",
						-- close the window
						["<C-c>"] = "close",
						-- The preview window scrolls up and down
						["<C-u>"] = "preview_scrolling_up",
						["<C-d>"] = "preview_scrolling_down",
					},
				},
				
				path_display = { "absolute" },
				file_ignore_patterns = { ".git/", "%.min.ts","%.min.js","*.min.js","%.min.css","*.min.css","node_modules","*/dist/*","dist","*/dist",".idea/", ".DS_Store","*/.DS_Store", ".cache", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip","%.yaml"},
				
				-- layout_strategy = "horizontal",
				-- layout_config = {
				-- 	horizontal = {
				-- 		preview_width = 0.5,
				-- 	},
				-- },

				-- theme
				layout_strategy = "bottom_pane",
				-- config
				layout_config = {
						bottom_pane = {
								height = 30,
								preview_cutoff = 100,
								prompt_position = "bottom",
						},
				},
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				-- mappings = { i = { ["<esc>"] = actions.close } },
			},
			color_devicons = true,
			pickers = {
				buffers = fixfolds,
				find_files = fixfolds,
				git_files = fixfolds,
				grep_string = fixfolds,
				live_grep = fixfolds,
				oldfiles = fixfolds,
			},
			extensions = {
				project = {
					-- base_dirs = {
					-- 	'~/dev/src',
					-- 	{'~/dev/src2'},
					-- 	{'~/dev/src3', max_depth = 4},
					-- 	{path = '~/dev/src4'},
					-- 	{path = '~/dev/src5', max_depth = 2},
					-- },
					hidden_files = true, 
					-- theme = "dropdown",
					order_by = "asc",
					search_by = "title",
					sync_with_nvim_tree = true,
				},
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
				frecency = {
					show_scores = true,
					show_unindexed = true,
					ignore_patterns = { "*.git/*", "*/tmp/*","*/dist/*", "dist","*/dist","tsconfig.json","node_modules", ".cache/.*",".idea/.*",".git/",".DS_Store","*/.DS_Store","pnpm-lock.yaml","%.yaml" },
				},
	
				live_grep_args = {
					auto_quoting = true, -- enable/disable auto-quoting
					-- define mappings, e.g.
					mappings = { -- extend mappings
						i = {
							["<C-k>"] = lga_actions.quote_prompt(),
							["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
						},
					},
				},
				-- undo = {
				-- 	side_by_side = true,
				-- 	layout_config = {
				-- 		preview_height = 0.8,
				-- 	},
				-- 	mappings = { -- this whole table is the default
				-- 		i = {
				-- 			-- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
				-- 			-- you want to use the following actions. This means installing as a dependency of
				-- 			-- telescope in it's `requirements` and loading this extension from there instead of
				-- 			-- having the separate plugin definition as outlined above. See issue #6.
				-- 			-- ["<cr>"] = require("telescope-undo.actions").yank_additions,
				-- 			-- ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
				-- 			-- ["<C-cr>"] = require("telescope-undo.actions").restore,
				-- 		},
				-- 	},
				-- },
				-- file_browser = {
				-- 	grouped = true,
				-- 	hidden = false,
				-- 	hijack_netrw = true,
				-- 	respect_gitignore = true,
				-- 	mappings = {
				-- 		["i"] = {
				-- 			-- remap to going to home directory
				-- 			["<C-h>"] = fb_actions.change_cwd
				-- 			-- ["<C-x>"] = function(prompt_bufnr)
				-- 				-- your custom function
				-- 			-- end
				-- 		},
				-- 	},
				-- },
			},
		}
	end,
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		telescope.load_extension("fzf")
		-- telescope.load_extension("file_browser")
		require("telescope").load_extension("frecency")
		require("telescope").load_extension("live_grep_args")
		require("telescope").load_extension("persisted")
		-- require("telescope").load_extension("undo")
	end,
}
