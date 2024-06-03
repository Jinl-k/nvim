-- https://github.com/folke/which-key.nvim
return {
	'folke/which-key.nvim',
	opts = {
		window = {
			margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
			padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
			border = "none",
			winblend = 50,-- value between 0-100 0 for fully opaque and 100 for fully transparent
		},
		layout = {
			-- height = { min = 4, max = 25 }, -- min and max height of the columns
			-- width = { min = 20, max = 50 }, -- min and max width of the columns
			-- spacing = 3, -- spacing between columns
			align = "left", -- align columns left, center or right
		  },
		disable = { filetypes = { "neo-tree", "NvimTree", "neo-tree-popup", } },
	}
}
