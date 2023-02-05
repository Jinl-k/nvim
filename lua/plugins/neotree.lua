-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {
    'nvim-neo-tree/neo-tree.nvim',
		branch = "v2.x",
    -- cmd = "Neotree",
    dependencies = {
			"nvim-lua/plenary.nvim",
			'nvim-tree/nvim-web-devicons',
      'MunifTanjim/nui.nvim', 
    },
		-- enabled =false,
		keys = {
					{ "<leader>1", "<CMD>Neotree toggle<CR>"},
					{ "<leader>2","<CMD>Neotree reveal<CR>"},
					{ "<leader>3", "<CMD>Neotree float git_status<cr>"},
			},
    config = function()
			vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

			---@class FileMovedArgs
			---@field source string
			---@field destination string
			---@param args FileMovedArgs
			local function on_file_remove(args)
				local ts_clients = vim.lsp.get_active_clients({ name = "tsserver" })
				for _, ts_client in ipairs(ts_clients) do
					ts_client.request("workspace/executeCommand", {
						command = "_typescript.applyRenameFile",
						arguments = {
							{
								sourceUri = vim.uri_from_fname(args.source),
								targetUri = vim.uri_from_fname(args.destination),
							},
						},
					})
				end
			end

			require("neo-tree").setup({
					close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
					popup_border_style = "rounded",
					enable_git_status = true,
					enable_diagnostics = true,
					sort_case_insensitive = false, -- used when sorting files and directories in the tree
					-- sort_function = nil , -- use a custom function for sorting files and directories in the tree 
					sort_function = function (a,b)
					      if a.type == b.type then
					          return a.path < b.path
					      else
					          return a.type < b.type
					      end
					  end , -- this sorts files and directories descendantly
					default_component_configs = {
						container = {
							enable_character_fade = true
						},
						indent = {
							indent_size = 2,
							padding = 0, -- extra padding on left hand side
							-- indent guides
							with_markers = true,
							indent_marker = "│",
							last_indent_marker = "└",
							highlight = "NeoTreeIndentMarker",
							-- expander config, needed for nesting files
							with_expanders = false, -- if nil and file nesting is enabled, will enable expanders
							expander_collapsed = "",
							expander_expanded = "",
							expander_highlight = "NeoTreeExpander",
						},
						icon = {
							folder_closed = "",
							folder_open = "",
							folder_empty = "ﰊ",
							-- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
							-- then these will never be used.
							default = "*",
							highlight = "NeoTreeFileIcon"
						},
						modified = {
							symbol = "",
							highlight = "",
						},
						name = {
							trailing_slash = false,
							use_git_status_colors = true,
							highlight = "NeoTreeFileName",
						},
						git_status = {
							symbols = {
								-- Change type
								added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
								modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
								deleted   = "✖",-- this can only be used in the git_status source
								renamed   = "",--  this can only be used in the git_status source
								-- Status type
								untracked = "", --
								ignored   = "", --
								unstaged  = "", --
								staged    = "",
								conflict  = "", --
							}
						},
					},
					window = {
						position = "left",
						width = 32,
						mapping_options = {
							noremap = true,
							nowait = true,
						},
					},
					filesystem = {
						filtered_items = {
							visible =true, -- when true, they will just be displayed differently than normal items
							hide_dotfiles = false,
							hide_gitignored = true,
							hide_hidden = true, -- only works on Windows for hidden files/directories
							hide_by_name = {
								-- ".DS_Store",
								".git",
							},
							hide_by_pattern = { -- uses glob style patterns
								"*.meta",
								--"*/src/*/tsconfig.json",
							},
							always_show = { -- remains visible even if other settings would normally hide it
								".gitignored",
							},
							never_show = { -- remains hidden even if visible is toggled to true, this overrides always_show
								".DS_Store",
								"thumbs.db",
								"node_modules",
								".idea",
								".git",
							},
							never_show_by_pattern = { -- uses glob style patterns
								".null-ls_*",
								"pnpm-lock.yaml",
							},
						},
						bind_to_cwd = true,
						cwd_target = {
							sidebar = "tab",   -- sidebar is when position = left or right
							current = "window" -- current is when position = current
						},
						follow_current_file = true, -- This will find and focus the file in the active buffer every
																				-- time the current file is changed while the tree is open.
						group_empty_dirs = false, -- when true, empty folders will be grouped together
						hijack_netrw_behavior = "open_current", 
																	--  open_default     netrw disabled, opening a directory opens neo-tree
																										-- in whatever position is specified in window.position
																	-- "open_current",  -- netrw disabled, opening a directory opens within the
																										-- window like netrw would, regardless of window.position
																	-- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
						use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
																						-- instead of relying on nvim autocmd events.
						window = {
							popup = {
								position = { col = "100%", row = "2" },
								size = function(state)
									local root_name = vim.fn.fnamemodify(state.path, ":~")
									local root_len = string.len(root_name) + 4
									return {
										width = math.max(root_len, 50),
										height = vim.o.lines - 6
									}
								end
							},
							mappings = {
								["<bs>"] = "navigate_up",
								["."] = "set_root",
								["H"] = "toggle_hidden",
								["/"] = "fuzzy_finder",
								["D"] = "fuzzy_finder_directory",
								["f"] = "filter_on_submit",
								["<c-x>"] = "clear_filter",
								["[g"] = "prev_git_modified",
								["]g"] = "next_git_modified",	
								["o"] = "system_open",
								["d"] = function(state)
									local node = state.tree:get_node()
									local path = node:get_id()
									vim.fn.system("trash " .. vim.fn.fnameescape(path))
								end,
								--  ["a"] = { "add", config = { show_path = "relative" } },
							}
						},
						commands = {
							system_open = function(state)
								local node = state.tree:get_node()
								local path = node:get_id()
								-- macOs: open file in default application in the background.
								-- Probably you need to adapt the Linux recipe for manage path with spaces. I don't have a mac to try.
								vim.api.nvim_command("silent !open -g " .. path)
								-- Linux: open file in default application
								vim.api.nvim_command(string.format("silent !xdg-open '%s'", path))
							end,
						},
					},
					nesting_rules = {
						-- ts = { "test.ts" },
						--  ["js"] = { "js.map" },
					},
					event_handlers = {
						{
							event = "file_moved",
							handler = on_file_remove,
						},
						{
							event = "file_renamed",
							handler = on_file_remove,
						},
						
					},
					buffers = {
						follow_current_file = true, 
						group_empty_dirs = true, -- when true, empty folders will be grouped together
						show_unloaded = true,
						window = {
							mappings = {
								["bd"] = "buffer_delete",
								["<bs>"] = "navigate_up",
								["."] = "set_root",
							}
						},
					},
					git_status = {
						window = {
							position = "float",
							mappings = {
								["A"]  = "git_add_all",
								["gu"] = "git_unstage_file",
								["ga"] = "git_add_file",
								["gr"] = "git_revert_file",
								["gc"] = "git_commit",
								["gp"] = "git_push",
								["gg"] = "git_commit_and_push",
							}
						}
					},
			})
		end,
}

-- NeoTreeBufferNumber       The buffer number shown in the buffers source.
-- NeoTreeCursorLine         |hl-CursorLine| override in Neo-tree window.
-- NeoTreeDimText            Greyed out text used in various places.
-- NeoTreeDirectoryIcon      Directory icon.
-- NeoTreeDirectoryName      Directory name.
-- NeoTreeDotfile            Used for icons and names when dotfiles are filtered.
-- NeoTreeFileIcon           File icon, when not overridden by devicons.
-- NeoTreeFileName           File name, when not overwritten by another status.
-- NeoTreeFileNameOpened     File name when the file is open. Not used yet.
-- NeoTreeFilterTerm         The filter term, as displayed in the root node.
-- NeoTreeFloatBorder        The border for pop-up windows.
-- NeoTreeFloatTitle         Used for the title text of pop-ups when the border-style
--                           is set to another style than "NC". This is derived
--                           from NeoTreeFloatBorder.
-- NeoTreeTitleBar           Used for the title bar of pop-ups, when the border-style
--                           is set to "NC". This is derived from NeoTreeFloatBorder.
-- NeoTreeGitAdded           File name when the git status is added.
-- NeoTreeGitConflict        File name when the git status is conflict.
-- NeoTreeGitDeleted         File name when the git status is deleted.
-- NeoTreeGitIgnored         File name when the git status is ignored.
-- NeoTreeGitModified        File name when the git status is modified.
-- NeoTreeGitUnstaged        Used for git unstaged symbol.
-- NeoTreeGitUntracked       File name when the git status is untracked.
-- NeoTreeGitStaged          Used for git staged symbol.
-- NeoTreeHiddenByName       Used for icons and names when `hide_by_name` is used.
-- NeoTreeIndentMarker       The style of indentation markers (guides). By default,
--                           the "Normal" highlight is used.
-- NeoTreeExpander           Used for collapsed/expanded icons.
-- NeoTreeNormal             |hl-Normal| override in Neo-tree window.
-- NeoTreeNormalNC           |hl-NormalNC| override in Neo-tree window.
-- NeoTreeSignColumn         |hl-SignColumn| override in Neo-tree window.
-- NeoTreeStatusLine         |hl-StatusLine| override in Neo-tree window.
-- NeoTreeStatusLineNC       |hl-StatusLineNC| override in Neo-tree window.
-- NeoTreeVertSplit          |hl-VertSplit| override in Neo-tree window.
-- NeoTreeWinSeparator       |hl-WinSeparator| override in Neo-tree window.
-- NeoTreeEndOfBuffer        |hl-EndOfBuffer| override in Neo-tree window.
-- NeoTreeRootName           The name of the root node.
-- NeoTreeSymbolicLinkTarget Symbolic link target.
-- NeoTreeTitleBar           Used for the title bar of pop-ups, when the border-style
--                           is set to "NC". This is derived from NeoTreeFloatBorder.
-- NeoTreeWindowsHidden      Used for icons and names that are hidden on Windows.
