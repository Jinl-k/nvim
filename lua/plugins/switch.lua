return {
    'rmagatti/alternate-toggler',
    event = "VeryLazy",
    vscode = true,
    keys = {
        { "cx", "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>", mode = { "n" } },
    },
    config = function()
        require("alternate-toggler").setup {
            alternates = {
                ["true"] = "false",
                ["True"] = "False",
                ["TRUE"] = "FALSE",
                ["Yes"] = "No",
                ["yes"] = "no",
                ["YES"] = "NO",
                ["disable"] = "enable",
                ["disabled"] = "enabled",
                ["1"] = "0",
                ["<"] = ">",
                ["("] = ")",
                ["["] = "]",
                ["{"] = "}",
                ['"'] = "'",
                ['""'] = "''",
                ["+"] = "-",
                ["==="] = "!==",
                ["=="] = "!=",
            }
        }
    end,
}
