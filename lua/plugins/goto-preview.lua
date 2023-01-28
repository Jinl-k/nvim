
return {
  'rmagatti/goto-preview',
	event = 'BufRead',
  config = function()

		 vim.keymap.set("n", "<leader>w", "<C-w>w")
		--  vim.keymap.set("n", "<leader>pk", "<cmd>lua require('goto-preview').goto_preview_definition(false, true)<CR>") 
    require('goto-preview').setup {
			default_mappings = false,
			resizing_mappings = true,
			winblend = 10,
			debug = false,
			width = 80; -- Width of the floating window
			height = 25; -- Height of the floating window
			-- border = {"↖", "─" ,"┐", "│", "┘", "─", "└", "│"}; -- Border characters of the floating window
			-- default_mappings = false; -- Bind default mappings
			-- debug = false; -- Print debug information
			-- opacity = nil; -- 0-100 opacity level of the floating window where 100 is fully transparent.
			-- resizing_mappings = true; -- Binds arrow keys to resizing the floating window.
			-- post_open_hook = nil; -- A function taking two arguments, a buffer and a window to be ran as a hook.
			-- references = { -- Configure the telescope UI for slowing the references cycling window.
			-- 	telescope = require("telescope.themes").get_dropdown({ hide_preview = false })
			-- };
			-- -- These two configs can also be passed down to the goto-preview definition and implementation calls for one off "peak" functionality.
			-- focus_on_open = true; -- Focus the floating window when opening it.
			-- dismiss_on_move = false; -- Dismiss the floating window when moving the cursor.
			-- force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
			-- bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden
		}
  end
}