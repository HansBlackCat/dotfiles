" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'

Plug 'ronakg/quickr-cscope.vim'
"Plug 'xolox/vim-easytags'

Plug 'calincru/flex-bison-syntax'

" Initialize plugin system
call plug#end()

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


"-------------------------------------------------------------------------------
" quickr-cscope.vim
function! LoadCscope()
  let db = findfile("cscope.out", ".;")
  if (!empty(db))
    let path = strpart(db, 0, match(db, "/cscope.out$"))
    set nocscopeverbose " suppress 'duplicate connection' error
    exe "cs add " . db . " " . path
    set cscopeverbose
  " else add the database pointed to by environment variable 
  elseif $CSCOPE_DB != "" 
    cs add $CSCOPE_DB
  endif
endfunction
au BufEnter /* call LoadCscope()

"-------------------------------------------------------------------------------
" YCM
let g:ycm_python_interpreter_path='$(which python3)'
set rtp+=${HOME}/.config/nvim/bundle/YouCompleteMe
autocmd BufRead,BufNewFile * setlocal signcolumn=yes


"-------------------------------------------------------------------------------
" vim-easytags
" set tag=./tags;/
" " easy-tag
" " tags를 비동기로 불러와준다. (필수) tag사이즈가 커지게 되면 vim이 블록되는 시간이 길어져서 답답하다
" let g:easytags_async=1
" " highlight를 켜면 좋지만 이것도 속도가 느려진다.
" let g:easytags_auto_highlight = 0 
" " struct의 멤버변수들도 추적이 된다.
" let g:easytags_include_members = 1
" " 현재 프로젝트에서 쓰는 tags파일을 우선 로드하고 없을 경우 global tags를 로드한다.
" let g:easytags_dynamic_files = 1
" source: https://jen6.tistory.com/119

" -----------------------------------------------------------------------------
" Basic Settings
" 
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

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif



" color schemes
 if (has("termguicolors"))
 set termguicolors
 endif
 syntax enable
 " colorscheme evening
" colorscheme purify
