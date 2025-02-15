return {
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = function()
			require("toggleterm").setup()

			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set('t', '<M-i>', [[<C-\><C-n>]], opts)
				vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
				vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
			end

			vim.keymap.set({ 'n', 't' }, '<M-j>', '<cmd>ToggleTerm<cr>', {})

			vim.keymap.set('n', '<leader>tf', '<cmd>ToggleTerm direction=float<cr>', { desc = 'terminal float' })
			vim.keymap.set('n', '<leader>tv', '<cmd>ToggleTerm direction=vertical<cr>', { desc = 'terminal vertical' })
			vim.keymap.set('n', '<leader>th', '<cmd>ToggleTerm direction=horizontal<cr>',
				{ desc = 'terminal horizontal' })
			vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm direction=tab<cr>', { desc = 'terminal tab' })
			vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
		end,
	},
}
