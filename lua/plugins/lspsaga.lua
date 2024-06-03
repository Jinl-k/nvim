-- https://github.com/glepnir/lspsaga.nvim/
local opt = { noremap = true, silent = true }
return {
	'glepnir/lspsaga.nvim',
	event = "LspAttach",
	enabled = false,
	dependencies = {
		'nvim-tree/nvim-web-devicons',
		"nvim-treesitter/nvim-treesitter"
	},
	keys = {
		{ "gh",         "<cmd>Lspsaga finder<CR>",               mode = { "n" }, opt, desc = "Lspsaga finder" },
		{ "ga",         "<cmd>Lspsaga code_action<CR>",          mode = { "n" }, opt, desc = "code_actions" },
		{ "<leader>gd", "<cmd>Lspsaga peek_definition<CR>",      mode = { "n" }, opt, desc = "peek_definition" },
		{ "<leader>gt", "<cmd>Lspsaga peek_type_definition<CR>", mode = { "n" }, opt, desc = "peek_type_definition" },
		{ "<leader>ga", "<cmd>Lspsaga rename<CR>",               mode = { "n" }, opt, desc = "rename" },
		-- { "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", mode = { "n" }, opt,desc = "show_line_diag" },
		{ "[e",         "<cmd>Lspsaga diagnostic_jump_prev<CR>", mode = { "n" }, opt, desc = "diagnostic_jump_prev" },
		{ "]e",         "<cmd>Lspsaga diagnostic_jump_next<CR>", mode = { "n" }, opt, desc = "diagnostic_jump_next<CR>" },
		-- -- Diagnostic jump with filter like Only jump to error
		{
			"[E",
			function()
				require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
			end,
			mode = { "n" },
		},
		{
			"]E",
			function()
				require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
			end,
			mode = { "n" }
		},
		-- { "n", "<leader>L", "<cmd>Lspsaga outline<CR>", opt,desc = "Find Plugin File" },

	},
	opts = {
		code_action = {
			num_shortcut = true,
			show_server_name = true,
			extend_gitsigns = true,
			keys = {
				quit = "q",
				exec = "<CR>",
			},
		},
		definition = {
			edit = "<C-c>o",
			vsplit = "<C-c>v",
			split = "<C-c>s",
			tabe = "<C-c>t",
			quit = "q",
			close = "<Esc>",
		},
		implement = {
			enable = false,
			sign = true,
			virtual_text = false,
			priority = 100,
		},
		diagnostic = {
			show_code_action = false,
			jump_num_shortcut = true,
			text_hl_follow = true,
			border_follow = true,
			keys = {
				exec_action = "<CR>",
				quit = "q",
				quit_in_show = { "q", "<Esc>" },
			},
		},
		finder = {
			default = 'tyd+ref+imp+def',
			keys = {
				shuttle = '[w',
				close = '<Esc>'
			},
			silent = true
		},
		lightbulb = {
			enable = false,
		},
		request_timeout = 2000,
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
		rename = {
			in_select = false,
			quit = "<Esc>",
			exec = "<CR>",
			select = "x",
			whole_project = false,
		},
		symbol_in_winbar = {
			enable = false,
		},
		ui = {
			border = "rounded", -- Can be single, double, rounded, solid, shadow.
			title = true,
			devicon = true,
			winblend = 50,
			expand = "",
			collapse = "",
			preview = "󰱫",
			code_action = "󰏫",
			diagnostic = "",
			incoming = "",
			outgoing = "",
			hover = '',
		},
		scroll_preview = {
			scroll_down = "<C-j>",
			scroll_up = "<C-k>",
		},
	},
	-- config = function(opts)
	-- 	require('lspsaga').setup(opts)
	-- end,

}
