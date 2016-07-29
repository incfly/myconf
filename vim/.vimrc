sy on
set nocompatible noeb
set confirm nu
set autoindent cindent softtabstop=4
set history=1000
set nobackup noswapfile

set ignorecase hlsearch incsearch
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%y/%m/%d\ -\ %H:%M\")}

set mouse=a paste
set selection=exclusive selectmode=mouse,key

set report=0
set shortmess=atI
set fillchars=vert:\ ,stl:\ ,stlnc:\
set showmatch
set matchtime=5
set scrolloff=3

filetype on
filetype plugin on
filetype indent on


colorscheme molokai
set t_Co=256
let g:molokai_original = 1

set foldmethod=syntax
imap jj <Esc>

"clang complete
let  g:clang_close_preview = 1
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt-=preview

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
