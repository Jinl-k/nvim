-- https://github.com/AndrewRadev/switch.vim
-- https://github.com/rmagatti/alternate-toggler
return{

		'rmagatti/alternate-toggler',
		event =  "BufReadPost" , 
		config = function()
			require("alternate-toggler").setup {
				alternates = {
					["true"] = "false",
					["True"] = "False",
					["TRUE"] = "FALSE",
					["Yes"] = "No",
					["yes"] = "no",
					["YES"] = "NO",
					["disable"] = "enable",
					["disabled"] = "enabled",
					["1"] = "0",
					["<"] = ">",
					["("] = ")",
					["["] = "]",
					["{"] = "}",
					['"'] = "'",
					['""'] = "''",
					["+"] = "-",
					["==="] = "!==",
					["=="] = "!=",
				}
			}
			
			vim.keymap.set("n","gs", "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>")
		end,
 


		-- "AndrewRadev/switch.vim",
    -- opts = true,
		-- event = "VeryLazy",
    -- config = function()
     
		-- 	 word_antisense_switch = {
    --     { "true", "false" },
    --     { "on", "off" },
    --     { "yes", "no" },
    --     { "disable", "enable" },
    --     { "enabled", "disabled" },
    --     { "success", "failure" },
    --     { "open", "close" },
    --     { "in", "out" },
    --     { "resolve", "reject" },
    --     { "start", "end" },
    --     { "before", "after" },
    --     { "from", "to" },
    --     { "relative", "absolute" },
    --     { "up", "down" },
    --     { "left", "right" },
    --     { "top", "bottom" },
    --     { "first", "last" },
    --     { "next", "prev" },
    --     { "row", "column" },
    --     { "dark", "light" },
    --     { "inferior", "superior" },
    --     { "lower", "upper" },
    --     { "selected", "unselected" },
    --     { "active", "inactive" },
    --     { "white", "black" },
    --     { "get", "post" },
    --     { "forward", "backward" },
    --     { "odd", "even" },
    --     { "+", "-" },
    --     { ">", "<" },
    --     { "=", "!=" },
		-- 		{ "==", "!==" },
		-- 		{ "1", "0" }
    -- 	}

		-- 	variable_style_switch = {
		-- 			{
		-- 					["\\<[a-z0-9]\\+_\\k\\+\\>"] = {
		-- 							["_\\(.\\)"] = "\\U\\1",
		-- 					},
		-- 			},
		-- 			{
		-- 					["\\<[a-z0-9]\\+[A-Z]\\k\\+\\>"] = {
		-- 							["\\([A-Z]\\)"] = "_\\l\\1",
		-- 					},
		-- 			},
		-- 	}

		-- 	function str_title(s)
		-- 			return (s:gsub("(%a)([%w_']*)", function(f, r)
		-- 					return f:upper() .. r:lower()
		-- 			end))
		-- 	end
			
		-- 	local put_words = vim.deepcopy(word_antisense_switch)
		-- 	for _, value in ipairs(word_antisense_switch) do
		-- 			local upper_words = { string.upper(value[1]), string.upper(value[2]) }
		-- 			local title_words = { str_title(value[1]), str_title(value[2]) }
		-- 			table.insert(put_words, upper_words)
		-- 			table.insert(put_words, title_words)
		-- 	end

		-- 	vim.g.switch_custom_definitions = put_words
		-- 	vim.g.variable_style_switch_definitions = variable_style_switch
		-- 	vim.keymap.set('n', 'gs',":Switch<cr>", { silent = true },{description = "Switch the opposite meaning of the word"})
		-- 	vim.keymap.set('n', 'gS',
		-- 				function()
    --             vim.fn["switch#Switch"]({ definitions = vim.g.variable_style_switch_definitions })
    --         end, { silent = true },{ description = "Switch variable naming style"})
    -- end,
}