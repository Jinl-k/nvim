return {
	 'CRAG666/code_runner.nvim', 
    dependencies = "nvim-lua/plenary.nvim",
		event = "BufRead",
		config = function()
			require('code_runner').setup {
				-- choose default mode (valid term, tab, float, toggle, buf)
				mode = 'float',
				-- Focus on runner window(only works on toggle, term and tab mode)
				focus = true,
				-- startinsert (see ':h inserting-ex')
				startinsert = false,
				term = {
					-- Position to open the terminal, this option is ignored if mode is tab
					position = "bot",
					-- window size, this option is ignored if tab is true
					size = 8,
				},
				float = {
					-- Key that close the code_runner floating window
					close_key = 'q',
					-- Window border (see ':h nvim_open_win')
					border = "rounded",
					-- Num from `0 - 1` for measurements
					height = 0.4,
					width = 0.3,
					x = 0.9,
					y = 0.1,
					-- Highlight group for floating window/border (see ':h winhl')
					border_hl = "FloatBorder",
					float_hl = "Normal",
					-- Transparency (see ':h winblend')
					blend = 0,
				},
				filetype_path = "", -- No default path defined
				filetype = {
					javascript = "node",
					java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
					c = "cd $dir && gcc $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
					cpp = "cd $dir && g++ $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt",
					python = "python -u",
					sh = "bash",
					rust = "cd $dir && rustc $fileName && $dir$fileNameWithoutExt",
					typescript = "deno run",
        	typescriptreact = "pnpm dev$end",
				},
				project_path = "",
				project = {},
		
		}
	end
}