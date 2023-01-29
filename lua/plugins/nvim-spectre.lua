-- https://github.com/nvim-pack/nvim-spectre
return{
  'nvim-pack/nvim-spectre' ,
	event = "BufRead",
	config = function()
		require('spectre').setup({
			live_update = true, -- auto excute search again when you write any file in vim
		})
	end
}