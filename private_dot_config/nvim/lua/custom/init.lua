local o = vim.opt

o.encoding = "UTF-8"
-- Always on
-- o.nocompatible = true           -- disable compatibility to old-time vi
o.showmatch = true               -- show matching
o.ignorecase = true              -- case insensitive
-- o.mouse=v                 -- middle-click paste with
o.hlsearch = true                -- highlight search
o.incsearch = true               -- incremental search
o.tabstop = 2               -- number of columns occupied by a tab
o.softtabstop = 2           -- see multiple spaces as tabstops so <BS> does the right thing
o.expandtab = true               -- converts tabs to white space
o.shiftwidth = 2            -- width for autoindents
o.autoindent = true              -- indent a new line the same amount as the line just typed
o.number = true                  -- add line numbers
o.relativenumber = true          -- add relative numbers
o.wildmode=longest,list   -- get bash-like tab completions
-- o.cc=80                  -- set an 80 column border for good coding style
o.mouse = "a"                 -- enable mouse click
o.clipboard = "unnamedplus"   -- using system clipboard
o.cursorline = true              -- highlight current cursorline
o.ttyfast = true                 -- Speed up scrolling in Vim
-- o.spell = true                 -- enable spell check (may need to download language package)
-- o.noswapfile = true           -- disable creating swap file
-- o.backupdir = ~/.cache/vim-- Directory to store backup files.
o.textwidth = 0             -- Disable text width
o.wrapmargin = 0            -- Disable wrapmargin
o.wrap = true                   -- Set wrap, if char exceep window lim, display as if newlined (Actually not)
o.scrolloff=5             -- keep 4 lines below/above cursor when scrolling
o.ruler = true                   -- show current position
o.lazyredraw = true             -- lazyredraw
o.equalalways = false          -- do not equalize the size of the buffers
o.magic = true                   -- regular expressions
o.backup = false
o.writebackup = false
o.updatetime = 300
o.signcolumn = "yes"
o.termguicolors = true


vim.cmd([[
filetype plugin indent on   " allow auto-indenting depending on file type
syntax on                   " syntax highlighting
]])


-- Return to last edit position when opening files
vim.cmd([[
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
]])
