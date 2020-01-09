" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'
Plug 'tpope/vim-sensible'
Plug 'scrooloose/nerdtree' " Better file browser
" Code commenter
"Plug 'scrooloose/nerdcommenter'
Plug 'dyng/ctrlsf.vim'
" Better file browser
Plug 'scrooloose/nerdtree'
" Signify changes
Plug 'mhinz/vim-signify'
" Automatically close parenthesis, etc
" Plug 'Townk/vim-autoclose'
Plug 'https://github.com/Raimondi/delimitMate.git'
"
" Surround
Plug 'tpope/vim-surround'
" Async autocompletion
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Completion from other opened files
Plug 'Shougo/context_filetype.vim'
" Python autocompletion
" Plug 'zchee/deoplete-jedi', { 'do': ':UpdateRemotePlugins' }
" Just to add the python go-to-definition and similar features, autocompletion
" from this plugin is disabled
" Plug 'davidhalter/jedi-vim'
" Linters
Plug 'neomake/neomake'
" TODO is it running on save? or when?
" TODO not detecting errors, just style, is it using pylint?
"
" Class/module browser
Plug 'majutsushi/tagbar'
" TODO known problems:
" * current block not refreshing
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
Plug 'Valloric/YouCompleteMe'

" PyDocstring
Plug 'heavenshell/vim-pydocstring'

" Make sure you use single quotes


" List ends here. Plugins become visible to Vim after this call.
call plug#end()

set tabstop=4       " The width of a TAB is set to 4.
                    " Still it is a \t. It is just that
                    " Vim will interpret it to be having
                    " a width of 4.

set shiftwidth=4    " Indents will have a width of 4

set softtabstop=4   " Sets the number of columns for a TAB

set expandtab       " Expand TABs to spaces
set nu              " Set line number
set mouse=a         " Activate mouse clicks
set noswapfile      " Disable swap file
set re=1
set mouse=

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
imap jj <Esc>
nnoremap <S-j> :m .+1<CR>== 
nnoremap <S-k> :m .-2<CR>==
inoremap <S-j> <Esc>:m .+1<CR>==gi
inoremap <S-k> <Esc>:m .-2<CR>==gi
vnoremap <S-j> :m '>+1<CR>gv=gv
vnoremap <S-k> :m '<-2<CR>gv=gv
iabbrev lll import ipdb; ipdb.set_trace()

" Enables cursor line position tracking:
set cursorline
" Removes the underline causes by enabling cursorline:
highlight clear CursorLine
" Sets the line numbering to red background:
highlight CursorLineNR ctermbg=white

let g:gruvbox_italic=1
colorscheme gruvbox
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let g:gruvbox_contrast_dark='hard'
let g:gruvbox_italic=1

" tab navigation mappings
map tt :tabnew 

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=10

" Map the leader key to SPACE
let mapleader="\<SPACE>"

" clear empty spaces at the end of lines on save of python files
autocmd BufWritePre *.py :%s/\s\+$//e

" run linter on write
autocmd! BufWritePost * Neomake
" let g:neomake_verbose=3

" Set python version
let g:python_host_prog  = '/Users/jsheth/.pyenv/versions/2.7.10/bin/python'	  " Python 2
let g:python3_host_prog  = '/Users/jsheth/.pyenv/versions/3.6.5/bin/python'	  " Python 2

let g:neomake_python_python_maker = neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
let g:neomake_python_python_maker.exe = 'python3 -m py_compile'
let g:neomake_python_flake8_maker.exe = 'python3 -m flake8'


" NERDTree -----------------------------

" toggle nerdtree display
map <F2> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']


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
nmap <silent> <C-p> <Plug>(pydocstring)
" to be able to call CtrlP with default search text
"function! CtrlPWithSearchText(search_text, ctrlp_command_end)
    "execute ':CtrlP' . a:ctrlp_command_end
    "call feedkeys(a:search_text)
"endfunction
" same as previous mappings, but calling with current word as default text
"nmap ,wg :call CtrlPWithSearchText(expand('<cword>'), 'BufTag')<CR>
"nmap ,wG :call CtrlPWithSearchText(expand('<cword>'), 'BufTagAll')<CR>
"nmap ,wf :call CtrlPWithSearchText(expand('<cword>'), 'Line')<CR>
"nmap ,we :call CtrlPWithSearchText(expand('<cword>'), '')<CR>
"nmap ,pe :call CtrlPWithSearchText(expand('<cfile>'), '')<CR>
"nmap ,wm :call CtrlPWithSearchText(expand('<cword>'), 'MRUFiles')<CR>
"nmap ,wc :call CtrlPWithSearchText(expand('<cword>'), 'CmdPalette')<CR>

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave insert
"  mode)

" " deoplete -----------------------------

" " Use deoplete.
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#enable_ignore_case = 1
" let g:deoplete#enable_smart_case = 1
"
" " complete with words from any opened file
" let g:context_filetype#same_filetypes = {}
" let g:context_filetype#same_filetypes._ = '_'
" let g:AutoPairsUseInsertedCount = 1

" fuzzyfinder
set rtp+=/usr/local/opt/fzf
"
" ctrlsf ----------------------------
map <SPACE>s :CtrlSF 
