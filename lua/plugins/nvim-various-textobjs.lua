-- https://github.com/inkarkat/vim-ReplaceWithRegister
-- https://github.com/tommcdo/vim-exchange
-- https://github.com/gbprod/substitute.nvim
-- https://github.com/chrisgrieser/nvim-various-textobjs
return {
	"chrisgrieser/nvim-various-textobjs",
	event = "VeryLazy",
	dependencies={ 
		-- 'inkarkat/vim-ReplaceWithRegister' ,
		-- 'tommcdo/vim-exchange',
		{
			"gbprod/substitute.nvim",
			config = function()
				-- local opt = {noremap = true,silent = true}
				-- -- 替换
				-- vim.keymap.set("n", "cd", "<cmd>lua require('substitute').operator()<cr>", { noremap = true },{desc = '替换'})
				-- vim.keymap.set("n", "cds", "<cmd>lua require('substitute').line()<cr>", { noremap = true })
				-- vim.keymap.set("n", "cdS", "<cmd>lua require('substitute').eol()<cr>", { noremap = true })
				-- vim.keymap.set("n", "<leader>cc", "<cmd>lua require('substitute.range').operator()<cr>", { noremap = true })
				-- vim.keymap.set("x", "<leader>cc", "<cmd>lua require('substitute.range').visual()<cr>", { noremap = true })
				-- vim.keymap.set("n", "<leader>cC", "<cmd>lua require('substitute.range').word()<cr>", { noremap = true })

				-- -- 交换
				-- vim.keymap.set("n", "cc", "<cmd>lua require('substitute.exchange').operator()<cr>", { noremap = true })
				-- vim.keymap.set("n", "cC", "<cmd>lua require('substitute.exchange').line()<cr>", { noremap = true })
				vim.keymap.set("n", "<esc>", "<cmd>lua require('substitute.exchange').cancel()<cr>", { noremap = true })
				require("substitute").setup({
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				})
			end
		},
	},
	config = function () 
		require("various-textobjs").setup({ lookForwardLines = 50,useDefaultKeymaps = true })
	end,
}