-- https://github.com/numToStr/Comment.nvim
return {
    "numToStr/Comment.nvim",
		event = "BufReadPre",
    keys = {
        {
            "<D-/>",
            mode = "n",
            "<Plug>(comment_toggle_linewise_current)",
        },
        {
            "<D-/>",
            mode = "x",
            "<Plug>(comment_toggle_linewise_visual)",
        },
        {
            "<D-M-/>",
            mode = "n",
            "<Plug>(comment_toggle_blockwise_current)",
        },
        {
            "<D-M-/>",
            mode = "x",
            "<Plug>(comment_toggle_blockwise_visual)",
        },
    },
    opts = {
    },
		config = function()
        require('Comment').setup({
						-- Lines to be ignored while (un)comment
						ignore = "^$",
						---LHS of toggle mappings in NORMAL mode
						toggler = {
								---Line-comment toggle keymap
								line = 'gcc',
								---Block-comment toggle keymap
								block = 'gbc',
						},
						---LHS of operator-pending mappings in NORMAL and VISUAL mode
						opleader = {
								---Line-comment keymap
								line = 'gc',
								---Block-comment keymap
								block = 'gb',
						},
						---LHS of extra mappings
						extra = {
								---Add comment on the line above
								above = 'gcO',
								---Add comment on the line below
								below = 'gco',
								---Add comment at the end of line
								eol = 'gcA',
						},
						---Enable keybindings
						---NOTE: If given `false` then the plugin won't create any mappings
						mappings = {
								---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
								basic = true,
								---Extra mapping; `gco`, `gcO`, `gcA`
								extra = true,
						},
						---Function to call before (un)comment
						pre_hook = nil,
						---Function to call after (un)comment
						post_hook = nil,
				})
    end
}
