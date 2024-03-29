-- 边输入边搜索
vim.o.incsearch = true
-- 当文件被外部程序修改时，自动加载
vim.o.autoread = true
-- 禁止折行
vim.o.wrap = false
-- vim.opt.whichwrap:append("<,>,[,],h,l")         -- keys allowed to move to the previous/next line when the beginning/end of line is reached

-- -- -- Remap space as leader key
vim.o.foldcolumn = '0' -- '0' is not bad
vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
vim.o.foldlevelstart = 99
vim.o.foldenable = true
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.diffopt = "filler,iwhite,internal,algorithm:patience"
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- vim.opt.sessionoptions = "buffers,curdir,folds,help,tabpages,globals,winsize,localoptions"
vim.o.sessionoptions = "buffers,curdir,help,tabpages,winsize,winpos"
vim.opt.viewoptions = "folds,cursor,curdir,slash,unix"
vim.opt.jumpoptions = "view"
vim.opt.foldmethod = "indent" -- indent,expr
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 补全增强
vim.o.wildmenu = true
-- command completion
-- vim.opt.wildmode = "longest:full:full"
vim.opt.wildignorecase = true
vim.opt.wildignore =
".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,*DS_STORE,*.db,**/node_modules/**,**/bower_modules/**"
-- vim.opt.ffs = unix
vim.opt.syntax = "on"
-- vim.filetype.add({
--   -- extension = {
--   --     foo = "fooscript",
--   -- },
--   filename = {
--     ['Podfile'] = 'ruby',
--   },
--   pattern = {
--     ['.*git/config'] = 'gitconfig',
--     ['.*env.*'] = 'sh',
--   }
-- })

-- disable built-in plugins
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "tar",
  "tarPlugin",
  "rrhelper",
  "spellfile_plugin",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}
for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

-- 行号
vim.opt.relativenumber = true
vim.opt.number = true

-- 缩进
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true

-- 光标行
vim.opt.cursorline = true

-- 启用鼠标
-- vim.opt.mouse:append("a")

-- 系统剪贴板
vim.opt.clipboard:append("unnamedplus")

-- 默认新窗口右和下
vim.opt.splitright = true
vim.opt.splitbelow = true

-- 搜索
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- 外观
vim.opt.termguicolors = true
vim.opt.signcolumn = "no"
vim.opt.backup = false                                  -- creates a backup file
vim.opt.cmdheight = 1                                   -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { "menu", "menuone", "noselect" } -- mostly just for cmp
vim.opt.conceallevel = 0                                -- so that `` is visible in markdown files
vim.g.encoding = "UTF-8"
vim.opt.fileencoding = "utf-8"                          -- the encoding written to a file
vim.opt.hlsearch = true
vim.opt.pumheight = 10                                  -- pop up menu height
vim.opt.showmode = true                                 -- we don't need to see things like -- INSERT -- anymore
vim.opt.showtabline = 0                                 -- always show tabs
vim.opt.smartindent = true                              -- make indenting smarter again
vim.opt.swapfile = false                                -- creates a swapfile
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.undofile = true     -- enable persistent undo
vim.opt.updatetime = 500    -- faster completion (4000ms default)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.laststatus = 3      -- only the last window will always have a status line
vim.opt.showcmd = false     -- hide (partial) command in the last line of the screen (for performance)
vim.opt.ruler = false       -- hide the line and column number of the cursor position
vim.opt.numberwidth = 4
vim.opt.scrolloff = 8       -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8   -- minimal number of screen columns to keep to the left and right of the cursor if wrap is `false`
-- vim.opt.guifont = { "FiraCode Nerd Font", ":h18" }               -- the font used in graphical neovim applications
-- vim.opt.guifont = "FiraCode Nerd Font:h15"
vim.opt.guifont = "ComicShannsMono Nerd Font:h15"
-- vim.opt.fillchars.eob=" "                       -- show empty lines at the end of a buffer as ` ` {default `~`}
vim.opt.fillchars = {
  foldopen = "",
  foldclose = "",
  fold = " ",
  foldsep = " ",
  diff = "/",
  eob = " ",
}
vim.opt.shortmess:append "c"                    -- hide all the completion messages, e.g. "-- XXX completion (YYY)", "match 1 of 2", "The only match", "Pattern not found"
vim.opt.iskeyword:append("-")                   -- treats words with `-` as single words
vim.opt.formatoptions:remove({ "c", "r", "o" }) -- This is a sequence of letters which describes how automatic formatting is to be done
vim.opt.linebreak = true

local keymap = vim.keymap.set
local opt = { noremap = true, silent = true }
if vim.fn.exists("g:neovide") == 1 then
  keymap({ "n", "i" }, "<d-k>", "<cmd>BufferLineCycleNext<cr>", opt)
  keymap({ "n", "i" }, "<d-j>", "<cmd>BufferLineCyclePrev<cr>", opt)
  keymap("n", '<d-s-n>', ':call vm#commands#add_cursor_down(0, v:count1)<cr>', opt)
  keymap("n", '<d-s-p>', ':call vm#commands#add_cursor_up(0, v:count1)<cr>', opt)
  keymap("n", "<d-[>", "g;", opt)
  keymap("n", "<d-]>", "g,", opt)
  vim.g.neovide_cursor_vfx_mode = "pixiedust"
  vim.g.neovide_transparency = 0
  vim.g.transparency = 0.2
  vim.g.neovide_background_color = '#3A3C4D'
  -- Helper function for transparency formatting
  -- local alpha = function()
  --   return string.format("%x", math.floor(255 * vim.g.neovide_transparency or 0.6))
  -- end
  -- vim.g.neovide_transparency = 0.7
  -- vim.g.transparency = 0.6
  -- vim.g.neovide_background_color = "#28292E" .. alpha()
  vim.g.neovide_remember_window_size = true
  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_trail_length = 0.02
  vim.g.neovide_refresh_rate = 60
  vim.g.neovide_refresh_rate_idle = 5
  vim.g.neovide_floating_blur_amount_x = 20.0
  vim.g.neovide_floating_blur_amount_y = 20.0
  vim.g.neovide_input_use_logo = true
  vim.g.neovide_input_macos_alt_is_meta = true
  -- vim.opt.guifont = { "FiraCode Nerd Font", ":h15" }	
  vim.g.neovide_padding_top = 0
  vim.g.neovide_padding_bottom = 0
  vim.g.neovide_padding_right = 0
  vim.g.neovide_padding_left = 10
end
