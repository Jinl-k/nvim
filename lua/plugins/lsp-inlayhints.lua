return{
	"lvimuser/lsp-inlayhints.nvim",
	event = "BufReadPre",
	-- enabled = false,
	config = function()
		require("lsp-inlayhints").setup ()
			-- enabled_at_startup = true,
      --   inlay_hints = {
      --     only_current_line = true,
      --   },
      
	end
}