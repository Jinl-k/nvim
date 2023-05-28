-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/hrsh7th/cmp-path
-- https://github.com/hrsh7th/cmp-buffer
-- https://github.com/hrsh7th/cmp-cmdline
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/saadparwaiz1/cmp_luasnip
local M ={
    "hrsh7th/nvim-cmp",
    event = "BufReadPre",
    dependencies = {
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"onsails/lspkind.nvim" ,
			"saadparwaiz1/cmp_luasnip",
    },
    opts = function()
        local cmp = require("cmp")
				local lspkind = require("lspkind")
				local compare = require("cmp.config.compare")
				
				compare.lsp_scores = function(entry1, entry2)
					local diff
					if entry1.completion_item.score and entry2.completion_item.score then
						diff = (entry2.completion_item.score * entry2.score) - (entry1.completion_item.score * entry1.score)
					else
						diff = entry2.score - entry1.score
					end
					return (diff < 0)
				end

				-- tab 换回正常的缩进行为
				local has_words_before = function()
					if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
					local line, col = unpack(vim.api.nvim_win_get_cursor(0))
					return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
				end
		
				local icons = {
						kind = require("config.icons").get("kind", false),
						type = require("config.icons").get("type", false),
						cmp = require("config.icons").get("cmp", false),
				}

        return {
            snippet = {
                expand = function(args)
										require("luasnip").lsp_expand(args.body)
                end,
            },
            formatting = {
								fields = { "kind", "abbr", "menu" },
								format = lspkind.cmp_format({
									-- mode = 'symbol_text', -- show only symbol annotations
									-- maxwidth = 20,
      						ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
									before = function(entry, vim_item)
											local kind = lspkind.cmp_format({
												mode = "symbol_text",
												maxwidth = 20,
												symbol_map = vim.tbl_deep_extend("force", icons.kind, icons.type, icons.cmp),
											})(entry, vim_item)
											local strings = vim.split(kind.kind, "%s", { trimempty = true })
											kind.kind = strings[1]
											kind.menu = "(" .. strings[2] .. ")"
											return kind
									end,
								}),
            },
						sorting = {
								priority_weight = 2,
								comparators = {
										compare.recently_used,
										compare.offset,
										compare.exact,
										compare.lsp_scores,
										compare.kind,
										compare.sort_text,
										compare.length,
										compare.order,
								},
						},
            mapping = cmp.mapping.preset.insert({
								["<CR>"] = cmp.mapping.confirm({ select = true }),
								-- ["<CR>"] = cmp.mapping.confirm({  behavior = cmp.ConfirmBehavior.Replace,select = true }),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-e>"] = cmp.mapping.close(),
								["<Tab>"] = vim.schedule_wrap(function(fallback)
									if cmp.visible() and has_words_before() then
										cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
									else
										fallback() 
									end
								end),
								-- ["<Tab>"] = cmp.mapping(function(fallback)
								-- 	if cmp.visible() then
								-- 		cmp.select_next_item()
								-- 	elseif require("luasnip").expand_or_jumpable() then
								-- 		vim.fn.feedkeys(t("<Plug>luasnip-expand-or-jump"), "")
								-- 	else
								-- 		fallback()
								-- 	end
								-- end, { "i", "s" }),
								["<S-Tab>"] = cmp.mapping(function(fallback)
									if cmp.visible() then
										cmp.select_prev_item()
									elseif require("luasnip").jumpable(-1) then
										vim.fn.feedkeys(t("<Plug>luasnip-jump-prev"), "")
									else
										fallback()
									end
								end, { "i", "s" }),
            }),
            sources = cmp.config.sources({
								{ name = "luasnip" },
								{ name = "nvim_lsp" },
								{ name = "nvim_lua" },
								{ name = "path"},
                { name = "nvim_lsp_signature_help" },
                { name = "buffer" },
            }),
            window = {    
								completion = cmp.config.window.bordered({
                		winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
								}),
								documentation = cmp.config.window.bordered({
										winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
								}),
            },
        }
    end,
    config = function(_, opts)
        local cmp = require("cmp")
        cmp.setup(opts)
				 -- Set configuration for specific filetype.
				-- cmp.setup.filetype('gitcommit', {
				-- 	sources = cmp.config.sources({
				-- 		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
				-- 	}, {
				-- 		{ name = 'buffer' },
				-- 	})
				-- })
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
    end,
}

return M
