-- https://github.com/olimorris/persisted.nvim
-- https://github.com/rmagatti/auto-session
return {
  "rmagatti/auto-session",
	event = "VeryLazy",
	cmd = { "SaveSession", "RestoreSession", "DeleteSession" },
	keys = {
					{ "<leader>4", "<CMD>SaveSession<CR>"},
					{ "<leader>5","<CMD>RestoreSession<CR>"},
					{ "<leader>6","<CMD>DeleteSession<CR>"},
					{ "<leader>S","<cmd>Telescope session-lens search_session<cr>"},
					
	},
  config = function()
		require("auto-session").setup({
			log_level = "error",
			auto_session_enable_last_session = false,
			auto_session_root_dir = vim.fn.stdpath("data") .. "/sessions/",
			auto_session_enabled = true,
			auto_save_enabled = false,
			auto_restore_enabled = false,
			auto_session_suppress_dirs = nil,
			auto_session_use_git_branch = false,
		})
  end,
}