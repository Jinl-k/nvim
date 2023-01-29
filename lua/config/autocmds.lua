-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
	end,
})

-- 自动切换输入法，需要安装 im-select
-- https://github.com/daipeihust/im-select
vim.api.nvim_create_autocmd("InsertLeave", {
    callback = require("config.im-select").macInsertLeave,
})
vim.api.nvim_create_autocmd("InsertEnter", {
    callback = require("config.im-select").macInsertEnter,
})

-- 进入Terminal 自动进入插入模式
vim.api.nvim_create_autocmd("TermOpen", {
    command = "startinsert",
})

-- 自动保存
vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
		pattern = { "*" },
		command = "silent! wall",
		nested = true,
})

-- 保存自动格式化
vim.api.nvim_create_autocmd({ "InsertLeave"}, {
		pattern = { "*" },
		command = "lua vim.lsp.buf.format({ async = true })",
		nested = true,
})


vim.api.nvim_create_user_command("BufferDelete", function()
    ---@diagnostic disable-next-line: missing-parameter
    local file_exists = vim.fn.filereadable(vim.fn.expand("%p"))
    local modified = vim.api.nvim_buf_get_option(0, "modified")

    if file_exists == 0 and modified then
        local user_choice = vim.fn.input("The file is not saved, whether to force delete? Press enter or input [y/n]:")
        if user_choice == "y" or string.len(user_choice) == 0 then
            vim.cmd("bd!")
        end
        return
    end
			 
    local force = not vim.bo.buflisted or vim.bo.buftype == "nofile"
    vim.cmd(force and "bd!" or string.format("bp | bd! %s", vim.api.nvim_get_current_buf()))
end, { desc = "Delete the current Buffer while maintaining the window layout" })
