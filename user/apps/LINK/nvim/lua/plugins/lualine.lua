-- this plugin for the bottom bar


return {
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
		config = function()
			require('lualine').setup({
				options = {
					theme = 'auto', -- Keep your current theme or set it here
					-- other Lualine configuration options...
				}
			})
			vim.cmd([[
				highlight! LualineNormal guibg=NONE ctermbg=NONE
				highlight! LualineInsert guibg=NONE ctermbg=NONE
				highlight! LualineVisual guibg=NONE ctermbg=NONE
				highlight! LualineReplace guibg=NONE ctermbg=NONE
				highlight! LualineCommand guibg=NONE ctermbg=NONE
				highlight! LualineInactive guibg=NONE ctermbg=NONE
			]])
		end
	}
}
