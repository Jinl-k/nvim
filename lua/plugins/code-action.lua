return{
  'weilbith/nvim-code-action-menu',
	event = 'BufRead',
  -- cmd = 'CodeActionMenu',
	config = function()
		 vim.g.code_action_menu_window_border ='rounded'
		 vim.g.code_action_menu_show_action_kind = true
		 vim.g.code_action_menu_show_details = false
		 vim.g.code_action_menu_show_diff = true
	end
}