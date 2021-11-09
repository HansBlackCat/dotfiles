" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" CocInstall coc-json coc-tsserver coc-rust-analyzer coc-toml coc-markdownlint coc-pairs coc-eslint

Plug 'kyoz/purify', {'rtp': 'vim'}

Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" python3 -m pip install --user --upgrade pynvim

Plug 'valloric/youcompleteme', {'do': 'python3 ./install.py --clangd-completer'}
" https://vimawesome.com/plugin/youcompleteme

" Initialize plugin system
call plug#end()

" -----------------------------------------------------------------------------
" YCM
" set rtp+=~/.vim/bundle/YouCompleteMe
autocmd BufRead,BufNewFile * setlocal signcolumn=yes


" -----------------------------------------------------------------------------
"  Coc.nvim
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-rust-analyzer', 'coc-toml', 'coc-markdownlint', 'coc-eslint', 'coc-pairs']

" -----------------------------------------------------------------------------
" Basic Settings
set encoding=UTF-8

set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching 
set ignorecase              " case insensitive 
set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab 
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
" set cc=80                  " set an 80 column border for good coding style
filetype plugin indent on   "allow auto-indenting depending on file type
syntax on                   " syntax highlighting
set mouse=a                 " enable mouse click
set clipboard=unnamedplus   " using system clipboard
set cursorline              " highlight current cursorline
set ttyfast                 " Speed up scrolling in Vim
" set spell                 " enable spell check (may need to download language package)
" set noswapfile            " disable creating swap file
" set backupdir=~/.cache/vim" Directory to store backup files.
set textwidth=0             " Disable text width
set wrapmargin=0            " Disable wrapmargin
set wrap                    " Set wrap, if char exceep window lim, display as if newlined (Actually not)


" color schemes
 if (has("termguicolors"))
 set termguicolors
 endif
 syntax enable
 " colorscheme evening
colorscheme purify
