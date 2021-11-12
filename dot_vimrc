"-------------------------------------------------------------------------------
" general settings
"
set nocompatible

" filetype plugins
filetype plugin on
filetype indent on

" set to read-only if the file is modified from the outside
set autoread

" with ttymouse=xterm2 the mouse fully works in vim also inside screen
set ttymouse=xterm2
set mouse=a

"-------------------------------------------------------------------------------
" appearance
"
" do not equalize the size of the buffers
set noequalalways

set number

" wildcard matching
set wildmenu
set wildmode=longest:full
set wildignore=*.o,*.os,*.so,*~

" show current position
set ruler

" backspace behavior
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" search behavior
set noignorecase
set smartcase
set hlsearch
set incsearch

" no redraw during execution of macros
set lazyredraw

" regular expressions
set magic

" visual: show matching brackets
set showmatch
set mat=5

" no sound on errors
set noerrorbells
set novisualbell

" syntax highlighting
syntax enable
hi Comment ctermfg=LightCyan cterm=NONE

" utf8 encoding
set encoding=utf8

" filetype order preference
set ffs=unix,dos,mac


"-------------------------------------------------------------------------------
" files, backups, and undo
"
" do not crate backup files
set nobackup


"-------------------------------------------------------------------------------
" text editing
"
" tab indent: 2 and no tabs (replace by spaces)
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2

" mark tabs and trailing spaces
set list
set listchars=tab:>-,trail:-

" C-style indent
set cindent

" keep 3 lines below/above cursor when scrolling
set scrolloff=3

" support modelines
set modeline
set modelines=5


"-------------------------------------------------------------------------------
" Tlist plugin configuration
"
"let Tlist_Auto_Open = 1
"let Tlist_Auto_Update = 1
""autocmd FileType c,cpp,h TlistOpen
"let Tlist_Compact_Format = 1
"let Tlist_Exit_OnlyWindow = 1
"let Tlist_GainFocus_On_ToggleOpen = 0
"let Tlist_WinWidth = 29


"-------------------------------------------------------------------------------
" youcompleteme plugin configuration
"
"let g:ycm_confirm_extra_conf = 0
set rtp+=~/.vim/bundle/YouCompleteMe
autocmd BufRead,BufNewFile * setlocal signcolumn=yes

" Custom
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>


"-------------------------------------------------------------------------------
" Fugitive plugin: show Git status in statusline
"
hi CVSStatus cterm=bold ctermbg=LightGray ctermfg=DarkBlue
hi StatusLine cterm=NONE ctermbg=LightGray ctermfg=Black
set laststatus=2
set statusline=
set statusline+=%#CVSStatus#%{FugitiveStatusline()}
set statusline+=%#StatusLine#\ %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P


"-------------------------------------------------------------------------------
" tagbar plugin configuration
"
let g:tagbar_width=22
autocmd VimEnter * nested :call tagbar#autoopen(1)
autocmd FileType * nested :call tagbar#autoopen(0)
autocmd BufEnter * nested :call tagbar#autoopen(0)
