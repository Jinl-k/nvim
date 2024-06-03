local opt = { noremap = true, silent = true }
return {
  "aznhe21/actions-preview.nvim",
  enabled = false,
  keys = {
    {
      "ga",
      function()
        require("actions-preview").code_actions()
      end,
      mode = { "n" },
      opt,
      desc = "code_actions"
    },
  },
  config = function()
    -- vim.keymap.set({ "v", "n" }, "ga", require("actions-preview").code_actions,{silent = true},'code_actions')
    require("actions-preview").setup {
      -- options for vim.diff(): https://neovim.io/doc/user/lua.html#vim.diff()
      -- diff = {
      --   ctxlen = 3,
      -- },
      diff = {
        algorithm = "patience",
        ignore_whitespace = true,
      },
      -- telescope = require("telescope.themes").get_dropdown { winblend = 10 },
      telescope = require("telescope.themes").get_dropdown { winblend = 10 },
      -- telescope = {
      --   sorting_strategy = "ascending",
      --   layout_strategy = "vertical",
      --   winblend = 10,
      --   layout_config = {
      --     width = 0.8,
      --     height = 0.9,
      --     prompt_position = "top",
      --     preview_cutoff = 20,
      --     preview_height = function(_, _, max_lines)
      --       return max_lines - 15
      --     end,
      --   },
      -- },
      -- priority list of preferred backend
      backend = { "telescope", "nui" },
    }
  end,
}
