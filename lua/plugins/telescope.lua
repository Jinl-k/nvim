-- local telescope = prequire("telescope")
-- if not telescope then return end

-- telescope.setup {
--   defaults = {
--     picker = {
--       hidden = false,
--     },
--     vimgrep_arguments = {
--       "rg",
--       "--color=never",
--       "--no-heading",
--       "--with-filename",
--       "--line-number",
--       "--column",
--       "--no-ignore",
--       "--smart-case",
--       "--hidden",
--     },
--     prompt_prefix = "  ",
--     selection_caret = "  ",
--     entry_prefix = "  ",
--     initial_mode = "insert",
--     selection_strategy = "reset",
--     sorting_strategy = "descending",
--     layout_strategy = "horizontal",
--     layout_config = {
--       horizontal = {
--         prompt_position = "top",
--         preview_width = 0.55,
--         results_width = 0.8
--       },
--       vertical = { mirror = false },
--       width = 0.87,
--       height = 0.80,
--       preview_cutoff = 120
--     },
--     file_sorter = require("telescope.sorters").get_fuzzy_file,
--     file_ignore_patterns = { "node_modules", ".git/", "dist/", "build/" },
--     generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
--     path_display = { "absolute" },
--     winblend = 0,
--     border = {},
--     borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
--     color_devicons = true,
--     use_less = true,
--     set_env = { ["COLORTERM"] = "truecolor" },
--     file_previewer = require("telescope.previewers").vim_buffer_cat.new,
--     grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
--     qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
--     buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
--     mappings = {
--       i = {
--         ["<Tab>"] = "move_selection_next",
--         ["<S-Tab>"] = "move_selection_previous",
--       },
--       n = {
--         ["<Tab>"] = "move_selection_next",
--         ["<S-Tab>"] = "move_selection_previous",
--       },
--     },
--   },
--   extensions = {
--     fzf = {
--       fuzzy = true,
--       override_generic_sorter = true,
--       override_file_sorter = true,
--       case_mode = "smart_case"
--     },
--   }
-- }
-- https://github.com/nvim-telescope/telescope.nvim
-- https://github.com/nvim-telescope/telescope-file-browser.nvim
local M = {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	cmd = "Telescope",
		-- enabled =false,
	dependencies = {
		{ "nvim-tree/nvim-web-devicons" },
		"nvim-lua/plenary.nvim",
		{ "ahmedkhalf/project.nvim", event = "BufReadPost" },
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{ "nvim-telescope/telescope-file-browser.nvim" },
		{ "nvim-telescope/telescope-frecency.nvim", dependencies = {
			{ "kkharji/sqlite.lua" },
		} },
		{ "jvgrootveld/telescope-zoxide" },
		{ "nvim-telescope/telescope-live-grep-args.nvim" },
	},
	opts = function()
		local actions = require("telescope.actions")
		local theme = require("telescope.themes")
		local telescope_actions = require("telescope.actions.set")
		local fixfolds = {
			hidden = true,
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
		return {
			defaults = {
				initial_mode = "insert",
				prompt_prefix = "  ",
				selection_caret = "  ",
				entry_prefix = " ",
				scroll_strategy = "limit",
				results_title = false,
				layout_strategy = "horizontal",
				path_display = { "absolute" },
				file_ignore_patterns = { ".git/", "node_modules","*/dist/*","dist","*/dist",".idea/", ".DS_Store","*/.DS_Store", ".cache", "%.class", "%.pdf", "%.mkv", "%.mp4", "%.zip","%.yaml"},
				layout_config = {
					horizontal = {
						preview_width = 0.5,
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
				["ui-select"] = {
					theme.get_dropdown({
						-- even more opts
					}),
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
				undo = {
					side_by_side = true,
					layout_config = {
						preview_height = 0.8,
					},
					mappings = { -- this whole table is the default
						i = {
							-- IMPORTANT: Note that telescope-undo must be available when telescope is configured if
							-- you want to use the following actions. This means installing as a dependency of
							-- telescope in it's `requirements` and loading this extension from there instead of
							-- having the separate plugin definition as outlined above. See issue #6.
							-- ["<cr>"] = require("telescope-undo.actions").yank_additions,
							-- ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
							-- ["<C-cr>"] = require("telescope-undo.actions").restore,
						},
					},
				},
				file_browser = {
					grouped = true,
					hidden = false,
					hijack_netrw = true,
					respect_gitignore = true,
				},
			},
		}
	end,
	config = function(_, opts)
		local telescope = require("telescope")
		telescope.setup(opts)
		require("project_nvim").setup {
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true
			},
      -- Manual mode doesn't automatically change your root directory, so you have
			-- the option to manually do so using `:ProjectRoot` command.
			manual_mode = false,

			-- Methods of detecting the root directory. **"lsp"** uses the native neovim
			-- lsp, while **"pattern"** uses vim-rooter like glob pattern matching. Here
			-- order matters: if one is not detected, the other is used as fallback. You
			-- can also delete or rearangne the detection methods.
			detection_methods = { "lsp", "pattern" },

			-- All the patterns used to detect root dir, when **"pattern"** is in
			-- detection_methods
			patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json" },

			-- Table of lsp clients to ignore by name
			-- eg: { "efm", ... }
			ignore_lsp = { "efm", "copilot" },

			-- Don't calculate root dir on specific directories
			-- Ex: { "~/.cargo/*", ... }
			exclude_dirs = {"~/.cargo/*","node_modules",".cache/*",".git/*",".idea/*",".DS_Store","pnpm-lock.yaml"},

			-- Show hidden files in telescope
			show_hidden = false,

			-- When set to false, you will get a message when project.nvim changes your
			-- directory.
			silent_chdir = true,

			-- What scope to change the directory, valid options are
			-- * global (default)
			-- * tab
			-- * win
			scope_chdir = 'global',

			-- Path where project.nvim will store the project history for use in
			-- telescope
			datapath = vim.fn.stdpath("data"),
    }
		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
		telescope.load_extension("file_browser")
		telescope.load_extension("projects")
		require("telescope").load_extension("zoxide")
		require("telescope").load_extension("frecency")
		require("telescope").load_extension("live_grep_args")
		-- require("telescope").load_extension("undo")
	end,
}

return M
