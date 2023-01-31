-- https://github.com/mfussenegger/nvim-dap
-- https://github.com/theHamsta/nvim-dap-virtual-text
return {
	"mfussenegger/nvim-dap",
  lazy = true,
	config = function()
		-- vim.api.nvim_command([[packadd nvim-dap-ui]])
		local dap = require("dap")
		local dapui = require("dapui")
		-- We need to override nvim-dap's default highlight groups, AFTER requiring nvim-dap for catppuccin.
		vim.api.nvim_set_hl(0, "DapStopped", { fg = "#ABE9B3" })
		vim.fn.sign_define(
			"DapBreakpoint",
			{ text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" }
		)
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = "ﳁ", texthl = "DapBreakpoint", linehl = "", numhl = "" }
		)
		vim.fn.sign_define("DapStopped", { text = "", texthl = "DapStopped", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = "", texthl = "DapBreakpoint", linehl = "", numhl = "" }
		)
		vim.fn.sign_define("DapLogPoint", { text = "", texthl = "DapLogPoint", linehl = "", numhl = "" })

		require("dap-vscode-js").setup({ 
				node = "node",
				debugger_path = os.getenv('HOME') .. '/.local/share/nvim/lazy/vscode-js-debug',
				-- debugger_path = os.getenv('HOME') .. '/.local/share/nvim/mason/packages/js-debug-adapter',
				adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
		})
		dap.configurations.typescript = {
			{
				type = "pwa-node",
				request = "launch",
				name = "Launch file",
				program = "${file}",
				cwd = "${workspaceFolder}",
				sourceMaps = true,
				protocol = "inspector",
				console = "integratedTerminal",
				outFiles = { "${workspaceFolder}/dist/**/*.js" },
				runtimeExecutable = 'node',
				skipFiles = { "<node_internals>/**", "node_modules/**" },
				resolveSourceMapLocations = { "${workspaceFolder}/dist/**/*.js", "${workspaceFolder}/**", "!**/node_modules/**" }
			}
		}
		dap.configurations.javascript = dap.configurations.typescript
	end
}



       
