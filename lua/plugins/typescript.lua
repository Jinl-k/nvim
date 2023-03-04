-- https://github.com/jose-elias-alvarez/typescript.nvim
return { 
	'jose-elias-alvarez/typescript.nvim', 
	-- lazy = false,
	event = 'BufRead',
	config = function()
		require("typescript").setup({
			disable_commands = false, -- prevent the plugin from creating Vim commands
			debug = false, -- enable debug logging for commands
			go_to_source_definition = { fallback = true },
			-- server = {
			-- 	on_attach = function(client, bufnr)
			-- 			-- Enable completion triggered by <c-x><c-o>
			-- 		vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
			-- 		-- local bufopts = { noremap = true, silent = true, buffer = bufnr }
			-- 		-- vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
			-- 		-- vim.keymap.set('n', 'gd', ':Telescope lsp_definitions<CR>', bufopts)
			-- 		-- vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
			-- 		-- vim.keymap.set('n', 'gI', ':Telescope lsp_implementations<cr>', bufopts)
			-- 		-- vim.keymap.set('n', 'gt', ':Telescope lsp_type_definitions<cr>', bufopts)
			-- 		-- vim.keymap.set('n', 'gr', ':Telescope lsp_references<CR>', bufopts)
			-- 	end
			-- }
		})
	end 
} 