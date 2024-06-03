-- https://github.com/nvim-neo-tree/neo-tree.nvim
return {


	'nvim-neo-tree/neo-tree.nvim',
	keys = {
		{ "<leader>1", "<CMD>Neotree document_symbols<CR>", desc = "document symbols" },
		{ "<leader>2", "<CMD>Neotree reveal<CR>",           desc = "reveal file" },
		{ "<leader>3", "<CMD>Neotree float git_status<cr>", desc = "git status" },
	},
	opts = {
		enable_diagnostics = true,
		window = {
			position = "left",
			width = 32,
			mapping_options = {
				noremap = true,
				nowait = true,
			},
		},
		-- source_selector = {
		-- 	winbar = true,
		-- 	statusline = false
		-- },

		-- default_component_configs = {
		-- 	git_status = {
		-- 		symbols = {
		-- 			-- Change type
		-- 			added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
		-- 			modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
		-- 			deleted   = "✖", -- this can only be used in the git_status source
		-- 			renamed   = "", --  this can only be used in the git_status source
		-- 			-- Status type
		-- 			untracked = "", --
		-- 			ignored   = "", --
		-- 			unstaged  = "", --
		-- 			staged    = "",
		-- 			conflict  = "", --
		-- 		}
		-- 	},
		-- },
		filesystem = {
			commands = {
				-- Trash the target
				delete = function(state)
					local inputs = require("neo-tree.ui.inputs")
					local tree = state.tree
					local node = tree:get_node()
					if node.type == "message" then
						return
					end
					local _, name = require("neo-tree.utils").split_path(node.path)
					local msg = string.format("确定删除 '%s'?", name)
					inputs.confirm(msg, function(confirmed)
						if not confirmed then
							return
						end
						vim.api.nvim_command("silent !trash -F " .. node.path)
						-- cmds.refresh(state)
						require("neo-tree.sources.manager").refresh(state.name)
					end)
				end,

				-- Trash the selections (visual mode)
				delete_visual = function(state, selected_nodes)
					local paths_to_trash = {}
					local inputs = require("neo-tree.ui.inputs")
					for _, node in ipairs(selected_nodes) do
						if node.type ~= 'message' then
							table.insert(paths_to_trash, node.path)
						end
					end
					local msg = "Are you sure you want to trash " .. #paths_to_trash .. " items?"
					inputs.confirm(msg, function(confirmed)
						if not confirmed then
							return
						end
						for _, path in ipairs(paths_to_trash) do
							vim.api.nvim_command("silent !trash -F " .. path)
						end
						-- cmds.refresh(state)
						require("neo-tree.sources.manager").refresh(state.name)
					end)
				end
			},
			filtered_items = {
				visible = true, -- when true, they will just be displayed differently than normal items
				hide_dotfiles = false,
				hide_gitignored = true,
				hide_hidden = true, -- only works on Windows for hidden files/directories
				hide_by_name = {
					".DS_Store",
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
					-- "node_modules",
					".idea",
					".git",
					".github",
				},
				never_show_by_pattern = { -- uses glob style patterns
					".null-ls_*",
					-- "pnpm-lock.yaml",
				},
			},
			bind_to_cwd = true,
			follow_current_file = { enabled = true },
			hijack_netrw_behavior = "open_current",
			use_libuv_file_watcher = true, -- This will use the OS level file watchers to detect changes
		},
	}

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
