return { 
	'echasnovski/mini.ai',
	version = false,
	event = "VeryLazy",
	opts = function()
      local ai = require("mini.ai")
      return {
        n_lines = 500,
				search_method = 'cover_or_next',
				-- Next/last variants
				around_next = 'aL',
				inside_next = 'iL',
				around_last = 'al',
				inside_last = 'il',
        custom_textobjects = {
          o = ai.gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
        },
      }
  end,
	config = function(_, opts)
		local ai = require("mini.ai")
		ai.setup(opts)
	end,

	-- 			-- Move cursor to corresponding edge of `a` textobject
	-- 			goto_left = 'g[',
	-- 			goto_right = 'g]',
	-- 		},

	-- 		-- How to search for object (first inside current line, then inside
	-- 		-- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
	-- 		-- 'cover_or_nearest', 'next', 'previous', 'nearest'.
	-- 		search_method = 'cover_or_next',
	-- },

}