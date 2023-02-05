return {
    "ggandor/leap.nvim",
    event = "VeryLazy",
		keys ={
			{
				"<leader>7",
				mode = "n",
        "<Plug>(leap-cross-window)",
			},
		},
    config = function(_, opts)
        local leap = require("leap")
        leap.add_default_mappings()
				vim.api.nvim_set_hl(0, 'LeapBackdrop', { link = 'Comment' })
				vim.api.nvim_set_hl(0, 'LeapMatch', {
					fg = '#FAB387',  -- for light themes, set to 'black' or similar
					bold = true,
					-- nocombine = true,
				})
				require('leap').opts.highlight_unlabeled_phase_one_targets = true
    end,
}

-- https://github.com/ggandor/leap.nvim
