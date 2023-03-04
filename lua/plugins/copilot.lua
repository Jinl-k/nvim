-- https://github.com/zbirenbaum/copilot.lua
return {
	"zbirenbaum/copilot.lua",
	event = "BufReadPre",
	config = function()
		require("copilot").setup({
					panel = {
						enabled = true,
						auto_refresh = true,
						keymap = {
							jump_prev = "[[",
							jump_next = "]]",
							accept = "<CR>",
							refresh = "gr",
							open = "<M-CR>"
						},
						layout = {
							position = "bottom", -- | top | left | right
							ratio = 0.4
						},	
					},
					suggestion = {
						enabled = true,
						auto_trigger = true,
						debounce = 75,
						keymap = {
							accept = "<d-l>",
							accept_word = false,
							accept_line = false,
							next = "<m-]>",
							prev = "<m-[>",
							dismiss = "<C-]>",
						},
					},
					filetypes = {
						yaml = false,
						markdown = false,
						help = false,
						gitcommit = false,
						gitrebase = false,
						hgcommit = false,
						svn = false,
						cvs = false,
						["."] = false,
						["dap-repl"] = false,
					},
			})
	end
}