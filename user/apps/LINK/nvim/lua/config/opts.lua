vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- init.lua example
vim.o.number = true             -- Enable line numbers
vim.o.relativenumber = true     -- Disable relative line numbers
vim.o.clipboard = "unnamedplus" -- Use system clipboard

vim.opt.foldmethod = 'marker'   -- Set the fold method to manual
vim.opt.colorcolumn = "80"      -- Set the color column at column 80


-- Mouse Support
vim.opt.mouse = "a" -- Enable mouse support

-- Enable the cursorline highlight
vim.opt.cursorline = true

-- Indentation
local size = 2
vim.opt.tabstop = size     -- Number of spaces a tab counts for
vim.opt.shiftwidth = size  -- Number of spaces for auto-indent
vim.opt.softtabstop = size
vim.opt.expandtab = false  -- Use spaces instead of tabs
vim.opt.smartindent = true -- Enable smart indentation
vim.opt.autoindent = true  -- Maintain the indentation level

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }



-- Undo and Backup
vim.opt.undofile = true                       -- Enable persistent undo
vim.opt.undodir = vim.fn.expand("~/vim-undo") -- Set undo directory
vim.opt.backup = false                        -- Disable backup files
vim.opt.swapfile = false                      -- Disable swap files
vim.opt.writebackup = false                   -- Disable backup before overwriting

-- Scrolling and Navigation
vim.opt.scrolloff = 8     -- Keep 8 lines visible above/below the cursor
vim.opt.sidescrolloff = 8 -- Keep 8 characters visible to the left/right



-- Text Wrapping
vim.opt.wrap = false     -- Enable line wrapping
vim.opt.linebreak = true -- Wrap lines at words, not mid-word
