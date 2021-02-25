" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

" Make sure you use single quotes

Plug 'neoclide/coc.nvim', {'branch': 'release'}

" LaTeX Supports
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'


" Initialize plugin system
call plug#end()

" Enable FileType
filetype on

set clipboard+=unnamedplus


set hlsearch
set nu
set autoindent
set scrolloff=2
set wildmode=longest,list
set ts=4 
set sts=4
set sw=1
set autowrite
set autoread
set cindent
set bs=eol,start,indent
set history=256
set laststatus=2
set shiftwidth=4
set showmatch
set smartcase
set smarttab
set smartindent
set softtabstop=4
set tabstop=4
set ruler
set incsearch
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif
if has("syntax")
 syntax on
endif

" -------------------------------------------------------------------
" LaTeX Settings 
" -------------------------------------------------------------------
let g:vimtex_compiler_progname='nvr'

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
let g:vimtex_compiler_method='tectonic'
set conceallevel=1
let g:tex_conceal='abdmg'

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

" -------------------------------------------------------------------
" -------------------------------------------------------------------
