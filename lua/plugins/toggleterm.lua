-- https://github.com/akinsho/toggleterm.nvim
return{
	"akinsho/toggleterm.nvim", 
	lazy = true,
	event = "UIEnter",
	config = function()
		local cp = require("catppuccin.palettes").get_palette()
		require("toggleterm").setup{
			-- size can be a number or function which is passed the current terminal
			size = function(term)
							if term.direction == "horizontal" then
								return 15
							elseif term.direction == "vertical" then
								return vim.o.columns * 0.3
							end
						end,
			on_open = function()
				-- Prevent infinite calls from freezing neovim.
				-- Only set these options specific to this terminal buffer.
				vim.api.nvim_set_option_value("foldmethod", "manual", { scope = "local" })
				vim.api.nvim_set_option_value("foldexpr", "0", { scope = "local" })
			end,
			open_mapping = false,
			hide_numbers = true, -- hide the number column in toggleterm buffers
			shade_filetypes = {},
			-- autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
			-- highlights = {
			-- 	-- highlights which map to a highlight group name and a table of it's values
			-- 	-- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
			-- 	Normal = {
			-- 		-- guibg = "#89B4FA",
			-- 		link = 'Normal',
			-- 	},
			-- 	NormalFloat = {
			-- 		link = 'Normal'
			-- 	},
			-- 	FloatBorder = {
			-- 		-- guifg = "#96CDFB",
			-- 		-- guifg = cp.base,
			-- 		-- guibg = cp.base,
			-- 		link = 'Normal',
					
			-- 	},
			-- },
			shade_terminals = false, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
			-- shading_factor = '<number>', -- the percentage by which to lighten terminal background, default: -30 (gets multiplied by -3 if background is light)
			start_in_insert = true,
			insert_mappings = true, -- whether or not the open mapping applies in insert mode
			terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
			persist_size = true,
			persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
			direction = 'horizontal',-- | 'horizontal' | 'tab' | 'float',vertical
			close_on_exit = true, -- close the terminal window when the process exits
			shell = vim.o.shell, -- change the default shell
			float_opts = {
				border = 'curved',--  | 'double' | 'shadow' | 'curved' | ... other options supported by win open
				-- width = 100,
				-- height = 40,
				-- winblend = 0,
			},
			-- winbar = {
			-- 	enabled = false,
			-- 	name_formatter = function(term) --  term: Terminal
			-- 		return term.name
			-- 	end
			-- },
		}
	end
}
