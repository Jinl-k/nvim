return {
  "utilyre/barbecue.nvim",
	-- event = 'VeryLazy',
	lazy =false,
	enabled = false,
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },
	config = function()	
		require("barbecue").setup({
			create_autocmd = false, -- prevent barbecue from updating itself automatically
			 attach_navic = false,
			--  custom_section = function(bufnr)
			-- 	return (
			-- 		vim.bo[bufnr].readonly
			-- 			and "%#Error#" .. vim.g.icons.widget.inline.Lock
			-- 		or ""
			-- 	) .. " "
			-- end,
			-- kinds = vim.g.icons.kind,
			-- symbols = {
			-- 	ellipsis = vim.g.icons.layout.Truncation,
			-- 	separator = vim.g.icons.layout.Nesting,
			-- 	modified = vim.g.icons.layout.Modified,
			-- },
		})

		vim.api.nvim_create_autocmd({
			"WinResized",
			"BufWinEnter",
			"CursorHold",
			"InsertLeave",
			"BufWritePost",
			"TextChanged",
			"TextChangedI",
		}, {
			group = vim.api.nvim_create_augroup("barbecue.updater", {}),
			callback = function()
				require("barbecue.ui").update()
			end,
		})
	end
}