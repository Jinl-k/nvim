return {
	"zbirenbaum/copilot.lua",
	event = "InsertEnter",
	-- enabled = false,
	config = function()
		require("copilot").setup({
					cmp = {
						enabled = true,
						method = "getCompletionsCycling",
					},
					panel = {
						-- if true, it can interfere with completions in copilot-cmp
						enabled = false,
					},
					suggestion = {
						-- if true, it can interfere with completions in copilot-cmp
						enabled = false,
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