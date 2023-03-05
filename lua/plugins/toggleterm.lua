-- https://github.com/akinsho/toggleterm.nvim
 return{
	"akinsho/toggleterm.nvim", 
	lazy = true,
	cmd = {
		"ToggleTerm",
		"ToggleTermSetName",
		"ToggleTermToggleAll",
		"ToggleTermSendVisualLines",
		"ToggleTermSendCurrentLine",
		"ToggleTermSendVisualSelection",
	},
	config = function()
		function _G.set_terminal_keymaps()
			local opts = {buffer = 0}
			vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
			vim.keymap.set('n', '<C-\\>', '<Cmd>exe v:count1 . "ToggleTerm direction=horizontal"<CR>', opts)
			vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
			vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
			vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
			vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
		end

		vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')


		require("toggleterm").setup{
			-- size can be a number or function which is passed the current terminal
			size = function(term)
							if term.direction == "horizontal" then
								return vim.o.lines * 0.25
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
			open_mapping = false, -- [[<c-\>]],
			hide_numbers = true, -- hide the number column in toggleterm buffers
			shade_filetypes = {},
			shade_terminals = false,
			shading_factor = "1", -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
			start_in_insert = true,
			insert_mappings = true, -- whether or not the open mapping applies in insert mode
			persist_size = true,
			direction = "horizontal",
			close_on_exit = true, -- close the terminal window when the process exits
			shell = vim.o.shell, -- change the default shell

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
			float_opts = {
				border = 'curved',--  | 'double' | 'shadow' | 'curved' | ... other options supported by win open
				-- width = 100,
				-- height = 40,
				-- winblend = 0,
			},
		}


		-- local M = { requires = {"toggleterm", } }
		-- M.terminals = {
		-- 		vert = nil,
		-- 		float = nil,
		-- 		lazygit = nil,
		-- }

		-- M.create_terminal()
    -- M.wrapper_command()

		-- function M.create_terminal()
		-- 	-- create terminal
		-- 	M.terminals.vert = M.terms:new({
		-- 			direction = "vertical",
		-- 	})

		-- 	M.terminals.float = M.terms:new({
		-- 			hidden = true,
		-- 			count = 120,
		-- 			direction = "float",
		-- 			float_opts = {
		-- 					border = options.float_border and "double" or "none",
		-- 			},
		-- 			on_open = function(term)
		-- 					M.open_callback()
		-- 					api.map.register({
		-- 							mode = { "t" },
		-- 							lhs = "<esc>",
		-- 							rhs = "<c-\\><c-n><cmd>close<cr>",
		-- 							options = { silent = true, buffer = term.bufnr },
		-- 							discope = "Escape float terminal",
		-- 					})
		-- 			end,
		-- 			on_close = M.close_callback,
		-- 	})

		-- 	M.terminals.lazygit = M.terms:new({
		-- 			cmd = "lazygit",
		-- 			count = 130,
		-- 			hidden = true,
		-- 			direction = "float",
		-- 			float_opts = {
		-- 					border = options.float_border and "double" or "none",
		-- 			},
		-- 			on_open = function(term)
		-- 					M.open_callback()
		-- 					api.map.register({
		-- 							mode = { "i" },
		-- 							lhs = "q",
		-- 							rhs = "<cmd>close<cr>",
		-- 							options = { silent = true, buffer = term.bufnr },
		-- 							discope = "Escape lazygit terminal",
		-- 					})
		-- 			end,
		-- 			on_close = M.close_callback,
		-- 		})
		-- end

		-- function M.wrapper_command()
		-- 		-- define new method
		-- 		M.toggleterm.vertical_toggle = function()
		-- 				---@diagnostic disable-next-line: missing-parameter
		-- 				M.terminals.vert:toggle()
		-- 		end

		-- 		M.toggleterm.float_toggle = function()
		-- 				---@diagnostic disable-next-line: missing-parameter
		-- 				M.terminals.float:toggle()
		-- 		end

		-- 		M.toggleterm.lazygit_toggle = function()
		-- 				---@diagnostic disable-next-line: missing-parameter
		-- 				M.terminals.lazygit:toggle()
		-- 		end

		-- 		M.toggleterm.term_toggle = function()
		-- 				-- FIX: https://github.com/akinsho/toggleterm.nvim/issues/97#issuecomment-1160323635
		-- 				local count = vim.api.nvim_eval("v:count1")
		-- 				public.terminal_offset_run_command(("exe %d.'ToggleTerm'"):format(count))
		-- 		end

		-- 		M.toggleterm.toggle_all_term = function()
		-- 				public.terminal_offset_run_command("ToggleTermToggleAll")
		-- 		end
		-- end
		
	end
}