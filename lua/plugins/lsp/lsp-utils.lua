local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

M.setup = function()
	vim.diagnostic.config({
		virtual_text = { prefix = "", source = "always" },
		float = {
			focusable = true,
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
		signs = true,
		underline = true,
		update_in_insert = false,
		severity_sort = true,
	})

	-- ---- sign column
	-- local signs = require("config.utils").lsp_signs

	-- for type, icon in pairs(signs) do
	-- 	local hl = "DiagnosticSign" .. type
	-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	-- end
end

M.on_attach = function(client, bufnr)
		require("lsp_signature").on_attach({
			bind = true,
			use_lspsaga = true,
			floating_window = true,
			fix_pos = true,
			hint_enable = true,
			hi_parameter = "Search",
			handler_opts = {
				border = "rounded",
			},
		})

	-- Enable inlay hints
	-- if client.server_capabilities["documentSymbolProvider"] then
  --     require("nvim-navic").attach(client, bufnr)
  -- end

	-- 	vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
	-- 		vim.api.nvim_create_autocmd("LspAttach", {
	-- 			group = "LspAttach_inlayhints",
	-- 			callback = function(args)
	-- 				if not (args.data and args.data.client_id) then
	-- 					return
	-- 				end

	-- 				local bufnr = args.buf
	-- 				local client = vim.lsp.get_client_by_id(args.data.client_id)
	-- 				require("lsp-inlayhints").on_attach(client, bufnr)
	-- 			end,
	-- 		})
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- show diagnostics in hover window
	-- vim.api.nvim_create_autocmd("CursorHold", {
	-- 	buffer = bufnr,
	-- 	callback = function()
	-- 		local opts = {
	-- 			focusable = false,
	-- 			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
	-- 			border = "rounded",
	-- 			source = "always",
	-- 			prefix = " ",
	-- 			scope = "cursor",
	-- 		}
	-- 		vim.diagnostic.open_float(nil, opts)
	-- 	end,
	-- })
end

return M
