return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup({
				options = {
					theme = 'auto', -- Or your preferred theme
				}
			})

			-- Simulate opacity by using a slightly translucent-like color
			vim.cmd([[
				highlight! LualineNormal guibg=#1e1e1e ctermbg=234
				highlight! LualineInsert guibg=#1e1e1e ctermbg=234
				highlight! LualineVisual guibg=#1e1e1e ctermbg=234
				highlight! LualineReplace guibg=#1e1e1e ctermbg=234
				highlight! LualineCommand guibg=#1e1e1e ctermbg=234
				highlight! LualineInactive guibg=#1e1e1e ctermbg=234
			]])
		end
	}
}

