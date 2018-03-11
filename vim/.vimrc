set nocompatible
source /usr/share/vim/google/google.vim
filetype plugin indent on
syntax on

source /usr/share/vim/google/glug/bootstrap.vim

" plugin specific

" Glug blaze plugin[mappings]='<leader>b'
Glug codefmt
Glug codefmt-google
  augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType bzl AutoFormatBuffer buildifier
  "autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType jslayout AutoFormatBuffer jslfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType python AutoFormatBuffer pyformat
  autocmd FileType markdown AutoFormatBuffer mdformat
  " gofmt always use tab, so set spaces to 2
  au BufNewFile,BufRead *.go set nolist
  au BufNewFile,BufRead *.go set softtabstop=2
  au BufNewFile,BufRead *.go set shiftwidth=2
  au BufNewFile,BufRead *.go set tabstop=2
  au BufNewFile,BufRead *.go set noexpandtab
 augroup END


" Format selected
vnoremap <F5> :FormatLines<CR>
" Format whole file
nnoremap <F6> :FormatCode<CR> 

" outline-window
Glug outline-window
nnoremap ,g :GoogleOutlineWindow<CR>

" You complete me
Glug youcompleteme-google

" piper
Glug piper plugin[mappings]=',p'
Glug grok

" refactorer
Glug refactorer 
noremap <F2> :GoogleRefactorerRename<CR>

source /usr/share/vim/google/gtags.vim

" Go
Glug codefmt gofmt_executable="goimports"
Glug codefmt-google
autocmd FileType go AutoFormatBuffer gofmt

" Jianfei
sy on
set nocompatible noeb
set confirm nu

set autoindent cindent smartindent smarttab
" tabstop: existing; expandtab: as indicates
set tabstop=2 shiftwidth=2 expandtab
set softtabstop=2 "width for explict tab.

set history=1000
set nobackup noswapfile

set ignorecase hlsearch incsearch
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%y/%m/%d\ -\ %H:%M\")}

"set mouse=a paste
"set selection=exclusive selectmode=mouse,key

set report=0
set shortmess=atI
set fillchars=vert:\ ,stl:\ ,stlnc:\
set showmatch
set matchtime=5
set scrolloff=3

filetype on
filetype plugin on
filetype indent on

" Plug https://github.com/junegunn/vim-plug
" Need to run :PlugInstall after vim reload.
call plug#begin('~/.vim/plugged')

" https://github.com/scrooloose/nerdcommenter
Plug 'scrooloose/nerdcommenter'

" Golang support
Plug 'fatih/vim-go'

call plug#end()

"

colorscheme molokai
set t_Co=256
let g:molokai_original = 1

set foldmethod=syntax nofoldenable
imap jj <Esc>

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

"clang complete
let  g:clang_close_preview = 1
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt-=preview

" CtrlP
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'

" Tips
" %s/old/new/gc # replace with confirmation
" <ctrl+r>" # copy yanked into prompt
" :%s/<ctl-r><ctl-w>/foo/g # replace with cursor pointed text
