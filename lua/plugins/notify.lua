-- https://github.com/rcarriga/nvim-notify
return {
	"rcarriga/nvim-notify",
	event = "VeryLazy",
	-- priority = 90,
	-- enabled = false,
	config = function()
		local notify = require("notify")
		notify.setup({
			stages = "slide",
      fps = 120,
			timeout = 2000,
			icons = {
				ERROR = " ",
				WARNING = " ",
				INFO = " ",
				HINT = " ",
			},
		})

		local special_message = {
						-- navic
						{ 'nvim%-navic: Server ".*" does not support documentSymbols.', echo = false },
						{ '%改变', echo = false },
						{ '%加入', echo = false },
		}

		 vim.notify = setmetatable({}, {
        ---@diagnostic disable-next-line: unused-local
        __call = function(self, message, ...)
            for _, row in ipairs(special_message) do
                if message:match(row[1]) then
                    if row.echo then
                        vim.api.nvim_echo({ { message, "MoreMsg" } }, false, {})
                    end
                    return
                end
            end
            return notify(message, ...)
        end,
        __index = notify,
    })
	end,

}