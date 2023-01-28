return{
  "princejoogie/chafa.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "m00qek/baleia.nvim"
  },
	lazy = false,
	config = function()
		require("chafa").setup({
			render = {
				min_padding = 5,
				show_label = true,
			},
			events = {
				update_on_nvim_resize = true,
			},
		})
	end
}