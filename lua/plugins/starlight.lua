local M = {
	"askfiy/starlight", 
	-- name = "catppuccin",
	enabled = false,
	lazy = false,
	priority = 1000,
	opts = function()
		local colors = require("starlight.colors")
		local utils = require("starlight.utils")
		-- utils.bulk_set_highlight({
    -- 	-- Normal = {fg = "#ffffff", bg = "#000000"},
    -- 	-- Visual = {fg = "#ffffff", bg = "#000000"}
		-- })
		return {
 				preset = true,
        style = {
            comments = { italic = true },
            functions = { italic = true },
            keywords = { italic = true },
            strings = { italic = true },
            variables = { italic = true },
        },
        extend = {
            hop = true,
            packer = true,
            aerial = true,
            fidget = true,
            nvim_cmp = true,
            gitsigns = true,
            markdown = true,
            which_key = true,
            nvim_tree = false,
            lspconfig = true,
            telescope = true,
            bufferline = true,
            nvim_navic = true,
            nvim_notify = true,
            vim_illuminate = true,
            nvim_scrollview = true,
            nvim_treesitter = true,
            nvim_ts_rainbow = true,
            indent_blankline = true,
            vim_visual_multi = true,
        },
				-- VertSplit = { fg = colors.blue, bold = false },
        hooks = {
            before = function(utils, colors)
							-- utils.set_highlight("VertSplit", {fg = "#ffffff", bold = false })
						end,
            after = function(utils, colors)
							utils.bulk_set_highlight({
									VertSplit = { fg = "red", bold = false },	
									Normal = {fg = "#ffffff", bg = "#000000"},
									Visual = {fg = "#ffffff", bg = "#000000"}
							})
                -- if not true then
                --     utils.hl.bulk_set_highlight({
                --         Pmenu = { bg = colors.black1 },
                --         NormalFloat = { fg = colors.white, bg = colors.black1 },
                --         DiagnosticFloatingError = { fg = colors.red, bg = colors.black1 },
                --         DiagnosticFloatingWarn = { fg = colors.yellow, bg = colors.black1 },
                --         DiagnosticFloatingInfo = { fg = colors.blue, bg = colors.black1 },
                --         DiagnosticFloatingHint = { fg = colors.blue, bg = colors.black1 },
                --     })
                -- end
            end,
        },
		}
	end,
	config = function(opts)
		local starlight = require("starlight")
		starlight.setup(opts)
		-- vim.cmd [[colorscheme starlight]]
	end,
}

return M
