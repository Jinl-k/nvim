return {
	"zbirenbaum/copilot.lua",
	event = "BufReadPre",
	config = function()
		require("copilot").setup({
					cmp = {
						enabled = true,
						method = "getCompletionsCycling",
					},
					panel = {
						-- if true, it can interfere with completions in copilot-cmp
						
					},
					suggestion = {
						-- if true, it can interfere with completions in copilot-cmp
						
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