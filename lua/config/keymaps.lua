-- :echo &filetype 查看文件类型
local keymap = vim.keymap.set
-- 取消高亮
keymap("n", "<leader>nh", ":nohl<CR>")
-- Remap command key
keymap("n", "<leader><leader>", ":")
keymap("n", "<leader><esc>", ":qa!<cr>")

-- 窗口
vim.api.nvim_set_keymap('n', '<leader>h', ':FocusSplitLeft<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':FocusSplitDown<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>k', ':FocusSplitUp<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':FocusSplitRight<CR>', { silent = true })
keymap("n", "qw", "<C-w>c") -- 关闭当前窗口 
keymap("n", "<leader>W", "<C-w>o") -- 关闭除当前的其他窗口 
-- keymap("n", "<leader>rv", "<C-w>v") -- 水平新增窗口 
-- keymap("n", "<leader>rh", "<C-w>s") -- 垂直新增窗口

-- 多光标
keymap("n", '<m-j>', ':call vm#commands#add_cursor_down(0, v:count1)<cr>', { noremap = true, silent = true })
keymap("n", '<m-k>', ':call vm#commands#add_cursor_up(0, v:count1)<cr>', { noremap = true, silent = true })

-- code run
keymap("n", '<c-i>', '<cmd>RunCode<CR>', { noremap = true, silent = true })
keymap('n', '<leader>rF', '<cmd>RunFile<CR>', { noremap = true, silent = true })
keymap('n', '<leader>rtf', '<cmd>RunFile tab<CR>', { noremap = true, silent = true })
keymap('n', '<leader>rP', '<cmd>RunProject<CR>', { noremap = true, silent = true })
keymap('n', '<leader>rc', '<cmd>RunClose<CR>', { noremap = true, silent = true })

-- 全局替换字符
keymap('n', '<leader>rp', "<cmd>lua require('spectre').open()<CR>", {  silent = true })
keymap('n', '<leader>rf', "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", {  silent = true })
keymap('n', '<leader>rwf', "viw:lua require('spectre').open_file_search()<cr>", {  silent = true })


-- trouble
keymap("n", "<leader>xx", "<cmd>TroubleToggle<cr>",{silent = true, noremap = true})
keymap("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>"  )
keymap("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>" ,{silent = true, noremap = true} )
keymap("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>" ,{silent = true, noremap = true} )
keymap("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>" ,{silent = true, noremap = true} )
keymap("n", "gR", "<cmd>TroubleToggle lsp_references<cr>" ,{silent = true, noremap = true} )
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
keymap({ "i","c", "t" }, "<m-w>", "<c-right>", { desc = "next word" })
keymap({ "i","c", "t" }, "<m-b>", "<c-left>", { desc = "previous word" })
-- 插入模式下移动
keymap({ "i","c", "t" }, "<c-k>", "<up>")
keymap({ "i","c", "t" }, "<c-j>", "<down>")	
keymap({ "i","c", "t" }, "<c-l>", "<right>")
keymap({ "i","c", "t" }, "<c-h>", "<left>")
-- Select all
keymap("n", "<C-a>", "ggVG<cr>", { desc = "Select all" })

-- Same file
-- keymap({ "i", "v", "n" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Clear search results
keymap("n", "<esc>", "<cmd>noh<cr>")

-- Better indenting
keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

-- Paste without replace clipboard
keymap("v", "p", '"_dP')



-- CLose buffer
-- keymap({ "i", "v", "n" }, "<C-w>", "<cmd>bd<cr><esc>", { desc = "Close buffer" })
-- keymap({ "i", "v", "n" }, "<C-M-w>", "<cmd>bd!<cr><esc>", { desc = "Close buffer" })
-- Exit neovim
keymap({ "i", "v", "n","t" }, "<C-q>", "<cmd>q<cr>", { desc = "Exit Vim" })
keymap({ "i", "v", "n","t"}, "<C-M-q>", "<cmd>qa!<cr>", { desc = "Exit Vim" })

-- neo-tree
-- keymap({ "i", "v", "n" }, "<leader>1", "<cmd>Neotree toggle<cr>", { desc = "Exit Vim" })
-- Better move
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "<D-[>", "g;")
keymap("n", "<D-]>", "g,")

-- Navigate buffers
-- keymap({"n","i"}, "<M-h>", "<CMD>bprevious<CR>")
-- keymap({"n","i"}, "<M-l>", "<CMD>bnext<CR>")
keymap({"n","i","t"}, "<c-q>", "<cmd>BufferDelete<cr>",{ silent = true })
keymap("n", "<leader>bq", 
						function() 
							vim.cmd("BufferLinePick") 
							vim.cmd("BufferDelete")
            end,{ silent = true })
keymap({"n","i"}, "<d-j>", "<cmd>BufferLineCycleNext<cr>",{ silent = true })
keymap({"n","i"}, "<d-k>", "<cmd>BufferLineCyclePrev<cr>",{ silent = true })

-- lsp
	local wk = require("which-key")
	-- Mappings.
	 wk.register({
		["<leader>g"] = {
			name = "LSP",
			-- a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
			a = { "<cmd>CodeActionMenu<cr>", "Code Action" },
			d = { "<cmd>Telescope lsp_definitions<cr>", "Definition" },
			t = { "<cmd>Telescope lsp_type_definitions<cr>", "Type Definition" },
			D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Declaration" },
			i = { "<cmd>Telescope lsp_implementations<cr>", "Implementation" },
			k = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
			K = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Signature Help" },
			l = { "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<cr>", "Line Diagnostics" },
			L = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Location List" },
			n = { "<cmd>lua vim.lsp.diagnostic.goto_next()<cr>", "Next Diagnostic" },
			p = { "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", "Previous Diagnostic" },
			q = { "<cmd>lua vim.lsp.diagnostic.set_qflist()<cr>", "Quick Fix List" },
			r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
			R = { "<cmd>Telescope lsp_references<cr>", "References" },
			s = { "<cmd>lua vim.lsp.buf.document_symbol()<cr>", "Document Symbols" },
			S = { "<cmd>lua vim.lsp.buf.workspace_symbol()<cr>", "Workspace Symbols" },
		}
	 })


vim.keymap.set('n', 'gd', '<cmd>lua require("goto-preview").goto_preview_definition()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gt', '<cmd>lua require("goto-preview").goto_preview_type_definition()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gi', '<cmd>lua require("goto-preview").goto_preview_implementation()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'gr', '<cmd>lua require("goto-preview").goto_preview_references()<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<leader>q', '<cmd>lua require("goto-preview").close_all_win()<CR>', { noremap = true, silent = true })
-- lspsga
-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>")
-- Rename
keymap("n", "ga", "<cmd>Lspsaga rename<CR>")
-- Rename word in whole project
keymap("n", "ga", "<cmd>Lspsaga rename ++project<CR>")
keymap("n", "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>")
-- -- Show cursor diagnostic
-- -- also like show_line_diagnostics  support pass ++unfocus
-- keymap("n", "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")
-- Show buffer diagnostic
-- keymap("n", "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>")
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")
-- -- Diagnostic jump with filter like Only jump to error
-- keymap("n", "[E", function()
--   require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
-- end)
-- keymap("n", "]E", function()
--   require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end)
keymap("n","<leader>o", "<cmd>Lspsaga outline<CR>")

-- Float terminal
keymap({"n", "t"}, "<leader>tt", "<cmd>Lspsaga term_toggle<CR>")
keymap({"n", "t"}, "<leader>th", "<Cmd>ToggleTerm direction=horizontal<CR>",{ silent = true })
keymap({"n", "t"}, "<leader>tv", "<Cmd>ToggleTerm direction=vertical<CR>",{ silent = true })
keymap({"n", "t"}, "<leader>tf", "<Cmd>ToggleTerm direction=float<CR>",{ silent = true })
keymap({"n", "t"}, "<leader>tt", "<Cmd>ToggleTerm<CR>",{ silent = true })
keymap({"n", "t"}, "<leader>tg", "<Cmd>lua toggle_lazygit()<CR>",{ silent = true })
local _lazygit = nil
_G.toggle_lazygit = function()
	if not _lazygit then
		local Terminal = require("toggleterm.terminal").Terminal
		_lazygit = Terminal:new({
			cmd = "lazygit",
			hidden = true,
			direction = "float",
		})
	end
	_lazygit:toggle()
end
-- function _G.set_terminal_keymaps()
--   local opts = {buffer = 0}
--   vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
--   vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
--   vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
--   vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
--   vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
--   vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
-- end

-- -- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')



-- -- Telescope
keymap("n","<C-e>", ":Telescope file_browser<CR>" ,{ noremap = true, silent = true })
keymap("n","<leader>ff", "<cmd>Telescope find_files<cr>" ,{ noremap = true, silent = true })
keymap("n","<C-p>", ":lua require('telescope').extensions.projects.projects()<CR>" ,{ noremap = true, silent = true })
-- keymap("n","<C-P>", "<cmd>lua require('telescope.builtin').commands()<cr>" ,{ noremap = true, silent = true })
keymap("n","<leader>fr", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>" ,{ noremap = true, silent = true })
-- 全部文件查找字符
keymap("n","<leader>F", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>" ,{ noremap = true, silent = true })
-- 当前文件查找字符
keymap("n","<C-f>", "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<cr>" ,{ noremap = true, silent = true })






-- Lsp formatting
keymap("n", "<leader>fa", function()
	vim.lsp.buf.format({ async = false })
	-- vim.api.nvim_command("write")
end, { noremap = true, silent = true },{ desc = "Lsp formatting" })

-- -- Open quickfix list
-- keymap("n", "<leader>q", function()
-- 	vim.diagnostic.setloclist()
-- end, { desc = "Open quickfix list" })

-- -- toggle options
-- keymap("n", "<leader>tw", function()
-- end, { desc = "Toggle Word Wrap" })




-- DAP
-- keymap("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", opts)
-- keymap("n", "<leader>dc", "<cmd>lua require'dap'.continue()<cr>", opts)
-- keymap("n", "<leader>di", "<cmd>lua require'dap'.step_into()<cr>", opts)
-- keymap("n", "<leader>do", "<cmd>lua require'dap'.step_over()<cr>", opts)
-- keymap("n", "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>", opts)
-- keymap("n", "<leader>dr", "<cmd>lua require'dap'.repl.toggle()<cr>", opts)
-- keymap("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>", opts)
-- keymap("n", "<leader>du", "<cmd>lua require'dapui'.toggle()<cr>", opts)
-- keymap("n", "<leader>dt", "<cmd>lua require'dap'.terminate()<cr>", opts)


-- local wk = require("which-key")

-- vim.o.timeoutlen = 300

-- wk.setup({
--   show_help = false,
--   triggers = "auto",
--   plugins = { spelling = true },
--   key_labels = { ["<leader>"] = "SPC" },
-- })

-- -- Resize window using <ctrl> arrow keys
-- vim.keymap.set("n", "<S-Up>", "<CMD>resize +2<CR>")
-- vim.keymap.set("n", "<S-Down>", "<CMD>resize -2<CR>")
-- vim.keymap.set("n", "<S-Left>", "<CMD>vertical resize -2<CR>")
-- vim.keymap.set("n", "<S-Right>", "<CMD>vertical resize +2<CR>")

-- -- Switch buffers with tab
-- vim.keymap.set("n", "<S-TAB>", "<CMD>bprevious<CR>")
-- vim.keymap.set("n", "<TAB>", "<CMD>bnext<CR>")

-- -- Clear search with <esc>
-- vim.keymap.set({ "i", "n" }, "<esc>", "<CMD>noh<CR><esc>")
-- vim.keymap.set("n", "gw", "*N")
-- vim.keymap.set("x", "gw", "*N")

-- -- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true })
-- vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
-- vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
-- vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true })
-- vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })
-- vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })

-- -- save in insert mode
-- vim.keymap.set("i", "<C-s>", "<CMD>:w<CR><esc>")
-- vim.keymap.set("n", "<C-s>", "<CMD>:w<CR><esc>")

-- -- better indenting
-- vim.keymap.set("v", "<", "<gv")
-- vim.keymap.set("v", ">", ">gv")

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
--         require("telescope.builtin").lsp_document_symbols({
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
