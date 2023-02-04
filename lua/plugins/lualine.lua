-- statusline plugins
local M = {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	opts = function()
		-- local navic = require("nvim-navic")
		local function diff_source()
			local gitsigns = vim.b.gitsigns_status_dict
			if gitsigns then
				return {
					added = gitsigns.added,
					modified = gitsigns.changed,
					removed = gitsigns.removed,
				}
			end
		end

		
		local colors = {
			red = '#cdd6f4',
			grey = '#181825',
			black = '#323444', 
			white = '#313244',
			light_green = '#6c7086',
			orange = '#fab387',
			green = '#a6e3a1',
			blue = '#80A7EA',
		}

		local theme = {
			normal = {
				a = { fg = colors.black, bg = colors.blue },
				b = { fg = colors.blue, bg = colors.white },
				c = { fg = colors.white, bg = colors.black },
				z = { fg = colors.white, bg = colors.black },
			},
			insert = { a = { fg = colors.black, bg = colors.orange } },
			visual = { a = { fg = colors.black, bg = colors.green } },
			replace = { a = { fg = colors.black, bg = colors.green } },
		}

		local vim_icons = {
			function()
				return "Kevin"
			end,
			separator = { left = "", right = "" },
			color = { colors.white, fg = "#80A7EA" },
		}
		local space = {
			function()
				return " "
			end,
			color = { bg = colors.black, fg = "#80A7EA" },
		}

		local filename = {
			'filename',
			color = { bg = "#80A7EA", fg = "#242735" },
			separator = { left = "", right = "" },
		}

		local filetype = {
			"filetype",
			icon_only = true,
			colored = true,
			color = { colors.white },
			separator = { left = "", right = "" },
		}

		local filetype_tab = {
			"filetype",
			icon_only = true,
			colored = true,
			color = { colors.white },
		}

		local fileformat = {
			function()
				return ""
			end,
			color = { bg = "#b4befe", colors.white },
			separator = { right = "" },
		}


		local branch = {
			'branch',
			color = { bg = "#a6e3a1", colors.white },
			separator = { left = "", right = "" },
		}

		local diff = {
			"diff",
			color = { colors.white, colors.white },
			separator = { left = "", right = "" },
		}

		local modes = {
			'mode', fmt = function(str) return str:sub(1, 1) end,
			separator = {  right = "" },
		}

		local function getLspName()
			local msg = 'No Active Lsp'
			local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
			local clients = vim.lsp.get_active_clients()
			if next(clients) == nil then
				return msg
			end
			for _, client in ipairs(clients) do
				local filetypes = client.config.filetypes
				if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
					return "  " .. client.name
				end
			end
			return "  " .. msg
		end
		local dia = {
			'diagnostics',
			color = { colors.white, fg = "#80A7EA" },
			separator = { left = ""},
		}

		local lsp = {
			function()
				return getLspName()
			end,
			separator = { left = ""},
			color = { bg = "#fab387", fg = "#1e1e2e" },
		}
		return {
			options = {
				icons_enabled = true,
				theme = theme,
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				disabled_filetypes = { "alpha", "dashboard","TelescopePrompt" },
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					--  { "mode" },
					modes,
					-- vim_icons,
					fileformat,
					
				},
				lualine_b = {
					-- space,
						-- "branch",
						-- { "diff", source = diff_source },
						-- "diagnostics",
				},
				lualine_c = {
					-- filename,
					-- space,
					branch,
					diff,
				},
				lualine_x = {
					space,
					dia,
				},
				lualine_y = {
					"progress", 
					-- space,
					filetype,
					lsp,
				},
				lualine_z = {
					 
					--  "location" 
				}
      },
			inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { 'filename' },
					lualine_x = {},
					lualine_y = {},
					lualine_z = { }
			},
			extensions = {
				"quickfix",
				-- "nvim-tree",
				"nvim-dap-ui",
				"toggleterm",
				"fugitive",
				-- outline,
				-- diffview,
			},
			-- winbar = {
			-- 	lualine_a = { { "buffers", symbols = {
			-- 		alternate_file = "",
			-- 	} } },
			-- 	lualine_b = {},
			-- 	lualine_c = { { navic.get_location, cond = navic.is_available } },
			-- 	lualine_x = {},
			-- 	lualine_y = {},
			-- 	lualine_z = {},
			-- },

			-- inactive_winbar = {
			-- 	lualine_a = { "filename" },
			-- 	lualine_b = {},
			-- 	lualine_c = { { navic.get_location, cond = navic.is_available } },
			-- 	lualine_x = {},
			-- 	lualine_y = {},
			-- 	lualine_z = {},
			-- },
		}
	end,
}

return M
