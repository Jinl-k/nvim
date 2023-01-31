-- https://github.com/rcarriga/nvim-dap-ui
return {
	"rcarriga/nvim-dap-ui",
		event = { "UIEnter" },
		config = function()
				local dap, dapui = require("dap"), require("dapui")
				 -- Automatically start dapui when debugging starts
				dap.listeners.after.event_initialized["dapui_config"] = function()
						---@diagnostic disable-next-line: missing-parameter
						dapui.open()
				end
				-- Automatically close dapui and repl windows when debugging is closed
				dap.listeners.before.event_terminated["dapui_config"] = function()
						---@diagnostic disable-next-line: missing-parameter
						dapui.close()
						dap.repl.close()
				end
				-- Automatically close dapui and repl windows when debugging is closed
				dap.listeners.before.event_exited["dapui_config"] = function()
						---@diagnostic disable-next-line: missing-parameter
						dapui.close()
						dap.repl.close()
				end
				dapui.setup({
					icons = { 
						expanded = "", 
						collapsed = "", 
						current_frame = ""
					},
					mappings = {
						-- Use a table to apply multiple mappings
						expand = { "<CR>", "<2-LeftMouse>" },
						open = "o",
						remove = "d",
						edit = "e",
						repl = "r",
					},
					layouts = {
						{
							elements = {
								-- Provide as ID strings or tables with "id" and "size" keys
								{
									id = "scopes",
									size = 0.25, -- Can be float or integer > 1
								},
								{ id = "breakpoints", size = 0.25 },
								{ id = "stacks", size = 0.25 },
								{ id = "watches", size = 0.25 },
							},
							size = 35,
							position = "right",
						},
            {
                elements = {
                    "repl",
                    "console",
                },
                size = 10,
                position = "bottom",
            },
        	},
					-- controls = {
					-- 	enabled = true,
					-- 	-- Display controls in this session
					-- 	element = "repl",
					-- 	icons = {
					-- 		pause = "",
					-- 		play = "",
					-- 		step_into = "",
					-- 		step_over = "",
					-- 		step_out = "",
					-- 		step_back = "",
					-- 		run_last = "↻",
					-- 		terminate = "ﱢ",
					-- 	},
					-- },
					-- windows = { indent = 1 },
				})
				-- require("dapui").float_element("",{
				-- 		height = 10,
				-- 		width = 10,
				-- 		enter= true,
				-- }) 
		end
}




