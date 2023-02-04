-- https://github.com/olimorris/persisted.nvim
-- https://github.com/rmagatti/auto-session
return {
  "olimorris/persisted.nvim",
	event = "VeryLazy",
	keys = {
					{ "<leader>4", "<CMD>SessionSave<CR>"},
					{ "<leader>5","<CMD>SessionLoad<CR>"},
					{ "<leader>6","<CMD>SessionDelete<CR>"},
	},
  config = function()
    require("persisted").setup({
				save_dir = vim.fn.expand(vim.fn.stdpath("data") .. "/sessions/"),
        use_git_branche = true,
        command = "VimLeavePre",
				allowed_dirs = {
					"~/.session",
				},
				silent = true,
        autosave = true,
				autoload = false,
				should_autosave = function()
    -- do not autosave if the alpha dashboard is the current filetype
				if vim.bo.filetype == "alpha" then
						return false
					end
					return true
				end,
        after_save = function()
            vim.cmd("nohlsearch")
        end,
				telescope = {
					before_source = function()
						-- Close all open buffers
						-- Thanks to https://github.com/avently
						vim.api.nvim_input("<ESC>:%bd<CR>")
					end,
					after_source = function(session)
						print("Loaded session " .. session.name)
					end,
				},
		})
    require("telescope").load_extension("persisted") -- To load the telescope extension
  end,
}