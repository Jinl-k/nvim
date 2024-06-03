-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- LazyVim auto format
-- vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.g.autoformat = false
-- vim.opt.guifont = {"Monaspace Neon",":h16"}
vim.opt.guifont = { "FiraCode Nerd Font", ":h16" }

vim.opt.showcmd = false        -- hide (partial) command in the last line of the screen (for performance)
vim.g.encoding = "UTF-8"
vim.opt.fileencoding = "utf-8" -- the encoding written to a file
-- vim.opt.swapfile = false       -- creates a swapfile
-- vim.g.maplocalleader = " "
-- 补全增强
-- vim.o.wildmenu = true
vim.opt.wildignorecase = true
vim.opt.wildignore =
".git,.hg,.svn,*.pyc,*.o,*.out,*.zip,**/tmp/**,*.DS_Store,*DS_STORE,*.db,**/node_modules/**,**/bower_modules/**"

-- vim.opt.autoindent = true
-- 边输入边搜索
-- vim.o.incsearch = true
-- 当文件被外部程序修改时，自动加载
-- vim.o.autoread = true


local keymap = vim.keymap.set
local opt = { noremap = true, silent = true }
if vim.g.neovide then

    -- keymap({ "n", "i" }, "<d-k>", "<cmd>BufferLineCycleNext<cr>", opt)
    -- keymap({ "n", "i" }, "<d-j>", "<cmd>BufferLineCyclePrev<cr>", opt)
    keymap("n", '<d-s-n>', ':call vm#commands#add_cursor_down(0, v:count1)<cr>', opt)
    keymap("n", '<d-s-p>', ':call vm#commands#add_cursor_up(0, v:count1)<cr>', opt)
    keymap("n", "<d-[>", "g;", opt)
    keymap("n", "<d-]>", "g,", opt)

    vim.g.neovide_cursor_vfx_mode = "pixiedust"



    vim.g.neovide_window_blurred = true
    vim.g.neovide_transparency = 0.9
    vim.g.neovide_floating_blur_amount_x = 50
    vim.g.neovide_floating_blur_amount_y = 50



    vim.g.neovide_refresh_rate = 120
    vim.g.neovide_refresh_rate_idle = 5


    vim.g.neovide_input_use_logo = true
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_hide_mouse_when_typing = true
    vim.g.neovide_input_macos_option_key_is_meta = 'only_left'


    -- local function set_ime(args)
    --     if args.event:match("Enter$") then
    --         vim.g.neovide_input_ime = true
    --     else
    --         vim.g.neovide_input_ime = false
    --     end
    -- end

    -- local ime_input = vim.api.nvim_create_augroup("ime_input", { clear = true })

    -- vim.api.nvim_create_autocmd({ "InsertEnter", "InsertLeave" }, {
    --     group = ime_input,
    --     pattern = "*",
    --     callback = set_ime
    -- })

    -- vim.api.nvim_create_autocmd({ "CmdlineEnter", "CmdlineLeave" }, {
    --     group = ime_input,
    --     pattern = "[/\\?]",
    --     callback = set_ime
    -- })


    -- vim.opt.guifont = { "FiraCode Nerd Font", ":h15" }
    -- vim.g.neovide_padding_top = 10
    -- vim.g.neovide_padding_bottom = 0
    -- vim.g.neovide_padding_right = 10
    -- vim.g.neovide_padding_left = 10
    -- vim.g.neovide_no_idle = false
end
