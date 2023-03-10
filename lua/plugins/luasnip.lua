local M = {
    "L3MON4D3/LuaSnip",
    dependencies = {
        "rafamadriz/friendly-snippets",
    },
		event = "VeryLazy",
    config = function()
			local snippet_path = os.getenv("HOME") .. "/.config/nvim/snippets/"
			if not vim.tbl_contains(vim.opt.rtp:get(), snippet_path) then
				vim.opt.rtp:append(snippet_path)
			end
			
			require("luasnip").setup({
				history = true,
				updateevents = "TextChanged,TextChangedI",
				delete_check_events = "TextChanged,InsertLeave",
			})
			require("luasnip.loaders.from_lua").lazy_load()
			require("luasnip.loaders.from_vscode").lazy_load()
			require("luasnip.loaders.from_snipmate").lazy_load()

			-- luasnip.filetype_extend("javascript", { "typescript" })
    	-- luasnip.filetype_extend("typescript", { "javascript" })
    	-- luasnip.filetype_extend("vue", { "javascript", "typescript" })
		end,
}

return M
