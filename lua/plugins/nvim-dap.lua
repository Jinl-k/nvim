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

-- local exts = {
--   'javascript',
--   'typescript',
--   'javascriptreact',
--   'typescriptreact',
--   'vue',
--   'svelte',
-- }

-- for i, ext in ipairs(exts) do
--   dap.configurations[ext] = {
--     {
--       type = 'pwa-node',
--       request = 'launch',
--       name = 'Launch Current File (pwa-node)',
--       cwd = vim.fn.getcwd(),
--       args = { '${file}' },
--       sourceMaps = true,
--       protocol = 'inspector',
--     },
--     {
--       type = 'pwa-node',
--       request = 'launch',
--       name = 'Launch Current File (pwa-node with ts-node)',
--       cwd = vim.fn.getcwd(),
--       runtimeArgs = { '--loader', 'ts-node/esm' },
--       runtimeExecutable = 'node',
--       args = { '${file}' },
--       sourceMaps = true,
--       protocol = 'inspector',
--       skipFiles = { '<node_internals>/**', 'node_modules/**' },
--       resolveSourceMapLocations = {
--         "${workspaceFolder}/**",
--         "!**/node_modules/**",
--       },
--     },
--     {
--       type = 'pwa-node',
--       request = 'launch',
--       name = 'Launch Current File (pwa-node with deno)',
--       cwd = vim.fn.getcwd(),
--       runtimeArgs = { 'run', '--inspect-brk', '--allow-all', '${file}' },
--       runtimeExecutable = 'deno',
--       attachSimplePort = 9229,
--     },
--     {
--       type = 'pwa-node',
--       request = 'launch',
--       name = 'Launch Test Current File (pwa-node with jest)',
--       cwd = vim.fn.getcwd(),
--       runtimeArgs = { '${workspaceFolder}/node_modules/.bin/jest' },
--       runtimeExecutable = 'node',
--       args = { '${file}', '--coverage', 'false'},
--       rootPath = '${workspaceFolder}',
--       sourceMaps = true,
--       console = 'integratedTerminal',
--       internalConsoleOptions = 'neverOpen',
--       skipFiles = { '<node_internals>/**', 'node_modules/**' },
--     },
--     {
--       type = 'pwa-node',
--       request = 'launch',
--       name = 'Launch Test Current File (pwa-node with vitest)',
--       cwd = vim.fn.getcwd(),
--       program = '${workspaceFolder}/node_modules/vitest/vitest.mjs',
--       args = { '--inspect-brk', '--threads', 'false', 'run', '${file}' },
--       autoAttachChildProcesses = true,
--       smartStep = true,
--       console = 'integratedTerminal',
--       skipFiles = { '<node_internals>/**', 'node_modules/**' },
--     },
--     {
--       type = 'pwa-node',
--       request = 'launch',
--       name = 'Launch Test Current File (pwa-node with deno)',
--       cwd = vim.fn.getcwd(),
--       runtimeArgs = { 'test', '--inspect-brk', '--allow-all', '${file}' },
--       runtimeExecutable = 'deno',
--       attachSimplePort = 9229,
--     },
--     {
--       type = 'pwa-chrome',
--       request = 'attach',
--       name = 'Attach Program (pwa-chrome = { port: 9222 })',
--       program = '${file}',
--       cwd = vim.fn.getcwd(),
--       sourceMaps = true,
--       port = 9222,
--       webRoot = '${workspaceFolder}',
--     },
--     -- {
--     --   type = 'node2',
--     --   request = 'attach',
--     --   name = 'Attach Program (Node2)',
--     --   processId = require('dap.utils').pick_process,
--     -- },
--     -- {
--     --   type = 'node2',
--     --   request = 'attach',
--     --   name = 'Attach Program (Node2 with ts-node)',
--     --   cwd = vim.fn.getcwd(),
--     --   sourceMaps = true,
--     --   skipFiles = { '<node_internals>/**' },
--     --   port = 9229,
--     -- },
--     {
--       type = 'pwa-node',
--       request = 'attach',
--       name = 'Attach Program (pwa-node)',
--       cwd = vim.fn.getcwd(),
--       processId = require('dap.utils').pick_process,
--       skipFiles = { '<node_internals>/**' },
--     },
--   }
-- end


       
