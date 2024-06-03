-- statusline plugins
return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		-- "nvim-lua/lsp-status.nvim",
		-- "folke/noice.nvim",
		-- "SmiteshP/nvim-navic",
	},
	init = function()
		vim.g.lualine_laststatus = vim.o.laststatus
		if vim.fn.argc(-1) > 0 then
			-- set an empty statusline till lualine loads
			vim.o.statusline = " "
		else
			-- hide the statusline on the starter page
			vim.o.laststatus = 0
		end
	end,
	opts = function()
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
				a = { fg = colors.blue, bg = colors.none },
				b = { fg = colors.blue, bg = colors.none },
				c = { fg = colors.none, bg = colors.none },
				z = { fg = colors.none, bg = colors.none },
			},
			insert = { a = { fg = colors.orange, bg = colors.orange } },
			visual = { a = { fg = colors.green, bg = colors.green } },
			replace = { a = { fg = colors.green, bg = colors.green } },
		}


		local space = {
			function()
				return " "
			end,
			color = { bg = colors.black, fg = "#80A7EA" },
		}

		local filename = {
			'filename',
			-- color = { bg = "#80A7EA", fg = "#242735" },
			color = { bg = "#b4befe", colors.white },
			-- separator = { left = "", right = "" },
			separator = { right = "" },
		}

		local filetype = {
			"filetype",
			icon_only = true,
			colored = true,
			color = { colors.white },
			separator = { left = "", right = "" },
		}

		local fileformat = {
			function()
				return ""
			end,
			color = { bg = "", fg = "#a6e3a1" },
			-- separator = { right = "" },
		}


		local branch = {
			'branch',
			-- color = { bg = colors.white},
			color = { colors.white, fg = "#80A7EA" },
			separator = { left = "", right = "" },
		}

		local diff = {
			"diff",
			symbols = { added = ' ', modified = '柳', removed = ' ' },
			color = { colors.white, colors.white },
			separator = { left = "", right = "" },
		}

		local modes = {
			'mode',
			fmt = function(str) return str:sub(1, 1) end,
			-- separator = { right = "" },
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
			color = { bg = "", fg = "#80A7EA" },
			separator = { left = "" },
		}

		local lsp = {
			function()
				return getLspName()
			end,
			separator = { left = "" },
			color = { bg = "", fg = "#fab387" },
		}
		return {
			options = {
				icons_enabled = true,
				theme = theme,
				component_separators = { left = '', right = '' },
				section_separators = { left = '', right = '' },
				disabled_filetypes = { "alpha", "dashboard", "TelescopePrompt" },
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

					-- {
					-- 	require "noice".api.statusline.command.get,
					-- 	cond = require "noice".api.statusline.command.has,
					-- 	color = { fg = "#6E6C7E" },
					-- },
					-- {
					-- 	require "noice".api.statusline.mode.get,
					-- 	cond = require "noice".api.statusline.mode.has,
					-- 	color = { fg = "#6E6C7E" },
					-- },
					-- {
					-- 	require "noice".api.statusline.search.get,
					-- 	cond = require "noice".api.statusline.search.has,
					-- 	color = { fg = "#6E6C7E" },
					-- },
				},
				lualine_x = {
					-- space,
					-- dia,
				},
				lualine_y = {
					"progress",
					-- space,
					-- filetype,
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
				lualine_z = {}
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
