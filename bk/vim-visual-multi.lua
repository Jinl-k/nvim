return {
    'mg979/vim-visual-multi',
    event = "VeryLazy",
    config = function()
        -- vim.g.VM_Extend_hl = "VM_Extend_hl"
        -- vim.g.VM_Cursor_hl = "VM_Cursor_hl"
        vim.g.VM_Mono_hl = "VM_Mono_hl"
        vim.g.VM_Insert_hl = "VM_Insert_hl"

        vim.g.VM_default_mappings = 0

        vim.g.VM_maps = {
            ["Find Under"] = "<c-m-n>",
            ["Find Prev"] = "<c-m-p>",
            ["Skip Region"] = "<c-s>",
            ["Remove Region"] = "<c-d>",
        }
    end
}
