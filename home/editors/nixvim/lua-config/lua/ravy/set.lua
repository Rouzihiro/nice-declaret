vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
vim.o.guifont = "Monaspace Krypton:h10" -- text below applies for VimScript

-- Enable syntax highlighting
vim.cmd('syntax enable')

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Enable auto-indentation
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.smarttab = true

-- Enable clipboard support
vim.opt.clipboard = 'unnamedplus'


-- Enable line wrapping
vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

-- vim.opt.colorcolumn = "80"

vim.cmd [[

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

augroup transparent_signs
  au!
  autocmd ColorScheme * highlight SignColumn guibg=NONE
augroup END
]]
