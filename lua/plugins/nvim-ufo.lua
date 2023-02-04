-- https://github.com/kevinhwang91/nvim-ufo
return{
	'kevinhwang91/nvim-ufo', 
	dependencies = {{'kevinhwang91/promise-async'},
	{'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}},
	 event = { "VeryLazy" },
	config = function()
		function fold_virtual_text_handler(virtual_text, lnum, end_lnum, width, truncate)
				local new_virtual_text = {}
				local suffix = ("   %d"):format(end_lnum - lnum)
				local suffix_width = vim.fn.strdisplaywidth(suffix)
				local target_width = width - suffix_width
				local current_width = 0
				for _, chunk in ipairs(virtual_text) do
						local chunk_text = chunk[1]
						local chunk_width = vim.fn.strdisplaywidth(chunk_text)
						if target_width > current_width + chunk_width then
								table.insert(new_virtual_text, chunk)
						else
								chunk_text = truncate(chunk_text, target_width - current_width)
								local hlGroup = chunk[2]
								table.insert(new_virtual_text, { chunk_text, hlGroup })
								chunk_width = vim.fn.strdisplaywidth(chunk_text)
								-- str width returned from truncate() may less than 2nd argument, need padding
								if current_width + chunk_width < target_width then
										suffix = suffix .. (" "):rep(target_width - current_width - chunk_width)
								end
								break
						end
						current_width = current_width + chunk_width
				end
				table.insert(new_virtual_text, { suffix, "MoreMsg" })
				return new_virtual_text
		end
		require("ufo").setup({
				open_fold_hl_timeout = 0,
        ---@diagnostic disable-next-line: unused-local
        provider_selector = function(bufnr, filetype, buftype)
						return {'treesitter', 'indent'}
				end,
        fold_virt_text_handler = fold_virtual_text_handler,
				close_fold_kinds = {'imports', 'comment'},
				-- preview = {
				-- 		win_config = {
				-- 				border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"},
				-- 				winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
				-- 				winblend = 0
				-- 		},
				-- 		mappings = {
				-- 				scrollU = '<C-u>',
				-- 				scrollD = '<C-d>',
				-- 				jumpTop = '[',
				-- 				jumpBot = ']'
				-- 		}
				-- },
		})
	end
}