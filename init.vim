" Plugins will be downloaded under the specified directory.

autocmd!
set nocompatible

call plug#begin('~/.local/share/nvim/site/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-sensible'
Plug 'https://tpope.io/vim/fugitive.git'
Plug 'https://tpope.io/vim/commentary.git'
Plug 'scrooloose/nerdtree' " Better file browser
Plug 'dyng/ctrlsf.vim'
" Better file browser
Plug 'scrooloose/nerdtree'
" Signify changes
Plug 'mhinz/vim-signify'
"
" Automatically close parenthesis, etc
Plug 'https://github.com/Raimondi/delimitMate.git'
Plug 'tpope/vim-surround'
Plug 'Shougo/context_filetype.vim'
" Linters & Fixers
Plug 'dense-analysis/ale'
"
" Search/Navigation
Plug 'https://github.com/ludovicchabant/vim-gutentags.git'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
" Plug 'terryma/vim-multiple-cursors'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug '~/.local/share/nvim/site/plugged/YouCompleteMe'
" PyDocstring
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }

" CSV file pretty view
Plug 'chrisbra/csv.vim'
call plug#end()
" List ends here. Plugins become visible to Vim after this call.

syntax enable
set tabstop=4 " The width of a TAB is set to 4.  Still it is a \t. It is just that Vim will interpret it to be having a width of 4.
set softtabstop=4
set shiftwidth=4
set textwidth=119
set expandtab
set autoindent
set fileformat=unix
set nu              " Set line number
set mouse=r         " Activate mouse clicks
set noswapfile      " Disable swap file
set re=1
set encoding=utf-8
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab



"vimdiff
" highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
" highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
" highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
" highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1
let g:gruvbox_bold=1
colorscheme gruvbox
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" Enables cursor line position tracking:
set cursorline
"
" PyDocstring
let g:pydocstring_enable_mapping=0
let g:pydocstring_formatter = 'google'
nnoremap <silent> <C-p> :Pydocstring<CR>
nnoremap <silent> <C-p><C-p> :PydocstringFormat<CR>

" Navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
imap jj <Esc>
nnoremap <S-j> :m .+1<CR>==
nnoremap <S-k> :m .-2<CR>==
" inoremap <S-j> <Esc>:m .+1<CR>==gi
" inoremap <S-k> <Esc>:m .-2<CR>==gi
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv
iabbrev lll import ipdb; ipdb.set_trace()

set notimeout          " don't timeout on mappings
set ttimeout           " do timeout on terminal key codes
set timeoutlen=100     " timeout after 100 msec


" tab navigation mappings
map tt :tabnew

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=10

" Map the leader key to SPACE
let mapleader="\<SPACE>"

" Set python version
" let g:python_host_prog ='/Users/jsheth/.pyenv/versions/3.6.5/bin/python'	  " Python 3
" let g:ycm_server_python_interpreter='/usr/local/bin/python3'

" NERDTree -----------------------------

" toggle nerdtree display
map <F2> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']
" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
            \ quit | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror

" open a file from NerdTree in new tab
let NERDTreeMapOpenInTab='\r'


" Fzf ------------------------------

" file finder mapping
nmap ,e :Files<CR>
" tags (symbols) in current file finder mapping
nmap ,g :BTag<CR>
" tags (symbols) in all files finder mapping
nmap ,G :Tags<CR>
" general code finder in current file mapping
nmap ,f :BLines<CR>
" general code finder in all files mapping
nmap ,F :Lines<CR>
" commands finder mapping
nmap ,c :Commands<CR>

" fuzzyfinder
set rtp+=/usr/local/opt/fzf
"
" ctrlsf ----------------------------
map <SPACE>s :CtrlSF

" Remove highlights after the word search with two <ESC>
nnoremap <esc><esc> :noh<return>

let g:ycm_server_keep_logfiles = 1
let g:ycm_confirm_extra_conf=0
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Liners & Fixers
let g:ale_linters = {'python': ['flake8', 'pydocstyle']}
let g:ale_fixers = {
    \ "*": ['remove_trailing_lines', 'trim_whitespace'],
    \ 'javascript': ['prettier', 'eslint'],
    \ 'python': ['isort', 'black'],
    \ 'sh': ['shfmt'],
    \ 'yaml': ['prettier'],
    \}
let b:ale_fix_on_save=1
