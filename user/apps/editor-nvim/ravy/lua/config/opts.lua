vim.opt.tabstop = size
vim.opt.softtabstop = size
vim.opt.shiftwidth = size

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- Line Numbers
vim.opt.number = true             -- Enable absolute line numbers
vim.opt.relativenumber = true     -- Enable relative line numbers

-- Indentation
local size = 4
vim.opt.tabstop = size            -- Number of spaces a tab counts for
vim.opt.shiftwidth = size         -- Number of spaces for auto-indent
vim.opt.expandtab = false          -- Use spaces instead of tabs
vim.opt.smartindent = true        -- Enable smart indentation
vim.opt.autoindent = true         -- Maintain the indentation level

-- Clipboard
vim.opt.clipboard = "unnamedplus" -- Use system clipboard

-- Color Scheme and Syntax Highlighting
vim.opt.syntax = "on"             -- Enable syntax highlighting
vim.opt.termguicolors = true      -- Enable 24-bit color support

-- Command-Line Completion
vim.opt.wildmenu = true           -- Enable enhanced command-line completion
vim.opt.wildmode = { "longest:full", "full" } -- Command-line completion behavior

-- Search Settings
vim.opt.ignorecase = true         -- Case-insensitive search
vim.opt.smartcase = true          -- Case-sensitive if search has uppercase characters
vim.opt.incsearch = true          -- Incremental search
vim.opt.hlsearch = true           -- Highlight search matches

-- Window Splitting
vim.opt.splitbelow = true         -- Horizontal splits open below
vim.opt.splitright = true         -- Vertical splits open to the right

-- Undo and Backup
vim.opt.undofile = true           -- Enable persistent undo
vim.opt.undodir = vim.fn.expand("~/vim-undo") -- Set undo directory
vim.opt.backup = false            -- Disable backup files
vim.opt.swapfile = false          -- Disable swap files
vim.opt.writebackup = false       -- Disable backup before overwriting

-- Scrolling and Navigation
vim.opt.scrolloff = 8             -- Keep 8 lines visible above/below the cursor
vim.opt.sidescrolloff = 8         -- Keep 8 characters visible to the left/right

-- Buffer Management
vim.opt.hidden = true             -- Allow switching buffers without saving

-- Cursor Hold Time
vim.opt.updatetime = 300          -- Faster completion (for plugins like gitgutter)

-- Mouse Support
vim.opt.mouse = "a"               -- Enable mouse support

-- Text Wrapping
vim.opt.wrap = false              -- Enable line wrapping
vim.opt.linebreak = true          -- Wrap lines at words, not mid-word

-- Performance Optimization
vim.opt.lazyredraw = true         -- Do not redraw screen during macros/scripts

-- Cursor Appearance (optional, for a GUI-like experience)
vim.opt.guicursor = "n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor/lCursor,r-cr:hor20"


-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }


