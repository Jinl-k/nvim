-- https://github.com/RRethy/vim-illuminate
-- https://github.com/yamatsum/nvim-cursorline
return {
  "RRethy/vim-illuminate",
  opts = {
    -- modes_denylist = { "i" },
    filetypes_denylist = {
      "NvimTree",
      "aerial",
      "alpha",
      "undotree",
      "spectre_panel",
      "dbui",
      "toggleterm",
      "notify",
      "startuptime",
      "packer",
      "mason",
      "help",
      "terminal",
      "lspinfo",
      "TelescopePrompt",
      "TelescopeResults",
      "",
      'neo-tree',
      "neo-tree-popup",
    },
  }
}
