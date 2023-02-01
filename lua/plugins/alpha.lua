return {
    'goolord/alpha-nvim',
    lazy = true,
		-- enabled = false,
		event = "BufWinEnter",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function() 
			local alpha = require("alpha")
			local dashboard = require("alpha.themes.dashboard")
			-- Set header
			dashboard.section.header.val = {
    -- "                                                                                  ",
    -- "                                                                                  ",
    -- "                      *((##*                                                      ",
    -- "                  /###%%#%&&&%,                           .%((//(/.               ",
    -- "                  #%%&&&&@@@@@@@*                        #%#&%@&%%##%%            ",
    -- "                 &&&@@@@@@@@@@@@@   .**(/(,*,/,*,       &@@@@@@@@@&&%%%*          ",
    -- "                 @@@@@@@@@@&@*                         %@@@@@@@@@@@@&&&&          ",
    -- "                  @@@@%/,               ,                 /@&%@@@@@@@&&&*         ",
    -- "                   &@,                 .                      /%@@@@@@@&.         ",
    -- "                .(..                  ,                         *#@@@@@#          ",
    -- "              .(                                                 .@@@@*           ",
    -- "              #                                                    (              ",
    -- "             ,             *%@%             .@@@@&*                 ,             ",
    -- "          *            /@@@@@@&            @@@@@@@@&                .*            ",
    -- "          ,            @@@@@@@@,   ...  .   .@@@@@@@@@                 /          ",
    -- "          /           @@@@@@/                  *&@@@@@&                           ",
    -- "         /           ,@&@@@.    %@@@@@@@@@,     .#@@@&&                 ,         ",
    -- "         #            (%%%/    *@@@@@@@@@%*      *&%#(*                 /         ",
    -- "         *        .     .           /                   , .,.                     ",
    -- "          .                /                     *                      *         ",
    -- "          *                #.    ./%,%/.      ,%                       /..        ",
    -- "          .,                                                        ,,*  *        ",
    -- "            %*                                 (%%#%%(,          *&*..    ,       ",
    -- "           ,/**#@%,**         ........ ...    #&&&@&&&%%%&(,#@@@@@&##%(%%#,,.     ",
    -- "          .%@@@@@@@@@@@@@@@@@@@@@@@&@@@@@@@@@(@@@@@@&&@@%&%%&&&#@@@@@@@@&&&%(,    ",
    -- "          (%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.@@@@@@@@@@@@@@@&&%&@%&@@@@@@@@@%#,   ",
    -- "        *&@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@&%&&*&@@@@@@&&#.  ",
    -- "        &@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@/@@@@@@@@@@@@@@@@@@@@@&@@@&&(@@@@@@&%* ",
    -- "      .#@@@@@@@@@@@@@@@@@@@@@@@@@@@&@@@%@@@(@@@@@@@@@@@@@@@@@@@@@@@@@&@@@@##@@@@#.",


				[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣠⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣡⣾⣿⣿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣟⠻⣿⣿⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣿⣿⣿⡿⢫⣷⣿⣿⣿⣿⣿⣿⣿⣾⣯⣿⡿⢧⡚⢷⣌⣽⣿⣿⣿⣿⣿⣶⡌⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣿⣿⣿⠇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⣇⣘⠿⢹⣿⣿⣿⣿⣿⣻⢿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣿⣿⣿⠀⢸⣿⣿⡇⣿⣿⣿⣿⣿⣿⣿⣿⡟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣦⣻⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣿⣿⡇⠀⣬⠏⣿⡇⢻⣿⣿⣿⣿⣿⣿⣿⣷⣼⣿⣿⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⢻⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣿⣿⠀⠈⠁⠀⣿⡇⠘⡟⣿⣿⣿⣿⣿⣿⣿⣿⡏⠿⣿⣟⣿⣿⣿⣿⣿⣿⣿⣿⣇⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣿⡏⠀⠀⠐⠀⢻⣇⠀⠀⠹⣿⣿⣿⣿⣿⣿⣩⡶⠼⠟⠻⠞⣿⡈⠻⣟⢻⣿⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⢿⠀⡆⠀⠘⢿⢻⡿⣿⣧⣷⢣⣶⡃⢀⣾⡆⡋⣧⠙⢿⣿⣿⣟⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⡥⠂⡐⠀⠁⠑⣾⣿⣿⣾⣿⣿⣿⡿⣷⣷⣿⣧⣾⣿⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⡿⣿⣍⡴⠆⠀⠀⠀⠀⠀⠀⠀⠀⣼⣄⣀⣷⡄⣙⢿⣿⣿⣿⣿⣯⣶⣿⣿⢟⣾⣿⣿⢡⣿⣿⣿⣿⣿]],
				[[⣿⡏⣾⣿⣿⣿⣷⣦⠀⠀⠀⢀⡀⠀⠀⠠⣭⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⣡⣾⣿⣿⢏⣾⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⣿⣿⣿⣿⣿⡴⠀⠀⠀⠀⠀⠠⠀⠰⣿⣿⣿⣷⣿⠿⠿⣿⣿⣭⡶⣫⠔⢻⢿⢇⣾⣿⣿⣿⣿⣿⣿]],
				[[⣿⣿⣿⡿⢫⣽⠟⣋⠀⠀⠀⠀⣶⣦⠀⠀⠀⠈⠻⣿⣿⣿⣾⣿⣿⣿⣿⡿⣣⣿⣿⢸⣾⣿⣿⣿⣿⣿⣿⣿]],
				[[⡿⠛⣹⣶⣶⣶⣾⣿⣷⣦⣤⣤⣀⣀⠀⠀⠀⠀⠀⠀⠉⠛⠻⢿⣿⡿⠫⠾⠿⠋⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
				[[⢀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣀⡆⣠⢀⣴⣏⡀⠀⠀⠀⠉⠀⠀⢀⣠⣰⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
				[[⠿⠛⠛⠛⠛⠛⠛⠻⢿⣿⣿⣿⣿⣯⣟⠷⢷⣿⡿⠋⠀⠀⠀⠀⣵⡀⢠⡿⠋⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿]],
				[[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⢿⣿⣿⠂⠀⠀⠀⠀⠀⢀⣽⣿⣿⣿⣿⣿⣿⣿⣍⠛⠿⣿⣿⣿⣿⣿⣿]],
			}
			dashboard.section.header.opts.hl = "Type"

			local function button(sc, txt, keybind, keybind_opts)
				local b = dashboard.button(sc, txt, keybind, keybind_opts)
				b.opts.hl = "AlphaButton"
				b.opts.hl_shortcut = "AlphaButtonShortcut"
				return b
			end

			dashboard.section.buttons.val = {
				button("", "Session", "<cmd>Telescope persisted<cr>"),
				button("", "Project find", "<C-p>"),
				button("", "File Browser"),
				-- button("space f r", "  File frecency", "<cmd>Telescope frecency<cr>"),
				-- button("space f e", "  File history", "<cmd>Telescope oldfiles<cr>"),
				button("", "Update Plugins"),
				button("", "Quit", "<Cmd>qa<CR>"),
			}
			dashboard.section.buttons.opts.hl = "String"

			local function footer()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				return "   生命在于折腾!"
					.. "   v"
					.. vim.version().major
					.. "."
					.. vim.version().minor
					.. "."
					.. vim.version().patch
					.. "   "
					.. stats.count
					.. " plugins in "
					.. ms
					.. "ms"
			end

			dashboard.section.footer.val = footer()
			dashboard.section.footer.opts.hl = "Function"

			local head_butt_padding = 2
			local occu_height = #dashboard.section.header.val + 2 * #dashboard.section.buttons.val + head_butt_padding
			local header_padding = math.max(0, math.ceil((vim.fn.winheight("$") - occu_height) * 0.25))
			local foot_butt_padding = 1

			dashboard.config.layout = {
				{ type = "padding", val = header_padding },
				dashboard.section.header,
				{ type = "padding", val = head_butt_padding },
				dashboard.section.buttons,
				{ type = "padding", val = foot_butt_padding },
				dashboard.section.footer,
			}
			alpha.setup(dashboard.config)
			-- hide tabline and statusline on startup screen
			vim.api.nvim_create_autocmd("User", {
				pattern = "LazyVimStarted",
				callback = function()
					dashboard.section.footer.val = footer()
					pcall(vim.cmd.AlphaRedraw)
				end,
			})
		end,
}








