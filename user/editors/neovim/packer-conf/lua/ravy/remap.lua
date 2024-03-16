vim.g.mapleader = " "
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- vim.keymap.set("n", "<leader>vwm", function()
--     require("vim-with-me").StartVimWithMe()
-- end)
-- vim.keymap.set("n", "<leader>svwm", function()
--     require("vim-with-me").StopVimWithMe()
-- end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")


vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.jet("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- :s
vim.keymap.set("n", "<leader>r", function()
    vim.cmd("so")
end)

-- NvimTree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>E', ':NvimTreeFocus<CR>')

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG")

-- Split window
vim.keymap.set('n', '<leader>s', ':split<CR>')
vim.keymap.set('n', '<leader>v', ':vsplit<CR>')

-- Quit current window
vim.keymap.set('n', '<leader>q', ':q<CR>')

-- Save all files
vim.keymap.set('n', '<leader>w', ':wa<CR>')

-- Format file
vim.keymap.set("n", "<leader>i", vim.lsp.buf.format)

-- Resize and move to the left
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<M-h>', ':vertical resize -10<CR>')

-- Resize and move to the right
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<M-l>', ':vertical resize +10<CR>')

-- Resize and move upwards
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<M-k>', ':resize -10<CR>')

-- Resize and move downwards
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<M-j>', ':resize +10<CR>')

