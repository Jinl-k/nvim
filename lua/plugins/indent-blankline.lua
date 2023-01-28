local M = {
	"lukas-reineke/indent-blankline.nvim",
	dependencies = {
         "mrjones2014/nvim-ts-rainbow" ,
    },
	event = "BufReadPre",
	opts = function()
		return {
			char = "│",
			space_char_blankline = " ",
			show_first_indent_level = true,
			show_current_context = true,
			-- show_current_context_start = true,
			filetype_exclude = {
				"startify",
				"dashboard",
				"dotooagenda",
				"log",
				"fugitive",
				"gitcommit",
				"packer",
				"vimwiki",
				"markdown",
				"json",
				"txt",
				"vista",
				"help",
				"todoist",
				"NvimTree",
				"peekaboo",
				"git",
				"TelescopePrompt",
				"flutterToolsOutline",
				"Neo-Tree", -- for all buffers without a file type
			},
	}
	end,
}

return M


-- return {
-- 	'lukas-reineke/indent-blankline.nvim',
--   event = 'BufReadPre',
-- 	opts = {
-- 		indentLine_enabled = 1,
-- 		char = "▏",
-- 		space_char_blankline = " ",
-- 		buftype_exclude = { "terminal" },
-- 		filetype_exclude = { "help", "terminal", "dashboard", "packer", "alpha" },
-- 		show_current_context = true
-- 	},
--   config = function(_, opts) 
-- 		local blankline = require('config.blankline') 
-- 		blankline.setup(opts)
-- 	end,

-- }