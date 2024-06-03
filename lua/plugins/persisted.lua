-- https://github.com/olimorris/persisted.nvim
return {
	"olimorris/persisted.nvim",
	event = "VeryLazy",
	keys = {
		{ "<leader>4", "<CMD>SessionSave<CR>" },
		{ "<leader>5","<CMD>SessionLoadLast<CR>"},
		{ "<leader>6", "<CMD>SessionDelete<CR>" },
		{ "<leader>7", "<cmd>Telescope persisted<CR>" },
	},
	config = function()
		require("persisted").setup({
			save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"), -- directory where session files are saved
			silent = true,                                           -- silent nvim message when sourcing session file
			use_git_branch = false,                                  -- create session files based on the branch of the git enabled repository
			autosave = true,                                         -- automatically save session files when exiting Neovim
			should_autosave = function()
				-- do not autosave if the alpha dashboard is the current filetype
				if vim.bo.filetype == "alpha" then
					return false
				end
				return true
			end,                 -- function to determine if a session should be autosaved
			autoload = false,    -- automatically load the session for the cwd on Neovim startup
			on_autoload_no_session = nil, -- function to run when `autoload = true` but there is no session to load
			follow_cwd = true,   -- change session file name to match current working directory if it changes
			allowed_dirs = nil,  -- table of dirs that the plugin will auto-save and auto-load from
			ignored_dirs = nil,  -- table of dirs that are ignored when auto-saving and auto-loading
			telescope = {
				reset_prompt = true, -- Reset the Telescope prompt after an action?
				mappings = {     -- table of mappings for the Telescope extension
					change_branch = "<c-b>",
					copy_session = "<c-c>",
					delete_session = "<c-d>",
				},
				icons = { -- icons displayed in the picker, set to nil to disable entirely
					branch = " ",
					dir = " ",
					selected = " ",
				},
			},
		})
	end
}
