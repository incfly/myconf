filetype off
filetype plugin on
filetype indent on
filetype plugin indent on
" Format selected
vnoremap <F5> :FormatLines<CR>
" Format whole file
nnoremap <F6> :FormatCode<CR> 

augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType go AutoFormatBuffer gofmt
  "autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer pyformat
  autocmd FileType markdown AutoFormatBuffer mdformat
augroup END

sy on
set nocompatible noeb confirm nu autoindent cindent smartindent smarttab
set tabstop=2 shiftwidth=2 expandtab softtabstop=2  history=1000
set nobackup noswapfile
set ignorecase hlsearch incsearch
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%y/%m/%d\ -\ %H:%M\")}
set shortmess=atI
set fillchars=vert:\ ,stl:\ ,stlnc:\
set showmatch
set report=0 matchtime=5 scrolloff=3


" Plug https://github.com/junegunn/vim-plug
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


" =============
" vundle
" ============
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
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Vundle Plugin
Plugin 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
