
return {
  "rmagatti/session-lens",
	lazy = true,
	enabled = false,
  config = function()
		require('session-lens').setup({
			prompt_title = 'SESSIONS',
			-- path_display = {'shorten'},
			-- theme = 'ivy', -- default is dropdown
			theme_conf = { border = rounded },
			previewer = false
		})
		require('telescope.themes').get_dropdown(theme_conf)
    require("telescope").load_extension("session-lens")
  end,
}
		
	