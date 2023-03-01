-- https://github.com/rcarriga/nvim-notify
return {
	"rcarriga/nvim-notify",
	-- event = "BufWinEnter",
	-- lazy = false,
	-- priority = 90,
	enabled = false,
	config = function()
		local notify = require("notify")
		notify.setup({
			stages = "slide",
      fps = 120,
			timeout = 1500,
			icons = {
				ERROR = " ",
				WARNING = " ",
				INFO = " ",
				HINT = " ",
			},
		})
	end,

}