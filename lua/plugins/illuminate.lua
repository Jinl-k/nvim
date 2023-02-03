-- https://github.com/RRethy/vim-illuminate
-- https://github.com/yamatsum/nvim-cursorline
return {
	"RRethy/vim-illuminate",
	lazy = false,
	config = function()
		require('illuminate').configure({
        delay = 100,
        under_cursor = true,
        modes_denylist = { "i" },
        providers = {
            [[ "lsp", ]],
            "regex",
            "treesitter",
        },
        filetypes_denylist = {
            "NvimTree",
            "aerial",
						"alpha",
            "undotree",
            "spectre_panel",
            "dbui",
            "toggleterm",
            "notify",
            "startuptime",
            "packer",
            "mason",
            "help",
            "terminal",
            "lspinfo",
            "TelescopePrompt",
            "TelescopeResults",
            "",
        },
    })
	end
	
}