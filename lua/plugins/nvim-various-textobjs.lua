return {
	"chrisgrieser/nvim-various-textobjs",
	lazy = false,
	config = function () 
		require("various-textobjs").setup({ lookForwardLines = 5,useDefaultKeymaps = true })
	end,
}