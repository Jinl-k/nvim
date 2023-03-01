-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
-- https://github.com/nvim-treesitter/nvim-treesitter-context
local M = {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPost",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-refactor",
        "nvim-treesitter/nvim-treesitter-context",
				'nvim-treesitter/nvim-treesitter-textobjects',
				 "windwp/nvim-ts-autotag" ,
				 "mrjones2014/nvim-ts-rainbow" ,
    },
    opts = {
        highlight = {
            enable = true,
            disable = function(lang, buf)
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
            additional_vim_regex_highlighting = false,
        },
				textobjects = {
					select = {
						enable = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["<leader>a"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]["] = "@function.outer",
							["]m"] = "@class.outer",
						},
						goto_next_end = {
							["]]"] = "@function.outer",
							["]M"] = "@class.outer",
						},
						goto_previous_start = {
							["[["] = "@function.outer",
							["[m"] = "@class.outer",
						},
						goto_previous_end = {
							["[]"] = "@function.outer",
							["[M"] = "@class.outer",
						},
					},
					lsp_interop = {
						enable = true,
						border = 'none',
						floating_preview_opts = {},
						peek_definition_code = {
							["<leader>df"] = "@function.outer",
							["<leader>dF"] = "@class.outer",
						},
					},
				},
				 -- nvim-ts-rainbow
        rainbow = {
            enable = true,
            extended_mode = true,
            -- Do not enable for files with more than 1000 lines, int
            max_file_lines = 2000,
        },
        autopairs = { enable = true },
        autotag = { enable = true },
        indent = { enable = true },
        ensure_installed = { "lua", "markdown", "markdown_inline", "vue", "javascript","typescript","html","css","json","scss"}, 
        sync_install = true,
        ignore_install = {}, -- List of parsers to ignore installation
        refactor = {
            highlight_definitions = {
                enable = true,
                -- Set to false if you have an `updatetime` of ~100.
                clear_on_cursor_move = true,
            },
            highlight_current_scope = { enable = false },
        },
    },
    config = function(_, opts)
				require("nvim-ts-autotag").setup({
					filetypes = {
						"html",
						"javascript",
						"javascriptreact",
						"typescript",
						"typescriptreact",
						"vue",
						"xml",
					},
				})
        require("nvim-treesitter.configs").setup(opts)
        require("treesitter-context").setup({
					enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
					-- max_lines = 2, -- How many lines the window should span. Values <= 0 mean no limit.
					trim_scope = "outer", -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
					mode = "topline", -- Line used to calculate context. Choices: 'cursor', 'topline'
					patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
						-- For all filetypes
						default = {
							'class',
							'function',
							'method',
							'for',
							'while',
							'if',
							'switch',
							'case',
							'interface',
							'struct',
							'enum',
						},
						tex = {
            'chapter',
            'section',
            'subsection',
            'subsubsection',
						},
						haskell = {
								'adt'
						},
						rust = {
								'impl_item',

						},
						terraform = {
								'block',
								'object_elem',
								'attribute',
						},
						scala = {
								'object_definition',
						},
						vhdl = {
								'process_statement',
								'architecture_body',
								'entity_declaration',
						},
						markdown = {
								'section',
						},
						elixir = {
								'anonymous_function',
								'arguments',
								'block',
								'do_block',
								'list',
								'map',
								'tuple',
								'quoted_content',
						},
						json = {
								'pair',
						},
						typescript = {
								'export_statement',
						},
						yaml = {
								'block_mapping_pair',
						},
					},
				})
    end,
}

return M
