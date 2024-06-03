-- https://github.com/catppuccin/nvim
return {
	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "catppuccin",
		},
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		config = function()
			require("catppuccin").setup({
				flavour = "mocha", -- Can be one of: latte, frappe, macchiato, mocha
				background = { light = "latte", dark = "mocha" },
				transparent_background = false,
				show_end_of_buffer = false, -- show the '~' characters after the end of buffers
				term_colors = true,
				compile_path = vim.fn.stdpath("cache") .. "/catppuccin",
				color_overrides = {

					mocha = {
						-- -- flamingo = "#F2CDCD",
						-- rosewater = "#F5E0DC",
						-- flamingo = "#FAE3B0",
						-- mauve = "#DDB6F2",
						-- pink = "#F5C2E7",
						-- red = "#F28FAD",
						-- maroon = "#E8A2AF",
						-- peach = "#F8BD96",
						-- yellow = "#FAE3B0",
						-- green = "#ABE9B3",
						-- blue = "#96CDFB",
						-- sky = "#89DCEB",
						-- teal = "#B5E8E0",
						-- lavender = "#C9CBFF",

						-- text = "#D9E0EE",
						-- subtext1 = "#BAC2DE",
						-- subtext0 = "#A6ADC8",
						-- overlay2 = "#C3BAC6",
						-- overlay1 = "#988BA2",
						-- overlay0 = "#6E6C7E",
						-- surface2 = "#6E6C7E",
						-- surface1 = "#575268",
						-- -- surface0 = "#8BBDE7",
						-- surface0 = "#2A2B3B",

						-- base = "#424553",
						-- base = "#D9E0EE",
						-- mantle = "#424553",
						-- mantle = "#F28FAD",
						crust = "#424553",
					},
				},
				highlight_overrides = {
					all = function(cp)
						return {

							-- 多光标
							VM_Mono_hl = { fg = cp.base, bg = cp.blue },
							VM_insert_hl = { fg = cp.base, bg = cp.red },
							MultiCursor = { fg = cp.base, bg = cp.blue },
							MultiCursorMain = { fg = cp.base, bg = cp.red },

							-- action
							-- DiffDelete	= { fg = cp.red, bg = cp.none },
							-- DiffAdd = { fg = cp.green, bg = cp.none },
							-- DiffChange =  { fg 	= cp.peach, bg = cp.none },

							SubstituteRange = { fg = cp.peach, bg = cp.none },
							SubstituteExchange = { fg = cp.peach, bg = cp.none },

							-- NeoTreeVertSplit = { fg = "#ffffff" },
							NeoTreeGitModified = { fg = cp.lavender, bg = cp.none },
							NeoTreeGitUnstaged = { fg = cp.peach, bg = cp.none },
							NeoTreeGitUntracked = { fg = cp.peach, bg = cp.none },


							-- IndentBlanklineChar = { fg = cp.none },
							-- IndentBlanklineContextChar = { fg = cp.blue },

							BufferLineIndicatorSelected = { fg = cp.peach, bg = cp.none },
							BufferLineSeparatorSelected = { fg = cp.peach, bg = cp.none },
							BufferLineSeparator = { fg = cp.none, bg = cp.none },
							-- BufferLineSeparatorVisible = { fg = cp.none, bg = cp.none },
							BufferLineCloseButtonSelected = { fg = cp.red, bg = cp.none },
							BufferLineModifiedSelected = { fg = cp.green, bg = cp.none },

							-- TreesitterContext = { fg = cp.green, bg = cp.none },

							-- TabLineFill = { bg = cp.black },
							-- TabLineSel = { fg = cp.green, bg = cp.surface1 },
							LspInlayHint = { bg = cp.none, fg = cp.overlay2 },

							FloatBorder = { fg = cp.blue, bg = cp.none },
							NormalFloat = { fg = cp.blue, bg = cp.none },
							CursorLineNr = { fg = cp.green },

							-- Keyword = { fg = cp.pink },
							-- Type = { fg = cp.blue },
							-- Typedef = { fg = cp.yellow },
							-- StorageClass = { fg = cp.red, style = { "italic" } },
							-- Search = { bg = cp.surface1, fg = cp.peach, style = { "bold" } },
							-- IncSearch = { bg = cp.peach, fg = cp.surface1 },

							-- For native lsp configs.
							DiagnosticVirtualTextError = { bg = cp.none },
							DiagnosticVirtualTextWarn = { bg = cp.none },
							DiagnosticVirtualTextInfo = { bg = cp.none },
							DiagnosticVirtualTextHint = { bg = cp.none },
							-- DiagnosticVirtualTextHint = { fg = cp.rosewater, bg = cp.none },

							-- DiagnosticHint = { fg = cp.rosewater },
							-- LspDiagnosticsDefaultHint = { fg = cp.rosewater },
							-- LspDiagnosticsHint = { fg = cp.rosewater },
							-- LspDiagnosticsVirtualTextHint = { fg = cp.rosewater },
							-- LspDiagnosticsUnderlineHint = { sp = cp.rosewater },
							-- Pmenu = { fg = cp.blue, bg = cp.none, bold = false },
							-- PmenuSel = { fg = cp.blue, bg = cp.none, bold = false },
							-- For fidget.
							FidgetTask = { bg = cp.none, fg = cp.surface2 },
							FidgetTitle = { fg = cp.blue, style = { "bold" } },


						}
					end,
				},
				integrations = {
					treesitter = true,
					native_lsp = {
						enabled = true,
						virtual_text = {
							errors = { "italic" },
							hints = { "italic" },
							warnings = { "italic" },
							information = { "italic" },
						},
						underlines = {
							errors = { "underline" },
							hints = { "underline" },
							warnings = { "underline" },
							information = { "underline" },
						},
					},
					aerial = true,
					alpha = true,
					cmp = true,
					dap = { enabled = true, enable_ui = true },
					dashboard = true,
					dropbar = { enabled = true, color_mode = true },
					fidget = true,
					flash = true,
					-- lazy = true,
					gitgutter = false,
					gitsigns = true,
					harpoon = false,
					headlines = true,
					illuminate = true,
					indent_blankline = { enabled = true, colored_indent_levels = false },
					lightspeed = false,
					lsp_saga = false,
					lsp_trouble = true,
					markdown = true,
					mason = true,
					mini = true,
					navic = { enabled = false },
					neogit = false,
					neotest = false,
					neotree = { enabled = false, show_root = true, transparent_panel = true },
					noice = true,
					notify = true,
					nvimtree = true,
					overseer = false,
					pounce = false,
					rainbow_delimiters = true,
					sandwich = false,
					semantic_tokens = true,
					symbols_outline = false,
					telekasten = false,
					telescope = true,
					treesitter_context = false,
					vimwiki = true,
					which_key = false,
					-- indentscope = true,
				}
			})
			-- vim.cmd.colorscheme "catppuccin"
		end
	}
}
