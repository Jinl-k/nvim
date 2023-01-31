return 	{
			"theHamsta/nvim-dap-virtual-text",
			event = { "UIEnter"},
			config = function()
					require("nvim-dap-virtual-text").setup()
			end
		}