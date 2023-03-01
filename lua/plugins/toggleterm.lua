-- https://github.com/akinsho/toggleterm.nvim
 return{
	"akinsho/toggleterm.nvim", 
	lazy = true,
	event = "UIEnter",
	config = function()
		-- local cp = require("catppuccin.palettes").get_palette()
		function _G.set_terminal_keymaps()
			local opts = {buffer = 0}
			vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
			-- vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
			vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
		end

		-- -- if you only want these mappings for toggle term use term://*toggleterm#* instead
		vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')
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
			highlights = {
				-- highlights which map to a highlight group name and a table of it's values
				-- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
				Normal = {
					-- guibg = "#89B4FA",
					link = 'Normal',
				},
				NormalFloat = {
					 link = "NormalFloat",
				},
				FloatBorder = {
					-- guifg = "#96CDFB",
					-- guifg = cp.base,
					-- guibg = cp.base,
				 link = "FloatBorder",
					
				},
			},
			shade_terminals = false, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
			start_in_insert = true,
			persist_size = true,
			persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
			direction = 'horizontal',-- | 'horizontal' | 'tab' | 'float',vertical
			close_on_exit = true, -- close the terminal window when the process exits
			float_opts = {
				border = 'curved',--  | 'double' | 'shadow' | 'curved' | ... other options supported by win open
				-- width = 100,
				-- height = 40,
				-- winblend = 0,
			},
		}
	end
}