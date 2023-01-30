return {
	"chrisgrieser/nvim-various-textobjs",
	lazy = false,
	-- enabled = false, 
	config = function () 
		require("various-textobjs").setup({ lookForwardLines = 50,useDefaultKeymaps = true })
	end,
}