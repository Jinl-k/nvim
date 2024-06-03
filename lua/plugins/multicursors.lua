-- https://github.com/smoka7/multicursors.nvim
return {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
        'smoka7/hydra.nvim',
    },
    cmd = { 'MCstart', 'MCvisual', 'MCclear', 'MCpattern', 'MCvisualPattern', 'MCunderCursor' },
    keys = {
            {
                mode = { 'v', 'n' },
                '<Leader>m',
                '<cmd>MCstart<cr>',
                desc = 'MCstart',
            },
        },
    opts = {},

}