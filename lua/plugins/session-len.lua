
return {
  "rmagatti/auto-session",
	lazy = true,
	dependencies = 'rmagatti/session-lens',
  config = function()
		require('session-lens').setup({
			-- prompt_title = 'YEAH SESSIONS',
			-- path_display = {'shorten'},
			theme = 'ivy', -- default is dropdown
			-- theme_conf = { border = rounded },
			-- previewer = true
		})
    require("telescope").load_extension("session-lens")
  end,
}
		
	