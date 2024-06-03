-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/hrsh7th/cmp-path
-- https://github.com/hrsh7th/cmp-buffer
-- https://github.com/hrsh7th/cmp-cmdline
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/saadparwaiz1/cmp_luasnip
local cmp = require("cmp")
return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-cmdline",
			"onsails/lspkind.nvim",
		},
		event = "BufRead",
		opts = function(_, opts)
			cmp.setup.cmdline({ "/", "?" }, {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{ name = "cmdline" },
				}),
			})
		end
	},
	{
		"hrsh7th/nvim-cmp",
		opts = {

			formatting = {
				fields = { "kind", "abbr", "menu" },
				format = function(entry, vim_item)
					local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 25 })(entry, vim_item)
					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = " " .. (strings[1] or "") .. " "
					kind.menu = "    (" .. (strings[2] or "") .. ")"

					return kind
				end,
			},
			window = {
				completion = cmp.config.window.bordered({
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:Search",
					-- menu position offset
					col_offset = 0,
					-- content offset
					side_padding = 0,
					winblend = 50

				}),
				documentation = cmp.config.window.bordered({
					winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:Search",
				}),
			},
			-- mapping = cmp.mapping.preset.insert({
			-- 	-- ["<CR>"] = cmp.mapping.confirm({ select = true }),
			-- 	["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
			-- 	-- ["<C-p>"] = cmp.mapping.select_prev_item(),
			-- 	-- ["<C-n>"] = cmp.mapping.select_next_item(),
			-- 	["<C-d>"] = cmp.mapping.scroll_docs(-4),
			-- 	["<C-f>"] = cmp.mapping.scroll_docs(4),
			-- 	["<C-e>"] = cmp.mapping.close(),
			-- 	["<Tab>"] = cmp.mapping(function(fallback)
			-- 		if cmp.visible() and has_words_before() then
			-- 			cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			-- 		elseif require("luasnip").expand_or_jumpable() then
			-- 			vim.fn.feedkeys(
			-- 				vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
			-- 				""
			-- 			)
			-- 		else
			-- 			fallback()
			-- 		end
			-- 	end, { "i", "s" }),
			-- 	-- ["<Tab>"] = cmp.mapping(function(fallback)
			-- 	--     if cmp.visible() then
			-- 	--       cmp.confirm({ behavior = cmp.ConfirmBehavior.Insert, select = true })
			-- 	--     elseif require("luasnip").expand_or_jumpable() then
			-- 	--       vim.fn.feedkeys(
			-- 	--         vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true),
			-- 	--         ""
			-- 	--       )
			-- 	--     else
			-- 	--       fallback()
			-- 	--     end
			-- 	--   end, { "i", "s" }),
			-- 	["<C-n>"] = cmp.mapping(function(fallback)
			-- 		if cmp.visible() then
			-- 			cmp.select_next_item()
			-- 		elseif luasnip.jumpable(1) then
			-- 			luasnip.jump(1)
			-- 		elseif has_words_before() then
			-- 			cmp.complete()
			-- 		else
			-- 			fallback()
			-- 		end
			-- 	end, { "i", "s" }),
			-- 	["<C-p>"] = cmp.mapping(function(fallback)
			-- 		if cmp.visible() then
			-- 			cmp.select_prev_item()
			-- 		elseif luasnip.jumpable(-1) then
			-- 			luasnip.jump(-1)
			-- 		else
			-- 			fallback()
			-- 		end
			-- 	end, { "i", "s" }),
			-- 	-- ["<Tab>"] = cmp.mapping(function(fallback)
			-- 	-- 	if cmp.visible() then
			-- 	-- 		cmp.select_next_item()
			-- 	-- 	elseif require("luasnip").expand_or_jumpable() then
			-- 	-- 		vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
			-- 	-- 	else
			-- 	-- 		fallback()
			-- 	-- 	end
			-- 	-- end, { "i", "s" }),
			-- 	["<S-Tab>"] = cmp.mapping(function(fallback)
			-- 		if cmp.visible() then
			-- 			cmp.select_prev_item()
			-- 		elseif require("luasnip").jumpable(-1) then
			-- 			vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
			-- 		else
			-- 			fallback()
			-- 		end
			-- 	end, { "i", "s" }),
			-- }),
		}


	}
}
