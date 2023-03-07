-- :echo &filetype 查看文件类型
local keymap = vim.keymap.set
local opt = {noremap = true,silent = true}
-- typescript 快捷键
-- pluginKeys.mapTsLSP = function(mapbuf)
--   mapbuf("n", "gs", ":TSLspOrganize<CR>", opt)
--   mapbuf("n", "gR", ":TSLspRenameFile<CR>", opt)
--   mapbuf("n", "gi", ":TSLspImportAll<CR>", opt)
-- end
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
keymap('n', 'zR', require('ufo').openAllFolds,opts)
keymap('n', 'zM', require('ufo').closeAllFolds,opts)
keymap('n', 'zr', require('ufo').openFoldsExceptKinds,opts)
keymap('n', 'zm', require('ufo').closeFoldsWith,opts)

-- 删除光标左/右的内容
keymap("n", "dL", "d$", opt)
keymap("n", "dH", "d0", opt)
keymap("n", "yy", "^y$", opt)
-- 上下移动选中文本
-- keymap("v", "J", ":move '>+1<CR>gv-gv", opt)
-- keymap("v", "K", ":move '<-2<CR>gv-gv", opt)
-- magic search
keymap("n", "/", "/\\v", opt)
keymap("v", "/", "/\\v", opt)
-- 取消高亮
keymap("n", "<leader>nh", ":nohl<CR>",opt)
-- Clear search results
keymap("n", "<esc>", "<cmd>noh<cr>",opt)
-- Remap command key
-- keymap("n", "<leader><leader>", ":",opt)
keymap("n", "<leader><esc>", ":qa!<cr>",opt)
keymap("i", "<d-z>", "<cmd>undo<cr>", opt)
keymap("i", "<d-s-z>", "<cmd>redo<cr>", opt)
-- 窗口
-- alt + hjkl  窗口之间跳转
keymap({"n","i","t"}, "<m-h>", "<C-w>h", opt)
keymap({"n","i","t"}, "<m-j>", "<C-w>j", opt)
keymap({"n","i","t"}, "<m-k>", "<C-w>k", opt)
keymap({"n","i","t"}, "<m-l>", "<C-w>l", opt)
vim.api.nvim_set_keymap('n', '<leader>h', ':FocusSplitLeft<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>j', ':FocusSplitDown<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>k', ':FocusSplitUp<CR>', opt)
vim.api.nvim_set_keymap('n', '<leader>l', ':FocusSplitRight<CR>', opt)



-- -- 关闭左/右侧标签页
keymap("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
keymap("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
-- 关闭当前 buffer
keymap({"n","i","t"}, "<c-q>", "<cmd>BufferDelete<cr>",opt)
-- -- 关闭除当前外的其他标签页
keymap("n", "<leader>bo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)
-- 选择一个标签页关闭
keymap("n", "<leader>bq", ":BufferLinePickClose<CR>", opt)
-- Navigate buffers
keymap({"n","i"}, "<m-i>", "<cmd>BufferLineCycleNext<cr>",opt)
keymap({"n","i"}, "<m-u>", "<cmd>BufferLineCyclePrev<cr>",opt)
keymap("n", "<leader>lp", ":BufferLinePick<CR>", opt)
keymap("n", "qw", "<C-w>c",opt) -- 关闭当前窗口 
keymap("n", "<leader>W", "<C-w>o",opt) -- 关闭除当前的其他窗口 
-- keymap("n", "<leader>rv", "<C-w>v",opt) -- 水平新增窗口 
-- keymap("n", "<leader>rh", "<C-w>s",opt) -- 垂直新增窗口
keymap("n", "<leader>bp", ":BrowserPreview<CR>", opt)
-- 多光标
keymap("n", '<m-s-n>', ':call vm#commands#add_cursor_down(0, v:count1)<cr>', opt)
keymap("n", '<m-s-p>', ':call vm#commands#add_cursor_up(0, v:count1)<cr>', opt)
-- 插入模式下粘贴
vim.api.nvim_set_keymap("i", '<d-v>', '<esc>\"+pa', opt)
-- code run
keymap("n", '<c-i>', '<cmd>RunCode<CR>', opt)
keymap('n', '<leader>rF', '<cmd>RunFile<CR>', opt)
keymap('n', '<leader>rP', '<cmd>RunProject<CR>', opt)
keymap('n', '<leader>rc', '<cmd>RunClose<CR>', opt)

-- 全局替换字符
keymap('n', '<leader>rp', "<cmd>lua require('spectre').open()<CR>", opt)
keymap('n', '<leader>rf', "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", opt)
keymap('n', '<leader>rwf', "viw:lua require('spectre').open_file_search()<cr>", opt)


-- trouble
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>",opt)
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>" ,opt)
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" ,opt )
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>" ,opt )
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" ,opt )
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>" ,opt )
-- Better up/down
keymap("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
keymap("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

-- 单行或多行移动
-- Move Lines
-- keymap("n", "<C-M-j>", ":m .+1<cr>==", { desc = "Move down" })
-- keymap("v", "<C-M-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
-- keymap("i", "<C-M-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
-- keymap("n", "<C-M-k>", ":m .-2<cr>==", { desc = "Move up" })
-- keymap("v", "<C-M-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
-- keymap("i", "<C-M-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })
-- 移到行头尾
keymap({"n", "x" }, "H",
				function()
            return vim.v.count > 0 and "^" or "g^"
        end, { silent = true, expr = true })
keymap({"n", "x" }, "L",
				function()
           return vim.v.count > 0 and "$" or "g$"
        end, { silent = true, expr = true })
keymap({ "i","c", "t" }, "<m-w>", "<c-right>",opt, { desc = "next word" })
keymap({ "i","c", "t" }, "<m-b>", "<c-left>", opt,{ desc = "previous word" })
-- 插入模式下移动
keymap({ "i","c", "t" }, "<c-k>", "<up>",opt)
keymap({ "i","c", "t" }, "<c-j>", "<down>",opt)	
keymap({ "i","c", "t" }, "<c-l>", "<right>",opt)
keymap({ "i","c", "t" }, "<c-h>", "<left>",opt)
keymap('i', "<s-cr>", "<esc>o",opt)
-- Select all
keymap("n", "<C-a>", "ggVG<cr>",opt ,{ desc = "Select all" })

-- Same file
-- keymap({ "i", "v", "n" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })



-- Better indenting
keymap("v", "<", "<gv",opt)
keymap("v", ">", ">gv",opt)

-- Paste without replace clipboard
keymap("v", "p", '"_dP',opt)



-- CLose buffer
-- keymap({ "i", "v", "n" }, "<C-w>", "<cmd>bd<cr><esc>", { desc = "Close buffer" })
-- keymap({ "i", "v", "n" }, "<C-M-w>", "<cmd>bd!<cr><esc>", { desc = "Close buffer" })
-- Exit neovim
-- keymap({ "i", "v", "n","t" }, "<C-q>", "<cmd>q<cr>", opt,{ desc = "Exit Vim" })
-- keymap({ "i", "v", "n","t"}, "<C-M-q>", "<cmd>qa!<cr>", opt,{ desc = "Exit Vim" })

-- neo-tree
-- keymap({ "i", "v", "n" }, "<leader>1", "<cmd>Neotree toggle<cr>", { desc = "Exit Vim" })
-- Better move
keymap("n", "<C-d>", "<C-d>zz",opt)
keymap("n", "<C-u>", "<C-u>zz",opt)
-- 上次光标编辑位置
keymap("n", "<m-[>", "g;",opt)
keymap("n", "<m-]>", "g,",opt)



-- lsp
	local wk = require("which-key",opt)
	-- Mappings.
	 wk.register({
		["<leader>g"] = {
			name = "LSP",
			a = { "<cmd>Lspsaga rename ++project<CR>", "rename ++project" },
			d = { "<cmd>Lspsaga goto_definition<CR>", "Definition" },
			t = { "<cmd>Lspsaga goto_type_definition<CR>", "Type Definition" },
			D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
			i = { "<cmd>Telescope lsp_implementations<cr>", "Implementation" },
			-- K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
			k = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
			-- l = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", "Line Diagnostics" },
			-- L = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Location List" },
			n = { "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", "Next Diagnostic" },
			p = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Previous Diagnostic" },
			q = { "<cmd>lua vim.lsp.diagnostic.set_qflist()<cr>", "Quick Fix List" },
			R = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			r = { "<cmd>Telescope lsp_references<cr>", "References" },
			s = { "<cmd>lua vim.lsp.buf.document_symbol()<cr>", "Document Symbols" },
			S = { "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", "Workspace Symbols" },
		},
		["c"]={
				-- 替换
				D =  { "<cmd>lua require('substitute').operator()<cr>", '替换模式'},
				ds = { "<cmd>lua require('substitute').line()<cr>", "替换行" },
				dS = { "<cmd>lua require('substitute').eol()<cr>", "替换到末尾" },
				-- 交换
				c =  {	"<cmd>lua require('substitute.exchange').operator()<cr>","交换模式" },
				C =  {	"<cmd>lua require('substitute.exchange').line()<cr>","交换行" },
		},
		["<leader>c"] = {
				c = {"<cmd>lua require('substitute.range').operator()<cr>", "命令替换"},
				C = {"<cmd>lua require('substitute.range').word()<cr>", "替换词"},
		},
	 })

-- vim.keymap.set('n', 'gd', '<cmd>lua require("goto-preview",opt).goto_preview_definition()<CR>', opt)
-- vim.keymap.set('n', 'gt', '<cmd>lua require("goto-preview",opt).goto_preview_type_definition()<CR>', opt)
-- vim.keymap.set('n', 'gi', '<cmd>lua require("goto-preview",opt).goto_preview_implementation()<CR>', opt)
-- vim.keymap.set('n', 'gr', '<cmd>lua require("goto-preview",opt).goto_preview_references()<CR>', opt)
-- vim.keymap.set('n', '<leader>q', '<cmd>lua require("goto-preview",opt).close_all_win()<CR>', opt)



--lspsaga
-- keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>",opt)
keymap("n", "gA", "<cmd>Lspsaga code_action<CR>",opt)
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>",opt)
keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>",opt)

keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>",opt)
keymap("n", "ga", "<cmd>Lspsaga rename<CR>",opt)

keymap("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>",opt)
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>",opt)
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>",opt)
-- -- Diagnostic jump with filter like Only jump to error
-- keymap("n", "[E", function()
--   require("lspsaga.diagnostic",opt):goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end)
-- keymap("n", "]E", function()
--   require("lspsaga.diagnostic",opt):goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end)
keymap("n","<leader>L", "<cmd>Lspsaga outline<CR>",opt)






keymap({"n"}, "<leader>th", "<Cmd>ToggleTerm direction=horizontal<CR>",opt)
keymap({"n"}, "<leader>tv", "<Cmd>ToggleTerm direction=vertical<CR>",opt)
keymap({"n"}, "<leader>tf", "<Cmd>ToggleTerm direction=float<CR>",opt)
keymap({"n"}, "<leader>tt", "<Cmd>ToggleTerm<CR>",opt)
keymap({"t"}, "tt", "<Cmd>ToggleTerm<CR>",opt)
keymap({"n"}, "<leader>tg", "<Cmd>lua toggle_lazygit()<CR>",opt)
local _lazygit = nil
_G.toggle_lazygit = function()
	if not _lazygit then
		local Terminal = require("toggleterm.terminal",opt).Terminal
		_lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			direction = "float",
		})
	end
	_lazygit:toggle()
end





-- -- Telescope
keymap("n","<C-e>", ":Telescope file_browser<CR>" ,opt)
keymap("n","<leader>ff", "<cmd>Telescope find_files<cr>" ,opt)
keymap("n","<C-p>", ":lua require('telescope').extensions.projects.projects()<CR>" ,opt)
-- keymap("n","<C-P>", "<cmd>lua require('telescope.builtin').commands()<cr>" ,opt)
keymap("n","<leader>fr", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>" ,opt)
-- 全部文件查找字符
keymap("n","<leader>F", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>" ,opt)
-- 当前文件查找字符
keymap("n","<C-f>", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>" ,opt)

-- 剪切板
keymap("n", "<leader>fy", function()
	require("telescope",opt).extensions.neoclip.default()
end, opt)
keymap("n", "<leader>fc", function()
	require("neoclip",opt).clear_history()
end, opt)

-- Lsp formatting
keymap("n", "<leader>o", function() 
	vim.lsp.buf.format({ async = false })
end, opt,{ desc = "Lsp formatting" })

-- -- Open quickfix list
-- keymap("n", "<leader>q", function()
-- 	vim.diagnostic.setloclist()
-- end, { desc = "Open quickfix list" })

-- -- toggle options
-- keymap("n", "<leader>tw", function()
-- end, { desc = "Toggle Word Wrap" })




-- DAP

keymap("n", "<leader>de", function()
                for _, opts in ipairs(public.get_all_win_buf_ft()) do
                    if opts.buf_ft == "dapui_hover" then
                        ---@diagnostic disable-next-line: missing-parameter
                        require("dapui",opt).eval()
                        return
                    end
                end
                ---@diagnostic disable-next-line: missing-parameter
                require("dapui",opt).eval(vim.fn.input("Enter debug expression: ",opt))
            end, opt,{desc = "Execute debug expressions"})

    --     {
    --         mode = { "n" },
    --         lhs = "<leader>dc",
    --         rhs = function()
    --             require("dap",opt).clear_breakpoints()
    --         end,
    --         options = opt,
    --         description = "Clear breakpoints in the current buffer",
    --     },


    --     require("dap",opt).run_last() description = "Rerun debug",
-- rhs = function() require("dap",opt).toggle_breakpoint() end,
keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opt)
keymap("n", "<f1>", "<cmd>lua require'dap'.continue()<cr>", opt)
keymap("n", "<f2>", "<cmd>lua require'dap'.step_into()<cr>", opt)
keymap("n", "<f3>", "<cmd>lua require'dap'.step_over()<cr>", opt)
keymap("n", "<f4>", "<cmd>lua require'dap'.step_out()<cr>", opt)
keymap("n", "<f5>", "<cmd>lua require'dap'.repl.toggle()<cr>", opt)
keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opt)
keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opt)
keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opt)

keymap("n", "<leader>lu", ":Lazy update<cr>", opt)

-- -- Resize window using <ctrl> arrow keys
keymap("n", "<S-Up>", "<CMD>resize +2<CR>",opt)
keymap("n", "<S-Down>", "<CMD>resize -2<CR>",opt)
keymap("n", "<S-Left>", "<CMD>vertical resize -2<CR>",opt)
keymap("n", "<S-Right>", "<CMD>vertical resize +2<CR>",opt)


-- local wk = require("which-key",opt)

-- vim.o.timeoutlen = 300

-- wk.setup({
--   show_help = false,
--   triggers = "auto",
--   plugins = { spelling = true },
--   key_labels = { ["<leader>"] = "SPC" },
-- })



-- -- Switch buffers with tab
-- vim.keymap.set("n", "<S-TAB>", "<CMD>bprevious<CR>",opt)
-- vim.keymap.set("n", "<TAB>", "<CMD>bnext<CR>",opt)

-- -- Clear search with <esc>
-- vim.keymap.set({ "i", "n" }, "<esc>", "<CMD>noh<CR><esc>",opt)
-- vim.keymap.set("n", "gw", "*N",opt)
-- vim.keymap.set("x", "gw", "*N",opt)

-- -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true })
-- vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
-- vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
-- vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true })
-- vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })
-- vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })

-- -- save in insert mode
-- vim.keymap.set("i", "<C-s>", "<CMD>:w<CR><esc>",opt)
-- vim.keymap.set("n", "<C-s>", "<CMD>:w<CR><esc>",opt)

-- -- better indenting
-- vim.keymap.set("v", "<", "<gv",opt)
-- vim.keymap.set("v", ">", ">gv",opt)

-- local leader = {
--   g = {
--     name = "+git",
--     c = { "<CMD>Telescope git_commits<CR>", "commits" },
--     b = { "<CMD>lua require('gitsigns').blame_line{full=false}<CR>", "blame" },
--     s = { "<CMD>Telescope git_status<CR>", "status" },
--     d = {
--       name = "+diff",
--       o = { "<CMD>DiffviewOpen<CR>", "open" },
--       c = { "<CMD>DiffviewClose<CR>", "close" },
--       f = { "<CMD>DiffviewFocusFiles<CR>", "focus" },
--       h = { "<CMD>DiffviewFileHistory<CR>", "history" },
--     },
--   },
--   c = {
--     name = "+code",
--   },
--   l = {
--     name = "+lsp",
--     i = { "<CMD>Mason<CR>", "Manage Servers" },
--     l = { "<CMD>MasonLog<CR>", "See logs" }
--   },
--   w = {
--     name = "+window",
--     ["w"] = { "<C-W>p", "other-window" },
--     ["d"] = { "<C-W>c", "delete-window" },
--     ["-"] = { "<C-W>s", "split-window-below" },
--     ["|"] = { "<C-W>v", "split-window-right" },
--     ["2"] = { "<C-W>v", "layout-double-columns" },
--     ["h"] = { "<C-W>h", "window-left" },
--     ["j"] = { "<C-W>j", "window-below" },
--     ["l"] = { "<C-W>l", "window-right" },
--     ["k"] = { "<C-W>k", "window-up" },
--     ["H"] = { "<C-W>5<", "expand-window-left" },
--     ["J"] = { ":resize +5", "expand-window-below" },
--     ["L"] = { "<C-W>5>", "expand-window-right" },
--     ["K"] = { ":resize -5", "expand-window-up" },
--     ["="] = { "<C-W>=", "balance-window" },
--     ["s"] = { "<C-W>s", "split-window-below" },
--     ["v"] = { "<C-W>v", "split-window-right" },
--   },
--   h = {
--     name = "+help",
--     t = {
--       name = "+theming",
--       l = { "<CMD>Catppuccin latte<CR>", "Catppuccin Latte" },
--       f = { "<CMD>Catppuccin frappe<CR>", "Catppuccin frappe" },
--       m = { "<CMD>Catppuccin macchiato<CR>", "Catppuccin Macchiato" },
--       c = { "<CMD>Catppuccin mocha<CR>", "Catppuccin Mocha" },
--     },
--     p = {
--       name = "+package-management",
--       i = { "<CMD>Lazy install<CR>", "Install Packages" },
--       u = { "<CMD>Lazy update<CR>", "Update Packages" },
--       c = { "<CMD>Lazy clear<CR>", "Clear Unused" },
--       s = { "<CMD>Lazy sync<CR>", "Sync All" },
--     },
--     h = { "<CMD>:checkhealth<CR>", "Check Health" },
--     c = { "<CMD>:Telescope commands<CR>", "Commands" },
--     s = { "<CMD>:Telescope highlights<CR>", "Search Highlight Groups" },
--   },
--   s = {
--     name = "+search",
--     g = { "<CMD>Telescope live_grep<CR>", "Grep" },
--     b = { "<CMD>Telescope current_buffer_fuzzy_find<CR>", "Buffer" },
--     s = {
--       function()
--         require("telescope.builtin",opt).lsp_document_symbols({
--           symbols = {
--             "Class",
--             "Function",
--             "Method",
--             "Constructor",
--             "Interface",
--             "Module",
--             "Struct",
--             "Trait",
--             "Field",
--             "Property",
--           },
--         })
--       end,
--       "Goto Symbol",
--     },
--     h = { "<CMD>Telescope command_history<CR>", "Command History" },
--     m = { "<CMD>Telescope marks<CR>", "Jump to Mark" },
--     r = { "<CMD>lua require('spectre').open()<CR>", "Replace (Spectre)" },
--   },
--   f = {
--     name = "+file",
--     f = { "<CMD>Telescope find_files<CR>", "Find File" },
--     r = { "<CMD>Telescope oldfiles<CR>", "Open Recent File" },
--     n = { "<CMD>enew<CR>", "New File" },
--   },
--   n = {
--     name = "+filetree",
--     n = { "<CMD>Neotree toggle<CR>", "File Explorer" },
--     r = { "<CMD>Neotree reveal<CR>", "Reveal" }
--   },
--   t = {
--     name = "+testing",
--     f = { "<CMD>lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "Test File" },
--     o = { "<CMD>lua require('neotest').output.open({enter = true})<CR>", "Open Output" },
--     s = { "<CMD>lua require('neotest').summary.toggle()<CR>", "Toggle Summary" }
--   },
--   x = {
--     name = "+errors",
--     x = { "<CMD>TroubleToggle workspace_diagnostics<CR>", "Trouble" },
--     l = { "<CMD>TroubleToggle loclist<CR>", "Open Location List" },
--     q = { "<CMD>TroubleToggle quickfix<CR>", "Open Quickfix List" },
--   },
--   b = {
--     name = "+buffer",
--     ["b"] = { "<CMD>:e #<CR>", "Switch to Other Buffer" },
--     ["p"] = { "<CMD>:BufferLineCyclePrev<CR>", "Previous Buffer" },
--     ["["] = { "<CMD>:BufferLineCyclePrev<CR>", "Previous Buffer" },
--     ["n"] = { "<CMD>:BufferLineCycleNext<CR>", "Next Buffer" },
--     ["]"] = { "<CMD>:BufferLineCycleNext<CR>", "Next Buffer" },
--     ["x"] = { "<CMD>:bd<CR>", "Delete Buffer & Window" },
--   },
-- }

-- wk.register(leader, { prefix = "<leader>" })
-- wk.register({ g = { name = "+goto" } })
