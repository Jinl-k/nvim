local M = {
    "SmiteshP/nvim-navic",
		dependencies="neovim/nvim-lspconfig",
		enabled = false,
		event = "VeryLazy",
    config = function()
			local navic = require("nvim-navic")

			require("lspconfig").tsserver.setup {
					on_attach = function(client, bufnr)
							navic.attach(client, bufnr)
					end
			}
			require("nvim-navic").setup({
				icons = {
            File = " ",
            Module = " ",
            Namespace = " ",
            Package = " ",
            Class = " ",
            Method = " ",
            Property = " ",
            Field = " ",
            Constructor = " ",
            Enum = " ",
            Interface = " ",
            Function = " ",
            Variable = " ",
            Constant = " ",
            String = " ",
            Number = " ",
            Boolean = " ",
            Array = " ",
            Object = " ",
            Key = " ",
            Null = " ",
            EnumMember = " ",
            Struct = " ",
            Event = " ",
            Operator = " ",
            TypeParameter = " ",
        },
        highlight = true,
        separator = " > ",
			})
        -- vim.g.navic_silence = true
        -- require("config.utils").on_attach(function(client, buffer)
        --     if client.server_capabilities.documentSymbolProvider then
        --         require("nvim-navic").attach(client, buffer)
        --     end
        -- end)
    end,
    -- opts = {
    --     icons = {
    --         File = " ",
    --         Module = " ",
    --         Namespace = " ",
    --         Package = " ",
    --         Class = " ",
    --         Method = " ",
    --         Property = " ",
    --         Field = " ",
    --         Constructor = " ",
    --         Enum = " ",
    --         Interface = " ",
    --         Function = " ",
    --         Variable = " ",
    --         Constant = " ",
    --         String = " ",
    --         Number = " ",
    --         Boolean = " ",
    --         Array = " ",
    --         Object = " ",
    --         Key = " ",
    --         Null = " ",
    --         EnumMember = " ",
    --         Struct = " ",
    --         Event = " ",
    --         Operator = " ",
    --         TypeParameter = " ",
    --     },
    --     highlight = true,
    -- },
}

return M
