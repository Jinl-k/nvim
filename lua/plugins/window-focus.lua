-- https://github.com/beauwilliams/focus.nvim
return{
	'beauwilliams/focus.nvim',
		event = "VeryLazy",
	config = function()
		require("focus").setup({
			bufnew =  false,
			autoresize = false,
			compatible_filetrees = {"filetree"},
			excluded_filetypes = {"toggleterm","neo-tree", 'cmp', 'fterm', 'term', 'harpoon', 'harpoon-menu', 'NvimTree', 'TelescopePrompt',"lspsaga",'NvimCodeActionMenu'}, 
			excluded_buftypes = { 'help','prompt', 'popup'},
			-- Enable resizing for excluded filetypes using forced_filetypes
			forced_filetypes = {"dan_repl"},
			cursorline = false,
			treewidth = 30,
			-- height = 20,
		})	
	end
}

-- https://github.com/numToStr/Navigator.nvim
-- return {
--     'numToStr/Navigator.nvim',
-- 		-- events = "BufRead",
-- 		lazy = false,
--     config = function()
-- 			-- vim.keymap.set({'n', 't'}, '<leader>h', '<CMD>NavigatorLeft<CR>')
-- 			-- vim.keymap.set({'n', 't'}, '<leader>l', '<CMD>NavigatorRight<CR>')
-- 			-- vim.keymap.set({'n', 't'}, '<leader>k', '<CMD>NavigatorUp<CR>')
-- 			-- vim.keymap.set({'n', 't'}, '<leader>j', '<CMD>NavigatorDown<CR>')
-- 			vim.keymap.set({'n', 't'}, '<A-p>', '<CMD>NavigatorPrevious<CR>')
--         require('Navigator').setup({
-- 					-- Save modified buffer(s) when moving to mux
-- 					-- nil - Don't save (default)
-- 					-- 'current' - Only save the current modified buffer
-- 					-- 'all' - Save all the buffers
-- 					auto_save = true,

-- 					-- Disable navigation when the current mux pane is zoomed in
-- 					disable_on_zoom = false,

-- 					-- Multiplexer to use
-- 					-- 'auto' - Chooses mux based on priority (default)
-- 					-- table - Custom mux to use
-- 					mux = 'auto'
-- 			})
--     end
-- }
