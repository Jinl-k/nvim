
-- https://github.com/glepnir/lspsaga.nvim/
return {
    'glepnir/lspsaga.nvim',
		-- enabled = false,
    event = 'BufRead',
		dependencies = { {'nvim-tree/nvim-web-devicons'} },
    config = function()
				local function set_sidebar_icons()
					-- Set icons for sidebar.
					local diagnostic_icons = {
						  Error = "",
							Warn = "",
							Info = "ﬤ",
							Hint = "",
					}
					for type, icon in pairs(diagnostic_icons) do
						local hl = "DiagnosticSign" .. type
						vim.fn.sign_define(hl, { text = icon, texthl = hl })
					end
				end
				set_sidebar_icons()

        require('lspsaga').setup({
					preview = {
						lines_above = 1,
						lines_below = 12,
					},
					scroll_preview = {
						scroll_down = "<C-j>",
						scroll_up = "<C-k>",
					},
					request_timeout = 2000,
					finder = {
						edit = { "o", "<CR>" },
						vsplit = "s",
						split = "i",
						tabe = "t",
						quit = { "q", "<ESC>" },
					},
					definition = {
						edit = "<C-c>o",
						vsplit = "<C-c>v",
						split = "<C-c>s",
						tabe = "<C-c>t",
						quit = "q",
						close = "<Esc>",
					},
					-- code_action = {
					-- 	num_shortcut = true,
					-- 	keys = {
					-- 		quit = "q",
					-- 		exec = "<CR>",
					-- 	},
					-- },
					-- lightbulb = {
					-- 	enable = false,
					-- 	sign = true,
					-- 	enable_in_insert = true,
					-- 	sign_priority = 20,
					-- 	virtual_text = true,
					-- },
					diagnostic = {
						twice_into = false,
						show_code_action = true,
						show_source = true,
						keys = {
							exec_action = "<CR>",
							quit = "q",
							go_action = "g",
						},
					},
					rename = {
						quit = "<Esc>",
						exec = "<CR>",
						mark = "x",
						confirm = "<CR>",
						whole_project = false,
						in_select = true,
					},
					outline = {
						win_position = "right",
						win_with = "_sagaoutline",
						win_width = 30,
						show_detail = true,
						auto_preview = true,
						auto_refresh = true,
						auto_close = true,
						keys = {
							jump = "<CR>",
							expand_collapse = "u",
							quit = "q",
						},
					},
					symbol_in_winbar = {
						in_custom = true,
						enable = true,
						separator = "  ",
						hide_keyword = false,
						show_file = true,
						color_mode = true,
					},
					ui = {
						theme = "round",
						border = "rounded", -- Can be single, double, rounded, solid, shadow.
						 -- this option only work in neovim 0.9
   				  -- title = true,
						winblend = 0,
						expand = "",
						collapse = "",
						preview = "",
						code_action = "",
						diagnostic = "",
						incoming = "",
						outgoing = "",
						colors = {
							normal_bg = "#313445",
							title_bg = "#313445",
							-- red = "#E95678",
							-- megenta = "#B33076",
							red = "#96CDFB",
							megenta = "#96CDFB",
							orange = "#FAB387", 
							yellow = "#F7BB3B",
							green = "#AFD700",
							-- cyan = "#36D0E0",
							cyan = "#FAB387",
							blue = "#61AFEF",
							purple = "#CBA6F7",
							white = "#F2F2BF",
							black = "#1C1C19",
							fg = "#F2F2BF",
						},
						-- kind = {
						-- 	Text = "  ",
						-- 	Method = "  ",
						-- 	Function = "  ",
						-- 	Constructor = "  ",
						-- 	Field = " ﴲ ",
						-- 	Variable = "[] ",
						-- 	Class = "  ",
						-- 	Interface = " ﰮ ",
						-- 	Module = "  ",
						-- 	Property = " 襁 ",
						-- 	Unit = "  ",
						-- 	Value = "  ",
						-- 	Enum = " 練 ",
						-- 	Keyword = "  ",
						-- 	Snippet = "  ",
						-- 	Color = "  ",
						-- 	File = "  ",
						-- 	Reference = "  ",
						-- 	Folder = "  ",
						-- 	EnumMember = "  ",
						-- 	Constant = " ﲀ ",
						-- 	Struct = " ﳤ ",
						-- 	Event = "  ",
						-- 	Operator = "  ",
						-- 	Package = "",
						-- 	TypeParameter = "",
						-- 	Array = "",
						-- 	Boolean = "",
						-- 	Null = "ﳠ",
						-- 	Number = "",
						-- 	Object = "",
						-- 	String = "",
						-- 	TypeAlias = "",
						-- 	Parameter = "",
						-- 	StaticMethod = "",
						-- 	Copilot = " ",
						-- },
						-- 	-- Kind
						-- 	-- Class = { icons.kind.Class, colors.yellow },
						-- 	-- Constant = { icons.kind.Constant, colors.peach },
						-- 	-- Constructor = { icons.kind.Constructor, colors.sapphire },
						-- 	-- Enum = { icons.kind.Enum, colors.yellow },
						-- 	-- EnumMember = { icons.kind.EnumMember, colors.rosewater },
						-- 	-- Event = { icons.kind.Event, colors.yellow },
						-- 	-- Field = { icons.kind.Field, colors.teal },
						-- 	-- File = { icons.kind.File, colors.rosewater },
						-- 	-- Function = { icons.kind.Function, colors.blue },
						-- 	-- Interface = { icons.kind.Interface, colors.yellow },
						-- 	-- Key = { icons.kind.Keyword, colors.red },
						-- 	-- Method = { icons.kind.Method, colors.blue },
						-- 	-- Module = { icons.kind.Module, colors.blue },
						-- 	-- Namespace = { icons.kind.Namespace, colors.blue },
						-- 	-- Number = { icons.kind.Number, colors.peach },
						-- 	-- Operator = { icons.kind.Operator, colors.sky },
						-- 	-- Package = { icons.kind.Package, colors.blue },
						-- 	-- Property = { icons.kind.Property, colors.teal },
						-- 	-- Struct = { icons.kind.Struct, colors.yellow },
						-- 	-- TypeParameter = { icons.kind.TypeParameter, colors.maroon },
						-- 	-- Variable = { icons.kind.Variable, colors.peach },
						-- 	-- -- Type
						-- 	-- Array = { icons.type.Array, colors.peach },
						-- 	-- Boolean = { icons.type.Boolean, colors.peach },
						-- 	-- Null = { icons.type.Null, colors.yellow },
						-- 	-- Object = { icons.type.Object, colors.yellow },
						-- 	-- String = { icons.type.String, colors.green },
						-- 	-- -- ccls-specific icons.
						-- 	-- TypeAlias = { icons.kind.TypeAlias, colors.green },
						-- 	-- Parameter = { icons.kind.Parameter, colors.blue },
						-- 	-- StaticMethod = { icons.kind.StaticMethod, colors.peach },
						-- 	-- -- Microsoft-specific icons.
						-- 	-- Text = { icons.kind.Text, colors.green },
						-- 	-- Snippet = { icons.kind.Snippet, colors.mauve },
						-- 	-- Folder = { icons.kind.Folder, colors.blue },
						-- 	-- Unit = { icons.kind.Unit, colors.green },
						-- 	-- Value = { icons.kind.Value, colors.peach },
						-- },
					}
				})

    end,
    
}