	 return{
        -- only needed if you want to use the commands with "_with_window_picker" suffix
        's1n7ax/nvim-window-picker',
				lazy = false,
        -- tag = "v1.*",
        config = function()
					local picker = require("window-picker")
					vim.keymap.set("n", "<leader>w", function()
						local picked_window_id = picker.pick_window() or vim.api.nvim_get_current_win()
						vim.api.nvim_set_current_win(picked_window_id)
					end, { desc = "Pick a window" })
          require'window-picker'.setup({
            autoselect_one = true,
            include_current = false,
            filter_rules = {
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { "neo-tree", "neo-tree-popup", "notify", "quickfix", "neotest-summary" },

                -- if the buffer type is one of following, the window will be ignored
                buftype = { 'terminal', "quickfix" },
              },
            },
            other_win_hl_color = '#e35e4f',
          })
        end,
      }