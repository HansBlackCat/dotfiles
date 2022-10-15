" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fugitive'
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'preservim/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'philrunninger/nerdtree-visual-selection'
" gc
Plug 'tpope/vim-commentary'
Plug 'ctrlpvim/ctrlp.vim'

" Plug 'vhdirk/vim-cmake'
Plug 'skywind3000/asyncrun.vim'

Plug 'ronakg/quickr-cscope.vim'
"Plug 'xolox/vim-easytags'

Plug 'calincru/flex-bison-syntax'

Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Initialize plugin system
call plug#end()

"-------------------------------------------------------------------------------
" CMake
source ~/.config/nvim/cmake.vim

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
let g:tagbar_width=20
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
" coc.nvim
source ~/.config/nvim/coc.vim

" notes
" C/C++: needs compile_commands.json, symlink to `SOURCE` directory
" https://clangd.llvm.org/installation.html#project-setup


"-------------------------------------------------------------------------------
" vim-airline

" Add additional information on airline
function! StatusDiagnostic() abort
    let info = get(b:, 'coc_diagnostic_info', {})
    if empty(info) | return '' | endif
    let msgs = []
    if get(info, 'error', 0)
        call add(msgs, 'E' . info['error'])
    endif
    if get(info, 'warning', 0)
        call add(msgs, 'W' . info['warning'])
    endif
    return join(msgs, ' '). ' ' . get(g:, 'coc_status', '') . ' ' . get(b:, 'coc_current_function', '')
endfunction

let g:airline_section_c = '%{StatusDiagnostic()}'

" Enable tab feature
let g:airline#extensions#tabline#enabled = 1



"-------------------------------------------------------------------------------
" lsp_cxx_highlight
" let g:lsp_cxx_hl_ft_whitelist += ['cxx', 'c++']


"-------------------------------------------------------------------------------
" NERDTree

source ~/.config/nvim/nerdtree.vim

"-------------------------------------------------------------------------------
" TermDebug
" https://github.com/vim/vim/blob/master/runtime/pack/dist/opt/termdebug
"
packadd! termdebug

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
" set mouse=v                 " middle-click paste with 
set hlsearch                " highlight search 
set incsearch               " incremental search
set tabstop=2               " number of columns occupied by a tab 
set softtabstop=2           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=2            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set relativenumber          " add relative numbers
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
set scrolloff=4             " keep 3 lines below/above cursor when scrolling
set ruler                   " show current position
set lazyredraw              " lazyredraw
set noequalalways           " do not equalize the size of the buffers
set magic                   " regular expressions

" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>b :bp<CR>
nnoremap <Leader>f :bn<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
" It's useful to show the buffer number in the status line.
set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" color schemes
" if (has("termguicolors"))
"   set termguicolors
" endif

colorscheme tokyonight
"colorscheme tokyonight-night
"colorscheme tokyonight-storm
"colorscheme tokyonight-day
"colorscheme tokyonight-moon
