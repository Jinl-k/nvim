local M = {}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

M.capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

M.setup = function()
	vim.diagnostic.config({
		virtual_text = { prefix = "●", source = "always" },
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
		update_in_insert = true,
		severity_sort = false,
	})

	---- sign column
	local signs = require("utils").lsp_signs

	for type, icon in pairs(signs) do
		local hl = "DiagnosticSign" .. type
		vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
	end
end

M.on_attach = function(client, bufnr)
		require("lsp_signature").on_attach({
			bind = true,
			use_lspsaga = false,
			floating_window = true,
			fix_pos = true,
			hint_enable = true,
			hi_parameter = "Search",
			handler_opts = {
				border = "rounded",
			},
		})
	-- Enable inlay hints
	if client.server_capabilities["documentSymbolProvider"] then
      require("nvim-navic").attach(client, bufnr)
  end

		vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
			vim.api.nvim_create_autocmd("LspAttach", {
				group = "LspAttach_inlayhints",
				callback = function(args)
					if not (args.data and args.data.client_id) then
						return
					end

					local bufnr = args.buf
					local client = vim.lsp.get_client_by_id(args.data.client_id)
					require("lsp-inlayhints").on_attach(client, bufnr)
				end,
			})
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- local wk = require("which-key")
	-- -- Mappings.
	--  wk.register({
	-- 	["<leader>g"] = {
	-- 		name = "LSP",
	-- 		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
	-- 		d = { "<cmd>Telescope lsp_definitions<cr>", "Definition" },
	-- 		D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
	-- 		i = { "<cmd>Telescope lsp_implementations<cr>", "Implementation" },
	-- 		k = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
	-- 		K = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
	-- 		l = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", "Line Diagnostics" },
	-- 		L = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Location List" },
	-- 		n = { "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", "Next Diagnostic" },
	-- 		p = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Previous Diagnostic" },
	-- 		q = { "<cmd>lua vim.lsp.diagnostic.set_qflist()<cr>", "Quick Fix List" },
	-- 		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
	-- 		R = { "<cmd>Telescope lsp_references<cr>", "References" },
	-- 		s = { "<cmd>lua vim.lsp.buf.document_symbol()<cr>", "Document Symbols" },
	-- 		S = { "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", "Workspace Symbols" },
	-- 		t = { "<cmd>Telescope lsp_type_definitions<cr>", "Type Definition" },
	-- 	}
	--  })



	-- See `:help vim.lsp.*` for documentation on any of the below functions
	-- local bufopts = { noremap = true, silent = true, buffer = bufnr }
	-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	-- vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", bufopts)
	-- vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", bufopts)
	-- vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<cr>", bufopts)
	-- vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", bufopts)
	-- vim.keymap.set("n", "<leader>K", vim.lsp.buf.hover, bufopts)
	-- vim.keymap.set("n", "<leader>k", vim.lsp.buf.signature_help, bufopts)
	-- vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	-- vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	-- vim.keymap.set("n", "<leader>wl", function()
	-- 	print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	-- end, bufopts)
	-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)

	
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
