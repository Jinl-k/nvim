local M = {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
    config = function()
			local api = require("config.utils")
			local luasnip = require("luasnip")
			luasnip.setup({
        history = true,
				updateevents = "TextChanged,TextChangedI",
				delete_check_events = "TextChanged,InsertLeave",
    	})
			require("luasnip.loaders.from_vscode").lazy_load({
				paths = {
            api.join(vim.fn.stdpath("config"), "snippets"),
            api.join(api.join(vim.fn.stdpath("data"), "store"), "friendly-snippets"),
        },
			})
			luasnip.filetype_extend("javascript", { "typescript" })
    	luasnip.filetype_extend("typescript", { "javascript" })
    	luasnip.filetype_extend("vue", { "javascript", "typescript" })
		end,
}

return M
