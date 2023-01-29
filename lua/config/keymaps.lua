-- :echo &filetype 查看文件类型
local utils = require("utils")
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
keymap("n", "<C-M-j>", ":m .+1<cr>==", { desc = "Move down" })
keymap("v", "<C-M-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
keymap("i", "<C-M-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
keymap("n", "<C-M-k>", ":m .-2<cr>==", { desc = "Move up" })
keymap("v", "<C-M-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
keymap("i", "<C-M-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })
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
keymap({"n","i"}, "<M-l>", "<cmd>BufferLineCycleNext<cr>",{ silent = true })
keymap({"n","i"}, "<M-h>", "<cmd>BufferLineCyclePrev<cr>",{ silent = true })

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
-- 	utils.toggle("wrap")
-- end, { desc = "Toggle Word Wrap" })

-- keymap("n", "<leader>td", utils.toggle_diagnostics, { desc = "Toggle Diagnostics" })
