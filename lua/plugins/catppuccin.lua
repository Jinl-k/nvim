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

		local float_bg = cp.base
		local remaps = {
			NormalFloat = { bg = float_bg }, -- NOTE: catppuccin needs a bg colour
			CursorLine = { bg = ucolors.darken(cp.surface0, 0.64, cp.base) },
			ColorColumn = { link = "CursorLine" },
			WhichKeyFloat = { link = "NormalFloat" },
			SpellBad = { fg = cp.red, style = { "italic", "undercurl" } },
			SpellCap = { fg = cp.red, style = { "italic", "undercurl" } },
			SpellLocal = { fg = cp.red, style = { "italic", "undercurl" } },
			SpellRare = { fg = cp.red, style = { "italic", "undercurl" } },
			CmpItemMenu = { fg = cp.surface2 },
			Pmenu = { bg = cp.surface0 },
			WinBar = { bg = float_bg },
			WinBarNC = { bg = float_bg },
			WinBarModified = { fg = cp.yellow, bg = float_bg }, -- same as BufferCurrentMod
			NavicIconsFileNC = { fg = cp.flamingo, bg = float_bg },
			-- VertSplit = { fg = cp.overlay1 },
			-- SpellBad = { fg = cp.maroon },
			-- SpellCap = { fg = cp.peach },
			-- SpellLocal = { fg = cp.lavender },
			-- SpellRare = { fg = cp.teal },
		}
		local telescope_results = cp.base
		-- local telescope_prompt = cp.surface0
		local telescope_prompt = "#302D41" -- black3 from original palette
		local fg = cp.surface2
		local purple = cp.green -- or mauve
		remaps = vim.tbl_extend("force", remaps, {
			TelescopeBorder = { fg = telescope_results, bg = telescope_results },
			TelescopePromptBorder = { fg = telescope_prompt, bg = telescope_prompt },
			TelescopePromptCounter = { fg = fg },
			TelescopePromptNormal = { fg = fg, bg = telescope_prompt },
			TelescopePromptPrefix = { fg = purple, bg = telescope_prompt },
			TelescopePromptTitle = { fg = telescope_prompt, bg = purple },
			TelescopePreviewTitle = { fg = telescope_prompt, bg = purple },
			TelescopeResultsTitle = { fg = telescope_results, bg = telescope_results },
			TelescopeMatching = { fg = purple },
			TelescopeNormal = { bg = telescope_results },
			TelescopeSelection = { bg = telescope_prompt },
		})
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
						conditionals = { "italic" },
						loops = {},
						functions = {},
						keywords = {},
						strings = {},
						variables = {},
						numbers = {},
						booleans = {},
						properties = {},
						types = {},
						operators = {},
				},
				color_overrides = {
					-- NeoTreeVertSplit = { fg = "#ffffff" },
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
					all = function(cp)
						return {
							-- For lspsaga.nvim
							-- SagaBeacon = { bg = cp.surface0 },
						}
					end,
					mocha = function(cp)
						return {
							-- For base configs.
							NormalFloat = { fg = cp.text, bg = transparent_background and cp.none},
							CursorLineNr = { fg = cp.green },
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
							TroubleNormal = { fg = cp.text, bg = cp.none },

							-- For treesitter.
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
							-- ["@function.builtin"] = { fg = cp.peach, style = { "italic" } },
							-- ["@type.builtin"] = { fg = cp.yellow, style = { "italic" } },
							["@type.qualifier"] = { link = "@keyword" },
							["@variable.builtin"] = { fg = cp.red, style = { "italic" } },

							-- ["@function"] = { fg = cp.blue },
							["@function.macro"] = { fg = cp.red, style = {} },
							["@parameter"] = { fg = cp.rosewater },
							["@keyword"] = { fg = cp.red, style = { "italic" } },
							["@keyword.function"] = { fg = cp.maroon },
							["@keyword.return"] = { fg = cp.pink, style = {} },

							-- ["@text.note"] = { fg = cp.base, bg = cp.blue },
							-- ["@text.warning"] = { fg = cp.base, bg = cp.yellow },
							-- ["@text.danger"] = { fg = cp.base, bg = cp.red },
							-- ["@constant.macro"] = { fg = cp.mauve },

							-- ["@label"] = { fg = cp.blue },
							["@method"] = { fg = cp.blue, style = { "italic" } },
							["@namespace"] = { fg = cp.rosewater, style = {} },

							["@punctuation.delimiter"] = { fg = cp.teal },
							["@punctuation.bracket"] = { fg = cp.overlay2 },
							-- ["@string"] = { fg = cp.green },
							-- ["@string.regex"] = { fg = cp.peach },
							["@type"] = { fg = cp.yellow },
							["@variable"] = { fg = cp.text },
							["@tag.attribute"] = { fg = cp.mauve, style = { "italic" } },
							["@tag"] = { fg = cp.peach },
							["@tag.delimiter"] = { fg = cp.maroon },
							["@text"] = { fg = cp.text },

							-- ["@text.uri"] = { fg = cp.rosewater, style = { "italic", "underline" } },
							-- ["@text.literal"] = { fg = cp.teal, style = { "italic" } },
							-- ["@text.reference"] = { fg = cp.lavender, style = { "bold" } },
							-- ["@text.title"] = { fg = cp.blue, style = { "bold" } },
							-- ["@text.emphasis"] = { fg = cp.maroon, style = { "italic" } },
							-- ["@text.strong"] = { fg = cp.maroon, style = { "bold" } },
							-- ["@string.escape"] = { fg = cp.pink },

							-- ["@property.toml"] = { fg = cp.blue },
							-- ["@field.yaml"] = { fg = cp.blue },

							-- ["@label.json"] = { fg = cp.blue },

							["@function.builtin.bash"] = { fg = cp.red, style = { "italic" } },
							["@parameter.bash"] = { fg = cp.yellow, style = { "italic" } },

							["@field.lua"] = { fg = cp.lavender },
							["@constructor.lua"] = { fg = cp.flamingo },

							["@constant.java"] = { fg = cp.teal },

							["@property.typescript"] = { fg = cp.lavender, style = { "italic" } },
							-- ["@constructor.typescript"] = { fg = cp.lavender },

							-- ["@constructor.tsx"] = { fg = cp.lavender },
							-- ["@tag.attribute.tsx"] = { fg = cp.mauve },

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
						bufferline = true,
						mason = true,
						cmp = true,
						lsp_saga = true,
       			lsp_trouble = true,
						gitsigns = true,
						nvimtree = true,
						telescope = true,
						notify = false,
						mini = false,
						leap = true,
						which_key = true,
						neotree = {
							enabled = true,
							show_root = false,
							transparent_panel = true,
						},
						neogit = false,
        		neotest = false,
						ts_rainbow = true,
						treesitter = true,
						treesitter_context = true,
						barbecue = {
            	dim_dirname = true,
						},
						dap = {
								enabled = true,
								enable_ui = true,
						},
						indent_blankline = {
								enabled = true,
								-- colored_indent_levels = false,
						},
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
						navic = {
								enabled = false,
								custom_bg = "NONE",
						},

						-- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
				},
		})

		-- setup must be called before loading
		vim.cmd.colorscheme "catppuccin"
	end
}