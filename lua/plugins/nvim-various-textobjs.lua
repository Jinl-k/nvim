return {
	"chrisgrieser/nvim-various-textobjs",
	event = "VeryLazy",
	config = function () 
		require("various-textobjs").setup({ lookForwardLines = 50,useDefaultKeymaps = true })
	end,
}