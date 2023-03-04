-- https://github.com/ray-x/lsp_signature.nvim
-- https://github.com/ray-x/navigator.lua
return{
	'ray-x/lsp_signature.nvim',
	event = "BufReadPre",
	opts= {
		bind = true,
    handler_opts = {
      border = "rounded"
    }
	},
	config = function(opts)
		require'lsp_signature'.setup(opts)
	end
}