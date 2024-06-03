-- https://github.com/rcarriga/nvim-notify
return {
	{
		"folke/noice.nvim",
		opts = {
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
							{ find = "%d+ lines yanked" },
							{ find = "%d+ fewer lines" },
						},
					},
					opts = { skip = true },
					view = "mini",

				},
			},
			-- Unicode symbols
			format = {
				level = {
					icons = {
						error = "✖",
						warn = "▼",
						info = "●",
					},
				},
			},
			---@type NoiceConfigViews
			views = {
				-- 			 split = {
				--   enter = true,
				-- },
				cmdline_popup = {
					position = {
						row = 5,
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
					win_options = {
						-- winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:Search",
						-- winhighlight = { Normal = "none", FloatBorder = "FloatBorder" },
						winblend = 10,
					},

				},
				popupmenu = {
					relative = "editor",
					position = "100%",
					size = {
						width = 60,
						height = 10,
					},
					border = {
						style = "rounded",
						padding = { 0, 1 },

					},
					win_options = {
						winhighlight = { Normal = "none", FloatBorder = "FloatBorder" },
						winblend = 50,
					},
				},
			},

		},
		-- stylua: ignore
		-- keys = {
		-- 	{ "<S-Enter>",   function() require("noice").redirect(vim.fn.getcmdline()) end,                 mode = "c",                 desc = "Redirect Cmdline" },
		-- 	{ "<leader>snl", function() require("noice").cmd("last") end,                                   desc = "Noice Last Message" },
		-- 	{ "<leader>snh", function() require("noice").cmd("history") end,                                desc = "Noice History" },
		-- 	{ "<leader>sna", function() require("noice").cmd("all") end,                                    desc = "Noice All" },
		-- 	{ "<leader>snd", function() require("noice").cmd("dismiss") end,                                desc = "Dismiss All" },
		-- 	{ "<leader>snt", function() require("noice").cmd("telescope") end,                              desc = "Noice Telescope" },
		-- 	{ "<c-f>",       function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end,  silent = true,              expr = true,              desc = "Scroll Forward",  mode = { "i", "n", "s" } },
		-- 	{ "<c-b>",       function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true,              expr = true,              desc = "Scroll Backward", mode = { "i", "n", "s" } },
		-- },
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			fps = 120,
			timeout = 2000,
			-- icons = {
			-- 	ERROR = " ",
			-- 	WARNING = " ",
			-- 	INFO = " ",
			-- 	HINT = " ",
			-- },
		},

	}
}
