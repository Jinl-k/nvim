-- https://github.com/folke/which-key.nvim
return {
    'folke/which-key.nvim',
		lazy = false,
    config = function()
        require("which-key").setup( {
            window = {
							border = "rounded",
							position = "bottom",
							margin = { 1, 0, 1, 0 },
							padding = { 1, 1, 1, 1 },
							winblend = 0,
						},
						 layout = {
							height = { min = 4, max = 35 }, -- min and max height of the columns
							width = { min = 20, max = 50 }, -- min and max width of the columns
							spacing = 3, -- spacing between columns
							align = "left", -- align columns left, center or right
						},
            disable = { filetypes = { "neo-tree","NvimTree" } },
						icons = {
							breadcrumb = "",
							separator = "",
							group = "+",
						},
            plugins = {
                spelling = {
                    enabled = false,
                },
								presets = {
									operators = true,
									motions = true,
									text_objects = true,
									windows = true,
									nav = true,
									z = true,
									g = true,
								},
            }
        })
    end,
}
