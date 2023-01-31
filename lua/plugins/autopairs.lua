return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
		-- enabled = false,
    opts = {
        -- check_ts = true,
				-- disable_filetype = { "TelescopePrompt" },
				-- ts_config = {
				-- 	lua = { "string", "source" },
				-- 	javascript = { "string", "template_string" },
				-- 	java = false,
				-- },
				-- fast_wrap = {
				-- 	map = "<M-e>",
				-- 	chars = { "{", "[", "(", '"', "'" },
				-- 	pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
				-- 	offset = 0, -- Offset from pattern match
				-- 	end_key = "$",
				-- 	keys = "qwertyuiopzxcvbnmasdfghjkl",
				-- 	check_comma = true,
				-- 	highlight = "PmenuSel",
				-- 	highlight_grey = "LineNr",
				-- },
    },
    config = function(_, opts)
        require("nvim-autopairs").setup()
				-- If you want insert `(` after select function or method item
				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				local cmp = require("cmp")
				local handlers = require("nvim-autopairs.completion.handlers")
				cmp.event:on(
					"confirm_done",
					cmp_autopairs.on_confirm_done({
						filetypes = {
							-- "*" is an alias to all filetypes
							["*"] = {
								["("] = {
									kind = {
										cmp.lsp.CompletionItemKind.Function,
										cmp.lsp.CompletionItemKind.Method,
									},
									handler = handlers["*"],
								},
							},
							-- Disable for tex
							tex = false,
						},
					})
				)
    end,
}
