
-- https://github.com/nvim-neotest/neotest
 local M = {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'haydenmeade/neotest-jest'
    },
		Enabled =false,
    -- config = function() require('config.testing') end,
  }
	return M
-- local signs = require("utils").signs

-- neotest.setup({
--   adapters = {
--     require('neotest-jest')({
--       jestCommand = "npm test --"
--     }),
--   },
--   icons = {
--     child_indent = "│",
--     child_prefix = "├",
--     collapsed = "─",
--     expanded = "╮",
--     failed = signs.Error,
--     final_child_indent = " ",
--     final_child_prefix = "╰",
--     non_collapsible = "─",
--     passed = signs.PassCheck,
--     running = signs.Running,
--     skipped = signs.Forbidden,
--     unknown = ""
--   },
-- })
