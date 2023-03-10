-- https://github.com/ray-x/web-tools.nvim
return{
	'ray-x/web-tools.nvim',
	event = 'BufRead',
	-- enabled = false,
	config = function()
		require'web-tools'.setup({
			keymaps = {
				rename = false,  -- by default use same setup of lspconfig
				-- repeat_rename = '.', -- . to repeat
			},
			hurl = {  -- hurl default
				show_headers = false, -- do not show http headers
				floating = false,   -- use floating windows (need guihua.lua)
				formatters = {  -- format the result by filetype
					json = { 'jq' },
					html = { 'prettier', '--parser', 'html' },
				},
			},
		})

	end
}

-- https://browsersync.io/docs/command-line
-- BrowserSync {args}	run browser-sync server with args
-- BrowserOpen {args}	open browser-sync, if browser-sync is not start, start it with args
-- BrowserPreview {-f --port 3000}	preview current file with browser sync
-- BrowserRestart	restart browser sync
-- Browserstop	stop browser sync
-- TagRename {newname}	rename html tag
-- HurlRun {args}	Run Hurl, when in Visual mode, run selected snippets