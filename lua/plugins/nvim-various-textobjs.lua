-- https://github.com/inkarkat/vim-ReplaceWithRegister
-- https://github.com/tommcdo/vim-exchange
-- https://github.com/gbprod/substitute.nvim
-- https://github.com/chrisgrieser/nvim-various-textobjs
local opt = { noremap = true, silent = true }
return {
	{

		"gbprod/substitute.nvim",
		event = "VeryLazy",
		vscode = true,
		keys = {
			{ "cm", "<cmd>lua require('substitute').operator()<cr>", mode = { "n" }, opt, desc = "替换模式" },
			{ "cml", "<cmd>lua require('substitute').line()<cr>", mode = { "n" }, opt, desc = "替换整行" },
			{ "cmL", "<cmd>lua require('substitute').eol()<cr>", mode = { "n" }, opt, desc = "替换行尾" },

			{ "cd", "<cmd>lua require('substitute.exchange').operator()<cr>", mode = { "n" }, opt, desc = "交换模式" },
			{ "cdl", "<cmd>lua require('substitute.exchange').line()<cr>", mode = { "n" }, opt, desc = "交换整行" },
			{ "<esc>", "<cmd>lua require('substitute.exchange').cancel()<cr>", mode = { "n" }, opt, desc = "取消" },

		},
		config = function()
			-- vim.keymap.set("x", "<leader>cc", "<cmd>lua require('substitute.range').visual()<cr>", { noremap = true })
			-- vim.keymap.set("n", "<leader>cC", "<cmd>lua require('substitute.range').word()<cr>", { noremap = true })
			-- 交换
			-- vim.keymap.set("n", "cd", "<cmd>lua require('substitute.exchange').operator()<cr>", opt)
			-- vim.keymap.set("n", "cdl", "<cmd>lua require('substitute.exchange').line()<cr>", opt)
			-- vim.keymap.set("n", "<esc>", "<cmd>lua require('substitute.exchange').cancel()<cr>", opt)
			require("substitute").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end

	},

	{
		"chrisgrieser/nvim-various-textobjs",
		event = "VeryLazy",
		vscode = true,
		opts = { useDefaultKeymaps = true },
	}
}
