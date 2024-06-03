-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here


-- 自动切换输入法，需要安装 im-select
-- https://github.com/daipeihust/im-select
-- vim.api.nvim_create_autocmd("InsertLeave", {
--     callback = require("config.im-select").macInsertLeave,
-- })
-- vim.api.nvim_create_autocmd("InsertEnter", {
--     callback = require("config.im-select").macInsertEnter,
-- })

-- 进入Terminal 自动进入插入模式
vim.api.nvim_create_autocmd("TermOpen", {
    command = "startinsert",
})

-- HACK: Autosave
local function save()
    local buf = vim.api.nvim_get_current_buf()

    vim.api.nvim_buf_call(buf, function()
        vim.cmd("silent! write")
    end)
end

vim.api.nvim_create_augroup("AutoSave", {
    clear = true,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
    callback = function()
        save()
    end,
    pattern = "*",
    nested = true,
    group = "AutoSave",
})