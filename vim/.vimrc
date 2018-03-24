source /usr/share/vim/google/google.vim
filetype plugin indent on
source /usr/share/vim/google/glug/bootstrap.vim
source /usr/share/vim/google/gtags.vim

" Glug blaze plugin[mappings]='<leader>b'
Glug codefmt
Glug codefmt-google
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

" outline-window, for navigating.
Glug outline-window
nnoremap ,g :GoogleOutlineWindow<CR>
Glug youcompleteme-google 
Glug piper plugin[mappings]=',p' 


" Jianfei
sy on
set nocompatible noeb confirm nu autoindent cindent smartindent smarttab
" tabstop: existing; expandtab: as indicates
set tabstop=2 shiftwidth=2 expandtab softtabstop=2  history=1000
set nobackup noswapfile
set ignorecase hlsearch incsearch
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%y/%m/%d\ -\ %H:%M\")}

set shortmess=atI
set fillchars=vert:\ ,stl:\ ,stlnc:\
set showmatch
set report=0 matchtime=5 scrolloff=3

filetype on
filetype plugin on
filetype indent on


" Plug https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')

  " https://github.com/scrooloose/nerdcommenter
  Plug 'scrooloose/nerdcommenter'
  " Golang support
  Plug 'fatih/vim-go'

call plug#end()

nnoremap ,cc :call NERDComment(0,"toggle")<cr>
vnoremap ,cc :call NERDComment(0,"toggle")<cr>


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

" Tips
" %s/old/new/gc # replace with confirmation
" <ctrl+r>" # copy yanked into prompt
" :%s/<ctl-r><ctl-w>/foo/g # replace with cursor pointed text

