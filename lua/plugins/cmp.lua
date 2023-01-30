local M ={
    "hrsh7th/nvim-cmp",
    event = "BufReadPre",
    dependencies = {
			"rafamadriz/friendly-snippets",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-vsnip",
			'hrsh7th/vim-vsnip',
			{
					"zbirenbaum/copilot-cmp",
					after = "copilot.lua",
			}, 	
    },
    opts = function()
			 	local  complete_window_settings = {
						fixed = true,
						min_width = 20,
						max_width = 20,
				}
        local cmp = require("cmp")
        local cmp_kinds = require("config.utils").cmp_kinds

        -- local has_words_before = function()
        --     if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
        --         return false
        --     end
        --     local line, col = vim.F.unpack_len(vim.api.nvim_win_get_cursor(0))
        --     return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        -- end
				local has_words_before = function()
					if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then 
						return false 
					end
					local line, col = unpack(vim.api.nvim_win_get_cursor(0))
					return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
				end

				require("copilot_cmp").setup({
						method = "getCompletionsCycling"	
				})
				local Icons = require("config.utils").cmp_kinds

        return {
            snippet = {
                expand = function(args)
                    vim.fn["vsnip#anonymous"](args.body)
                end,
            },
            formatting = {
								insert_text = require("copilot_cmp.format").remove_existing,
                format = function(entry, vim_item)
                    -- if vim.tbl_contains({ "path" }, entry.source.name) then
                    --     local icon, hl_group = require("nvim-web-devicons").get_icon(entry:get_completion_item().label)
                    --     if icon then
                    --         vim_item.kind = icon
                    --         vim_item.kind_hl_group = hl_group
                    --         return vim_item
                    --     end
                    -- end
                    -- vim_item.kind = (cmp_kinds[vim_item.kind] or "") .. vim_item.kind
										-- -- determine if it is a fixed window size
										-- if complete_window_settings.fixed and vim.fn.mode() == "i" then
										-- 		local label = vim_item.abbr
										-- 		local min_width = complete_window_settings.min_width
										-- 		local max_width = complete_window_settings.max_width
										-- 		local truncated_label = vim.fn.strcharpart(label, 0, max_width)

										-- 		if truncated_label ~= label then
										-- 				vim_item.abbr = string.format("%s %s", truncated_label, "…")
										-- 		elseif string.len(label) < min_width then
										-- 				local padding = string.rep(" ", min_width - string.len(label))
										-- 				vim_item.abbr = string.format("%s %s", label, padding)
										-- 		end
										-- end
                    -- return vim_item
										local kind = vim_item.kind
										--  显示代码来源的名称
										-- local source = entry.source.name

										vim_item.kind = string.format("%s %s", Icons[kind], kind)
										-- vim_item.menu = string.format("<%s>", string.upper(source))

										-- determine if it is a fixed window size
										if complete_window_settings.fixed and vim.fn.mode() == "i" then
												local label = vim_item.abbr
												local min_width = complete_window_settings.min_width
												local max_width = complete_window_settings.max_width
												local truncated_label = vim.fn.strcharpart(label, 0, max_width)

												if truncated_label ~= label then
														vim_item.abbr = string.format("%s %s", truncated_label, "…")
												elseif string.len(label) < min_width then
														local padding = string.rep(" ", min_width - string.len(label))
														vim_item.abbr = string.format("%s %s", label, padding)
												end
										end

										return vim_item
                end,
            },
						sorting = {
								priority_weight = 2,
								comparators = {
										require("copilot_cmp.comparators").prioritize,
      							require("copilot_cmp.comparators").score,
										cmp.config.compare.offset,
										cmp.config.compare.exact,
										cmp.config.compare.score,
										cmp.config.compare.recently_used,
										cmp.config.compare.locality,
										cmp.config.compare.kind,
										cmp.config.compare.sort_text,
										cmp.config.compare.length,
										cmp.config.compare.order,
								},
						},
            mapping = cmp.mapping.preset.insert({
								["<CR>"] = cmp.mapping.confirm({  behavior = cmp.ConfirmBehavior.Replace,select = true }),
                ["<C-p>"] = cmp.mapping.select_prev_item(),
                ["<C-n>"] = cmp.mapping.select_next_item(),
                ["<C-d>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.close(),
								["<Tab>"] = vim.schedule_wrap(function(fallback)
									if cmp.visible() and has_words_before() then
										cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
									else
										fallback()
									end
								end),
								["<S-Tab>"] = vim.schedule_wrap(function(fallback)
								if cmp.visible() and has_words_before() then
									cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
								else
									fallback()
								end
							end),
            }),
            sources = {
								{ name = "copilot"},
							  { name = "vsnip" },
								{ name = "nvim_lsp" },
								{ name = "nvim_lua" },
								-- Other Sources
								{ name = "path"},
                { name = "nvim_lsp_signature_help" },
                { name = "buffer" },
            },
            window = {
                -- completion = cmp.config.window.bordered(),
                -- documentation = cmp.config.window.bordered(),
								completion = cmp.config.window.bordered({
                		winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
								}),
								documentation = cmp.config.window.bordered({
										winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
								}),
            },
            experimental = { 
							ghost_text = {
                hl_group = "LspCodeLens",
            	}	 
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
