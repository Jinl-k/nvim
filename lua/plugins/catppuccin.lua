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

		-- local float_bg = cp.base
		-- local remaps = {
		-- 	NormalFloat = { bg = float_bg }, -- NOTE: catppuccin needs a bg colour
		-- 	CursorLine = { bg = ucolors.darken(cp.surface0, 0.64, cp.base) },
		-- 	ColorColumn = { link = "CursorLine" },
		-- 	WhichKeyFloat = { link = "NormalFloat" },
		-- 	CmpItemMenu = { fg = cp.surface2 },
		-- 	Pmenu = { bg = cp.surface0 },
		-- 	WinBar = { bg = float_bg },
		-- 	WinBarNC = { bg = float_bg },
		-- 	WinBarModified = { fg = cp.yellow, bg = float_bg }, -- same as BufferCurrentMod
		-- 	NavicIconsFileNC = { fg = cp.flamingo, bg = float_bg },
		-- }
		-- local telescope_results = cp.base
		-- -- local telescope_prompt = cp.surface0
		-- local telescope_prompt = "#302D41" -- black3 from original palette
		-- local fg = cp.surface2
		-- local purple = cp.green -- or mauve
		-- remaps = vim.tbl_extend("force", remaps, {
		-- 	TelescopeBorder = { fg = telescope_results, bg = telescope_results },
		-- 	TelescopePromptBorder = { fg = telescope_prompt, bg = telescope_prompt },
		-- 	TelescopePromptCounter = { fg = fg },
		-- 	TelescopePromptNormal = { fg = fg, bg = telescope_prompt },
		-- 	TelescopePromptPrefix = { fg = purple, bg = telescope_prompt },
		-- 	TelescopePromptTitle = { fg = telescope_prompt, bg = purple },
		-- 	TelescopePreviewTitle = { fg = telescope_prompt, bg = purple },
		-- 	TelescopeResultsTitle = { fg = telescope_results, bg = telescope_results },
		-- 	TelescopeMatching = { fg = purple },
		-- 	TelescopeNormal = { bg = telescope_results },
		-- 	TelescopeSelection = { bg = telescope_prompt },
		-- })
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
							-- surface1 = "#575268",
							-- surface0 = "#8BBDE7",

							base = "#1E1E2E",
							mantle = "#1A1826",
							crust = "#161320",
						},
				},
				custom_highlights = function(colors)
						return {
							-- NeoTreeStatusLineNC = { fg = colors.green, bg =colors.green  },
								-- Comment = { fg = colors.flamingo },
								-- ["@constant.builtin"] = { fg = colors.peach, style = {} },
								-- ["@comment"] = { fg = colors.surface2, style = { "italic" } },
						}
				end,
				highlight_overrides = {
					mocha = function(cp)
						return {
							-- For base configs.
							LspInlayHint = { bg = cp.none, fg = "#474A5C" },
							NormalFloat = { fg = cp.text, bg = transparent_background and cp.none},
							CursorLineNr = { fg = cp.blue},
							Search = { bg = cp.surface1, fg = cp.pink, style = { "bold" } },
							IncSearch = { bg = cp.pink, fg = cp.surface1 },
							Keyword = { fg = cp.pink },
							Type = { fg = cp.blue },
							Typedef = { fg = cp.yellow },
							StorageClass = { fg = cp.red, style = { "italic" } },

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

							-- For fidget.
							FidgetTask = { bg = cp.none, fg = cp.surface2 },
							FidgetTitle = { fg = cp.blue, style = { "bold" } },

							-- For trouble.nvim
							TroubleNormal = { bg = cp.none },

							-- -- For treesitter.
							["@field"] = { fg = cp.rosewater },
							["@property"] = { fg = cp.yellow },

							["@include"] = { fg = cp.teal },
							-- ["@operator"] = { fg = cp.sky },
							["@keyword.operator"] = { fg = cp.sky },
							["@punctuation.special"] = { fg = cp.maroon },

							-- ["@float"] = { fg = cp.peach },
							-- ["@number"] = { fg = cp.peach },
							-- ["@boolean"] = { fg = cp.peach },

							["@constructor"] = { fg = cp.lavender },
							-- ["@constant"] = { fg = cp.peach },
							-- ["@conditional"] = { fg = cp.mauve },
							-- ["@repeat"] = { fg = cp.mauve },
							["@exception"] = { fg = cp.peach },

							["@constant.builtin"] = { fg = cp.lavender },
							["@function.builtin"] = { fg = cp.peach, style = { "italic" } },
							["@type.builtin"] = { fg = cp.yellow, style = { "italic" } },
							["@type.qualifier"] = { link = "@keyword" },
							["@variable.builtin"] = { fg = cp.red, style = { "italic" } },

							-- ["@function"] = { fg = cp.blue },
							-- ["@function.macro"] = { fg = cp.red, style = {} },
							-- -- ["@parameter"] = { fg = cp.rosewater },
							["@keyword"] = { fg = cp.red, style = { "italic" } },
							["@keyword.function"] = { fg = cp.maroon },
							["@keyword.return"] = { fg = cp.pink, style = {} },

							-- -- ["@text.note"] = { fg = cp.base, bg = cp.blue },
							-- -- ["@text.warning"] = { fg = cp.base, bg = cp.yellow },
							-- -- ["@text.danger"] = { fg = cp.base, bg = cp.red },
							-- -- ["@constant.macro"] = { fg = cp.mauve },

							-- -- ["@label"] = { fg = cp.blue },
							-- ["@method"] = { fg = cp.blue, style = { "italic" } },
							-- ["@namespace"] = { fg = cp.rosewater, style = {} },

							-- ["@punctuation.delimiter"] = { fg = cp.teal },
							-- ["@punctuation.bracket"] = { fg = cp.overlay2 },
							-- -- ["@string"] = { fg = cp.green },
							-- -- ["@string.regex"] = { fg = cp.peach },
							-- ["@type"] = { fg = cp.yellow },
							-- ["@variable"] = { fg = cp.text },
							-- ["@tag.attribute"] = { fg = cp.mauve, style = { "italic" } },
							-- ["@tag"] = { fg = cp.peach },
							-- ["@tag.delimiter"] = { fg = cp.maroon },
							-- ["@text"] = { fg = cp.text },

							-- -- ["@text.uri"] = { fg = cp.rosewater, style = { "italic", "underline" } },
							-- -- ["@text.literal"] = { fg = cp.teal, style = { "italic" } },
							-- -- ["@text.reference"] = { fg = cp.lavender, style = { "bold" } },
							-- -- ["@text.title"] = { fg = cp.blue, style = { "bold" } },
							-- -- ["@text.emphasis"] = { fg = cp.maroon, style = { "italic" } },
							-- -- ["@text.strong"] = { fg = cp.maroon, style = { "bold" } },
							-- -- ["@string.escape"] = { fg = cp.pink },

							-- -- ["@property.toml"] = { fg = cp.blue },
							-- -- ["@field.yaml"] = { fg = cp.blue },

							-- -- ["@label.json"] = { fg = cp.blue },

							-- ["@function.builtin.bash"] = { fg = cp.red, style = { "italic" } },
							-- ["@parameter.bash"] = { fg = cp.yellow, style = { "italic" } },

							-- ["@field.lua"] = { fg = cp.lavender },
							-- ["@constructor.lua"] = { fg = cp.flamingo },

							["@property.typescript"] = { fg = cp.lavender, style = { "italic" } },
							["@constructor.typescript"] = { fg = cp.lavender },

							["@constructor.tsx"] = { fg = cp.lavender },
							["@tag.attribute.tsx"] = { fg = cp.mauve },

							["@type.css"] = { fg = cp.lavender },
							["@property.css"] = { fg = cp.yellow, style = { "italic" } },

							["@type.builtin.c"] = { fg = cp.yellow, style = {} },

							["@property.cpp"] = { fg = cp.text },
							["@type.builtin.cpp"] = { fg = cp.yellow, style = {} },

							-- ["@symbol"] = { fg = cp.flamingo },
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
					indent_blankline = { enabled = false, colored_indent_levels = false },
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
					noice = false,
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
					vim_sneak = false,
					vimwiki = false,
					which_key = false,
						-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
		})

		-- setup must be called before loading
		vim.cmd.colorscheme "catppuccin"
	end
}