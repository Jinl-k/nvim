return {
	"nvim-tree/nvim-web-devicons",
	-- dependencies = { 'yamatsum/nvim-nonicons',},
	config = function()
		-- require('nvim-nonicons').setup {}
		-- local icons = require "nvim-nonicons"

		-- icons.get("file")
		require 'nvim-web-devicons'.setup {
			-- your personnal icons can go here (to override)
			-- you can specify color or cterm_color instead of specifying both of them
			-- DevIcon will be appended to `name`
			override = {
				zsh = {
					icon = "",
					color = "#428850",
					cterm_color = "65",
					name = "Zsh"
				},
				astro = {
					icon = "",
					color = "#FFFFFF",
					name = "astro",
				}
			},
			override_by_filename = {
				[".gitignore"] = {
					icon = "",
					color = "#f1502f",
					name = "Gitignore"
				}
			},
			-- same as `override` but specifically for overrides by extension
			-- takes effect when `strict` is true
			override_by_extension = {
				["log"] = {
					icon = "",
					color = "#81e043",
					name = "Log"
				}
			},
		}
	end
}
