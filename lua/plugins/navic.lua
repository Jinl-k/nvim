-- https://github.com/SmiteshP/nvim-navic
return {
    "SmiteshP/nvim-navic",
		dependencies="neovim/nvim-lspconfig",
		event = 'BufRead',
    config = function()
			require("nvim-navic").setup({
        highlight = true,
        -- separator = " > ",
			})
    end,
}
