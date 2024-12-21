return {
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			-- TODO: lala
			-- FIX: lolo
			-- HACK: lele
			-- PERF: dada
			-- NOTE: dodo
			-- WARNING: dede
		},
		config = function()
			require("todo-comments").setup({
				gui_style = {
					fg = "BOLD", -- The gui style to use for the fg highlight group.
					bg = "BOLD", -- The gui style to use for the bg highlight group.
				},
			})

			vim.keymap.set("n", "<leader>ft", "<cmd>:TodoTelescope keywords=TODO,FIX,HACK,PERF,NOTE,WARNING<cr>",
				{ desc = "TodoTelescope" })

			vim.keymap.set("n", "]t", function()
				require("todo-comments").jump_next()
			end, { desc = "Next todo comment" })

			vim.keymap.set("n", "[t", function()
				require("todo-comments").jump_prev()
			end, { desc = "Previous todo comment" })

			-- You can also specify a list of valid jump keywords

			vim.keymap.set("n", "]e", function()
				require("todo-comments").jump_next({ keywords = { "ERROR", "WARNING" } })
			end, { desc = "Next error/warning todo comment" })
		end
	}
}
