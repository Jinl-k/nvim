-- https://github.com/VidocqH/lsp-lens.nvim
return {
    'VidocqH/lsp-lens.nvim',
    enabled = false,
    event = "BufRead",
    config = function()
        local SymbolKind = vim.lsp.protocol.SymbolKind
        require 'lsp-lens'.setup({
            enable = true,
            include_declaration = false, -- Reference include declaration
            sections = {
                -- Enable / Disable specific request
                definition = true,
                references = true,
                implementation = true,
            },
            ignore_filetype = {
                "prisma",
            },
            -- Target Symbol Kinds to show lens information
            target_symbol_kinds = { SymbolKind.Function, SymbolKind.Method, SymbolKind.Interface },
            -- Symbol Kinds that may have target symbol kinds as children
            wrapper_symbol_kinds = { SymbolKind.Class, SymbolKind.Struct },
        })
    end
}
