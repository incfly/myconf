filetype off
filetype plugin on
filetype indent on
filetype plugin indent on
sy on
set nocompatible noeb confirm nu autoindent cindent smartindent smarttab
set tabstop=2 shiftwidth=2 expandtab softtabstop=2  history=1000 nobackup noswapfile
set ignorecase hlsearch incsearch
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%y/%m/%d\ -\ %H:%M\")}
set shortmess=atI
set fillchars=vert:\ ,stl:\ ,stlnc:\
set showmatch report=0 matchtime=5 scrolloff=3


" Plug https://github.com/junegunn/vim-plug
" Using it mostly for fzf
call plug#begin('~/.vim/plugged')
  " https://github.com/scrooloose/nerdcommenter
  Plug 'scrooloose/nerdcommenter'
  " Golang support
  Plug 'fatih/vim-go'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
call plug#end()

nnoremap ,cc :call NERDComment(0,"toggle")<cr>
vnoremap ,cc :call NERDComment(0,"toggle")<cr>
nnoremap <c-p> :FZF<cr>

colorscheme molokai
set t_Co=256
let g:molokai_original = 1

set foldmethod=syntax nofoldenable

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

"clang complete
let  g:clang_close_preview = 1
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt-=preview

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'

" vim-go
let g:go_fmt_command = "goimports"
syntax on

" gofmt always use tab, so set spaces to 2
au BufNewFile,BufRead *.go set nolist
au BufNewFile,BufRead *.go set softtabstop=2
au BufNewFile,BufRead *.go set shiftwidth=2
au BufNewFile,BufRead *.go set tabstop=2
au BufNewFile,BufRead *.go set noexpandtab
" Workaround for gofmt, re-render tabspace as after gofmt.
au BufEnter,BufWritePost *.go set sw=2 ts=2 noet
" Sync with current file location.
map <leader>r :NERDTreeFind<cr>


" vundle
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'ervandew/supertab'
" Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'Valloric/YouCompleteMe'
" All of your Plugins must be added before the following line
call vundle#end()            " 
filetype plugin indent on    " required

" Vim Tips, by deafult, empty using the cursor word to search,
" https://github.com/mileszs/ack.vim/issues/203
nnoremap <leader>f :Ack 
" Plugin 'Valloric/YouCompleteMe
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_extra_conf_globlist = './bazel-compilation-database-0.3.5/*'
" \gg trigger
"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
