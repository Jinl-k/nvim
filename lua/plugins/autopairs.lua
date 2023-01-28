-- local autopairs = prequire("nvim-autopairs")
-- if not (autopairs) then return end

-- autopairs.setup {}

-- require("nvim-autopairs.completion.cmp").setup({
--   map_cr = false, --  map <CR> on insert mode
--   map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
--   auto_select = true, -- automatically select the first item
--   insert = false, -- use insert confirm behavior instead of replace
--   map_char = { -- modifies the function or method delimiter by filetypes
--     all = '(',
--     tex = '{'
--   }
-- })


local M = {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {
        check_ts = true,
				disable_filetype = { "TelescopePrompt" },
				ts_config = {
					lua = { "string", "source" },
					javascript = { "string", "template_string" },
					java = false,
				},
				fast_wrap = {
					map = "<M-e>",
					chars = { "{", "[", "(", '"', "'" },
					pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
					offset = 0, -- Offset from pattern match
					end_key = "$",
					keys = "qwertyuiopzxcvbnmasdfghjkl",
					check_comma = true,
					highlight = "PmenuSel",
					highlight_grey = "LineNr",
				},
    },
    config = function(_, opts)
        require("nvim-autopairs").setup(opts)
        --- setup for cmp
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        local cmp_status_ok, cmp = pcall(require, "cmp")
        if not cmp_status_ok then
            return
        end
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
}

return M
