"=========================
"
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
sy on
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
set number
set history=1000
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%y/%m/%d\ -\ %H:%M\")}
" 总是显示状态行
set laststatus=2
" 在编辑过程中，在右下角显示光标位置的状态行
set ruler           
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
set whichwrap+=<,>,h,l
" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
set mouse=a
set selection=exclusive
set selectmode=mouse,key
" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
set matchtime=5
set scrolloff=3
" 为C程序提供自动缩进
set smartindent
" 补全窗口的颜色
hi PmenuSel ctermfg=white ctermbg=darkblue
hi Pmenu ctermfg=blue ctermfg=grey
hi PmenuSbar ctermbg=5
hi PmenuThumb ctermfg=yellow
hi CursorLine ctermbg=blue
hi CursorColumn ctermbg=blue
hi TabLine cterm=none ctermfg=0 ctermbg=7
" 使用Windows的快捷键, 这两项要连在一起写才能生效
source $VIMRUNTIME/mswin.vim
behave mswin
colorscheme molokai
"设置gvim的字体
set guifont=DejaVu\ Sans\ Mono\ 10
" 只在下列文件类型被侦测到的时候显示行号，普通文本文件不显示
if has("autocmd")
   autocmd FileType xml,html,c,cs,java,perl,shell,bash,cpp,python,vim,php,ruby set number
   autocmd FileType xml,html vmap <C-o> <ESC>'<i<!--<ESC>o<ESC>'>o-->
   autocmd FileType java,c,cpp,cs vmap <C-o> <ESC>'<o/*<ESC>'>o*/
   autocmd FileType html,text,php,vim,c,java,xml,bash,shell,perl,python setlocal textwidth=100
   autocmd BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \   exe "normal g`\"" |
      \ endif
endif " has("autocmd")
set t_Co=256
let g:molokai_original = 1
"折叠
set foldmethod=syntax
"启动vim时不要自动折叠代码
set foldlevel=100

"taglist
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Right_Window = 1         "在右侧窗口中显示taglist窗口
"let Tlist_Auto_Open = 1				   "启动打开vim
let Tlist_File_Fold_Auto_Close=1		"其他文件的taglist折叠
nmap <F3> <ESC>:TlistToggle<RETURN>

set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,iso-8859-1,gbk,gb2312
set encoding=utf-8

imap jj <Esc>





"=========================
"NerdTree
let NERDTreeWinSize = 26 "size of the NERD tree
nmap <F4> <ESC>:NERDTreeToggle<RETURN>
"autocmd VimEnter * NERDTree

"set tags+=~/.vim/tags/cpp
set tags+=./tags,../tags
"Mac自带的ctags无法使用, Taglist只能用exuberant tags
let Tlist_Ctags_Cmd = '/Users/bluesea/program/ctags/bin/ctags'

"==========================
"ctags 
"ctags -f outputname 这个要放在当前路径前面，如
"ctags R -f llvm ~/Program/llvm-3.0/include可以，但是ctags R  ~/Program/llvm-3.0/include -f llvm 就不行
map <C-F12> :!ctags -R --sort=yes --c++-kinds=+pxf --fields=+iaS --extra=+q .<CR>
map <C-F10> :!ctags --sort=yes --c++-kinds=+pxf --fields=+iaS --extra=+q *cpp *h *c<CR>
map <C-F11> :!find . -name "*.h" -o -name "*.c" -o -name "*.cpp">cscope.files; cscope -kqb -i cscope.files<CR>


"=========================
"clang complete
let  g:clang_close_preview = 1
" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
"关闭preview窗口
set completeopt-=preview
