-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- 上次光标编辑位置
local keymap = vim.keymap.set
local opt = { noremap = true, silent = true }
-- keymap("n", "<d-[>", "g;", opt,'back')
-- keymap("n", "<d-]>", "g,", opt,'forward')

-- Clear search results
keymap("n", "<esc>", "<cmd>noh<cr>", opt)
-- Paste without replace clipboard
keymap("v", "p", '"_dP', opt)
keymap("n", "gl", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
-- 现在要删除这个映射
vim.keymap.del('n', '<leader>cd')
