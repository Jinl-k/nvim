return  {
		"folke/noice.nvim",
		dependencies ={
			"MunifTanjim/nui.nvim"
		},
		enabled = false,
		-- event = "VimEnter",
		event = "VeryLazy",
		config = function()
			require("noice").setup {
				debug = false,
				-- views = {
				-- 	cmdline_popup = {
				-- 		position = {
				-- 			row = 5,
				-- 			col = "50%",
				-- 		},
				-- 		size = {
				-- 			width = 60,
				-- 			height = "auto",
				-- 		},
				-- 	},
				-- 	popupmenu = {
				-- 		relative = "editor",
				-- 		position = {
				-- 			row = 8,
				-- 			col = "50%",
				-- 		},
				-- 		size = {
				-- 			width = 60,
				-- 			height = 10,
				-- 		},	
				-- 		border = {
				-- 			style = "rounded",
				-- 			padding = { 
				-- 		},
				-- 		win_options = {
				-- 			winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
				-- 		},
				-- 	},
				-- },
				cmdline = {
					enabled = true, -- enables the Noice cmdline UI
					view = "cmdline_popup", -- view for rendering the cmdline. Change to `cmdline` to get a classic cmdline at the bottom
					opts = {}, -- global options for the cmdline. See section on views
					---@type table<string, CmdlineFormat>
					format = {
						level = {
							icons = false,
						},
					},
				},
				win_options = {
					winhighlight = {
						Normal = "NormalFloat",
						FloatBorder = "FloatBorder"
					},
				},
				presets = {
					bottom_search = true, -- use a classic bottom cmdline for search
					command_palette = true, -- position the cmdline and popupmenu together
					long_message_to_split = true, -- long messages will be sent to a split
					inc_rename = true, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
				notify = {
					enabled = true,
					 view = "notify",
				},
				messages = {
					enabled = true, -- enables the Noice messages UI
					view = "notify", -- default view for messages
					view_error = "notify", -- view for errors
					view_warn = "notify", -- view for warnings
					view_history = "messages", -- view for :messages
					view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
				},
				lsp = {
					 -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						["cmp.entry.get_documentation"] = true,
					},
					progress = {
						enabled = false,
					},
					hover = {
						enabled = false,
					},
					signature = {
						enabled = false,
					},
				},
				routes = {
					{
						filter = { find = 'hover.nvim'},	
						opts = { skip = true },
					},
					{
						filter = { find = "加入"},
						 opts = { skip = true },
					},
					{
						filter = {
							event = "msg_show",
							kind = "",
							find = "written",
						},
						opts = { skip = true },
					},
					{
						filter = { find = "去掉"},
						 opts = { skip = true },
					},
					{
						filter = { find = "改变"},
						 opts = { skip = true },
					},
					{
						filter = {
							event = "msg_show",
							find = "%d+L, %d+B",
						},
						view = "mini",
					},
					{
						filter = { 
							event = "msg_show",
							find = "Neovide"
						},
						 opts = { skip = true },
					},
					 
				},
			}
		end,
}