-- https://github.com/windwp/nvim-autopairs
return {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
        check_ts = true,
				disable_filetype = { "TelescopePrompt" },
				ts_config = {
					lua = { "string", "source" },
					javascript = { "string", "template_string" },
					typescript = { "string", "template_string" },
				},
				fast_wrap = {
					map = "<D-e>",
					chars = { "{", "[", "(", '"', "'" },
					pattern = [=[[%'%"%>%]%)%}%,]]=],
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					check_comma = true,
					highlight = "PmenuSel",
					highlight_grey = "LineNr",
				},
    },
    config = function(_, opts)
        require("nvim-autopairs").setup(opts)
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


				local get_closing_for_line = function (line)
				local i = -1
				local clo = ''

				while true do
						i, _= string.find(line, "[%(%)%{%}%[%]]", i + 1)
						if i == nil then break end
						local ch = string.sub(line, i, i)
						local st = string.sub(clo, 1, 1)

						if ch == '{' then
							clo = '}' .. clo
						elseif ch == '}' then
							if st ~= '}' then return '' end
							clo = string.sub(clo, 2)
						elseif ch == '(' then
							clo = ')' .. clo
						elseif ch == ')' then
							if st ~= ')' then return '' end
							clo = string.sub(clo, 2)
						elseif ch == '[' then
							clo = ']' .. clo
						elseif ch == ']' then
							if st ~= ']' then return '' end
							clo = string.sub(clo, 2)
						end
					end

					return clo
				end

				local autopairs = require('nvim-autopairs')
				local Rule   = require'nvim-autopairs.rule'
				autopairs.remove_rule('(')
				autopairs.remove_rule('{')
				autopairs.remove_rule('[')

				autopairs.add_rule(Rule("[%(%{%[]", "")
					:use_regex(true)
					:replace_endpair(function(opts)
						return get_closing_for_line(opts.line)
					end)
					:end_wise(function(opts)
						-- Do not endwise if there is no closing
						return get_closing_for_line(opts.line) ~= ""
					end))


				Rule('%(.*%)%s*%=>$', ' {  }', { 'typescript', 'typescriptreact', 'javascript' })
				:use_regex(true)
				:set_end_pair_length(2)


    end
}
