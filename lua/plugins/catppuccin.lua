-- https://github.com/catppuccin/nvim
return { 
	"catppuccin/nvim", 
	name = "catppuccin",
	lazy = false,
	priority = 1000,
	config = function()
		local catppuccin = require("catppuccin")
		local cp = require("catppuccin.palettes").get_palette()
		local ucolors = require("catppuccin.utils.colors")

		require("catppuccin").setup({
				flavour = "mocha", -- latte, frappe, macchiato, mocha
				background = { -- :h background
						light = "latte",
						dark = "mocha",
				},
				compile = { enabled = true },
    		transparent_background = true,
				show_end_of_buffer = false, -- show the '~' characters after the end of buffers
				term_colors = true,
				dim_inactive = {
						enabled = false,
						shade = "dark",
						percentage = 0.15,
				},
				no_italic = false, -- Force no italic
				no_bold = false, -- Force no bold
				styles = {
						comments = { "italic" },
						properties = { "italic" },
						functions = { "italic", "bold" },
						keywords = { "italic" },
						operators = { "bold" },
						conditionals = { "bold" },
						loops = { "bold" },
						booleans = { "bold", "italic" },
						numbers = {},
						types = {},
						strings = {},
						variables = {},
				},
				color_overrides = {
					-- NeoTreeVertSplit = { fg = "#ffffff" },
					mocha = {
							-- flamingo = "#F2CDCD",
							rosewater = "#F5E0DC",
							flamingo = "#FAE3B0",
							mauve = "#DDB6F2",
							pink = "#F5C2E7",
							red = "#F28FAD",
							maroon = "#E8A2AF",
							peach = "#F8BD96",
							yellow = "#FAE3B0",
							green = "#ABE9B3",
							blue = "#96CDFB",
							sky = "#89DCEB",
							teal = "#B5E8E0",
							lavender = "#C9CBFF",

							text = "#D9E0EE",
							subtext1 = "#BAC2DE",
							subtext0 = "#A6ADC8",
							overlay2 = "#C3BAC6",
							overlay1 = "#988BA2",
							overlay0 = "#6E6C7E",
							surface2 = "#6E6C7E",
							surface1 = "#575268",
							surface0 = "#8BBDE7",

							base = "#1E1E2E",
							mantle = "#1A1826",
							crust = "#161320",
						},
				},
				highlight_overrides = {
					mocha = function(cp)
						return {

							SubstituteRange = { fg = cp.peach, bg = cp.none },			
							SubstituteExchange = { fg = cp.peach, bg = cp.none },			
							
							NeoTreeGitModified = { fg = cp.lavender, bg = cp.none },		
							NeoTreeGitUnstaged = { fg = cp.peach, bg = cp.none },					 
							NeoTreeGitUntracked = { fg = cp.peach, bg = cp.none },							
							-- ?????????
							VM_Mono_hl = { fg = cp.base, bg = cp.blue },
							VM_insert_hl = { fg = cp.base, bg = cp.red },

							IndentBlanklineChar = { fg = cp.none },
        			IndentBlanklineContextChar = { fg = cp.blue },

							rainbowcol1 = { fg = cp.peach, bg = "none" },
							rainbowcol2 = { fg = cp.mauve, bg = "none" },
							rainbowcol3 = { fg = cp.teal, bg = "none" },
							rainbowcol4 = { fg = cp.peach, bg = "none" },
							rainbowcol5 = { fg = cp.mauve, bg = "none" },
							rainbowcol6 = { fg = cp.teal, bg = "none" },
							rainbowcol7 = { fg = cp.peach, bg = "none" },

							TelescopeBorder = { fg = cp.blue },
							TelescopeSelectionCaret = { fg = cp.flamingo },
							TelescopeMatching = { fg = cp.blue },
							NullLsInfoBorder = { link = "FloatBorder" },
							-- For base configos.
							FloatBorder = { fg = cp.blue },
							TabLineFill = { bg = cp.black },
        			TabLineSel = { fg = cp.green, bg = cp.surface1 },
							LspInlayHint = { bg = cp.none, fg = cp.overlay2 },
							NormalFloat = { fg = cp.text, bg = transparent_background and cp.none},
							CursorLineNr = { fg = cp.blue},
							Search = { bg = cp.surface1, fg = cp.pink, style = { "bold" } },
							IncSearch = { bg = cp.peach, fg = cp.surface1 },
							Keyword = { fg = cp.pink },
							Type = { fg = cp.blue },
							Typedef = { fg = cp.yellow },
							StorageClass = { fg = cp.red, style = { "italic" } },

							BufferLineIndicatorSelected = { fg = cp.peach, bg = cp.none },
							BufferLineSeparatorSelected = { fg = cp.peach, bg = cp.none },
							BufferLineSeparator = { fg = cp.surface1, bg = cp.none },
							-- BufferLineSeparatorVisible = { fg = cp.red, bg = cp.mantle },
							BufferLineCloseButtonSelected = { fg = cp.red, bg = cp.none },
							BufferLineModifiedSelected = { fg = cp.green, bg = cp.none },

							-- For native lsp configs.
							DiagnosticVirtualTextError = { bg = cp.none },
							DiagnosticVirtualTextWarn = { bg = cp.none },
							DiagnosticVirtualTextInfo = { bg = cp.none },
							DiagnosticVirtualTextHint = { fg = cp.rosewater, bg = cp.none },

							DiagnosticHint = { fg = cp.rosewater },
							LspDiagnosticsDefaultHint = { fg = cp.rosewater },
							LspDiagnosticsHint = { fg = cp.rosewater },
							LspDiagnosticsVirtualTextHint = { fg = cp.rosewater },
							LspDiagnosticsUnderlineHint = { sp = cp.rosewater },

 							PmenuSel = { fg = cp.crust, bg = cp.green, bold = false },
							-- For fidget.
							FidgetTask = { bg = cp.none, fg = cp.surface2 },
							FidgetTitle = { fg = cp.blue, style = { "bold" } },

							-- For trouble.nvim
							TroubleNormal = { bg = cp.none },

								-- For treesitter.
							["@field"] = { fg = cp.rosewater },
							["@property"] = { fg = cp.yellow },

							["@include"] = { fg = cp.teal },
							["@keyword.operator"] = { fg = cp.sky },
							["@punctuation.special"] = { fg = cp.maroon },

							["@constructor"] = { fg = cp.lavender },
							["@exception"] = { fg = cp.peach },

							["@constant.builtin"] = { fg = cp.lavender },
							["@type.qualifier"] = { link = "@keyword" },
							["@variable.builtin"] = { fg = cp.red, style = { "italic" } },

							["@function.macro"] = { fg = cp.red, style = {} },
							["@parameter"] = { fg = cp.rosewater },
							["@keyword"] = { fg = cp.red, style = { "italic" } },
							["@keyword.function"] = { fg = cp.maroon },
							["@keyword.return"] = { fg = cp.pink, style = {} },
							["@method"] = { fg = cp.blue, style = { "italic" } },
							["@namespace"] = { fg = cp.rosewater, style = {} },

							["@punctuation.delimiter"] = { fg = cp.teal },
							["@punctuation.bracket"] = { fg = cp.overlay2 },
							["@type"] = { fg = cp.yellow },
							["@variable"] = { fg = cp.text },
							["@tag.attribute"] = { fg = cp.mauve, style = { "italic" } },
							["@tag"] = { fg = cp.peach },
							["@tag.delimiter"] = { fg = cp.maroon },
							["@text"] = { fg = cp.text },

							["@function.builtin.bash"] = { fg = cp.red, style = { "italic" } },
							["@parameter.bash"] = { fg = cp.yellow, style = { "italic" } },

							["@field.lua"] = { fg = cp.lavender },
							["@constructor.lua"] = { fg = cp.flamingo },

							["@property.typescript"] = { fg = cp.lavender, style = { "italic" } },

							["@type.css"] = { fg = cp.lavender },
							["@property.css"] = { fg = cp.yellow, style = { "italic" } },

							["@type.builtin.c"] = { fg = cp.yellow, style = {} },

							["@property.cpp"] = { fg = cp.text },
							["@type.builtin.cpp"] = { fg = cp.yellow, style = {} },

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
					aerial = false,
					barbar = false,
					beacon = false,
					bufferline = true,
					cmp = true,
					dap = { enabled = true, enable_ui = true },
					fern = false,
					fidget = true,
					gitgutter = false,
					gitsigns = true,
					harpoon = false,
					illuminate = false,
					indent_blankline = { enabled = true, colored_indent_levels = false },
					leap = true,
					lightspeed = false,
					lsp_saga = true,
					lsp_trouble = true,
					markdown = true,
					mason = true,
					mini = false,
					navic = { enabled = false },
					neogit = false,
					neotest = false,
					neotree = { enabled = false, show_root = true, transparent_panel = false },
					noice = true,
					notify = true,
					nvimtree = true,
					overseer = false,
					pounce = false,
					semantic_tokens = false,
					symbols_outline = false,
					telekasten = false,
					telescope = true,
					treesitter_context = true,
					ts_rainbow = true,
					vimwiki = false,
					which_key = false,
						-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
		})

		-- setup must be called before loading
		vim.cmd.colorscheme "catppuccin"
	end
}