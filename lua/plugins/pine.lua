return {
    'rose-pine/neovim',
    name = 'rose-pine',
		enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
				vim.o.background = 'light'
				local p = {
					gold = "#df9532",
					rose = "red",
					overlay = '#e8ccb9',
					text = '#575279'
				}
        require("rose-pine").setup({
					--- @usage 'main' | 'moon'
					dark_variant = 'moon',
					bold_vert_split = false,
					dim_nc_background = false,
					disable_background = false,
					disable_float_background = false,
					disable_italics = false,

					--  disable_float_background = true,
                    -- disable_background = true,
                    -- dim_nc_background = true,

					--- @usage string hex value or named color from rosepinetheme.com/palette
					groups = {
						-- background = '#F4EDE8',
						-- panel = '#F4EDE8',
						background = '#f2e4da',
						panel = '#f2e4da',
						
						border = 'highlight_med',
						comment = 'muted',
						link = 'iris',
						punctuation = 'subtle',

						error = 'love',
						hint = 'iris',
						info = 'foam',
						warn = 'gold',

						headings = {
							h1 = 'iris',
							h2 = 'foam',
							h3 = 'rose',
							h4 = 'gold',
							h5 = 'pine',
							h6 = 'foam',
						}
						-- or set all headings at once
						-- headings = 'subtle'
					},
					
					-- Change specific vim highlight groups
					highlight_groups = {
						-- Pmenu = { fg = p.subtle, bg = styles.float_background },
						-- PmenuSbar = { bg = '#f44336'},
						PmenuSel = { fg = "#575279", bg ="#E4A37D" },
						-- PmenuThumb = { bg = p.highlight_med },
						CursorLine = { bg = "#e8ccb9"},
						CursorLineNr = { fg = 'red'},
						Character = { fg = p.gold },
						Constant = { fg = p.gold },
						Float = { fg = p.gold },
						Number = { fg = p.gold },
						String = { fg = p.gold },
						Boolean = { fg = "red" },
						Function = { fg = "#3a3838" },
						TSFunction = { fg = "#3a3838" },
						Identifier = { fg = "#df9532" },
						Special = { fg = p.rose },
						SpecialChar = { fg = p.rose },
						['@function'] = { fg = p.rose },
						TelescopeSelection = { fg = p.text, bg = p.overlay },
						TelescopeSelectionCaret = { fg = p.rose, bg = p.overlay },
					}
				})
        vim.cmd('colorscheme rose-pine')
    end
}