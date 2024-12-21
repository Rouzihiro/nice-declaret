-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')
vim.keymap.set('n', ';', ':')
vim.keymap.set({ 'n' }, '<leader>aa', 'ggVG', { noremap = true })
vim.keymap.set({ 'n' }, '<leader>w', ':w <CR>', { noremap = true })
vim.keymap.set({ 'n' }, '<leader>W', ':wa <CR>', { noremap = true })

vim.keymap.set("n", "<leader>n", ":noh<CR>", { desc = "Clear search highlight" })

vim.keymap.set('n', '<leader>z', function()
	local foldClosed = vim.fn.foldclosed('.')
	if foldClosed == -1 then
		-- Check if there are folds at the current level
		if vim.fn.foldlevel('.') > 0 then
			vim.cmd('normal! zc') -- Close fold
		else
			vim.notify("No fold found at the cursor", vim.log.levels.WARN)
		end
	else
		vim.cmd('normal! zo') -- Open fold
	end
end, { desc = "Toggle fold" })
