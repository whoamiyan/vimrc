syntax on "语法高亮
colorscheme desert "主题选择

if filereadable("/etc/vim/vimrc.local") "source /etc/vim/vimrc.local
  source /etc/vim/vimrc.local
endif

set shortmess=atI   " 启动的时候不显示乌干达 

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set statusline=%F%m%r%h%w\ [POS=%l,%v][%p%%]\  "状态行显示的内容  
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)  

set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限

"set tags=/home/liyan/code/utcase_mc20/tags

"nnoremap <silent> <C-]> <C-w><C-]><C-w>T

if filereadable("cscope.out") "使用cscope
    cs add cscope.out
endif

filetype on "检测文件类型,对某一文件的专有设定

let g:netrw_winsize = 20
nnoremap <silent> <F9> :Sexplore!<CR><CR> "使用文件列表


""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
let g:winManagerWindowLayout = "BufExplorer|FileExplorer|TagList"
let g:winManagerWidth = 30
let g:defaultExplorer = 0
"nmap <C-W><C-F> :FirstExplorerWindow<cr>
"nmap <C-W><C-B> :BottomExplorerWindow<cr>
"nmap <silent> <leader>wm :WMToggle<cr>
nnoremap <silent> <F8> :WMToggle<CR><CR> 

""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
let g:LookupFile_PreserveLastPattern = 0        "不保存上次查找的字符串
let g:LookupFile_PreservePatternHistory = 1     "保存查找历史
let g:LookupFile_AlwaysAcceptFirst = 1          "回车打开第一个匹配项目
let g:LookupFile_AllowNewFiles = 0              "不允许创建不存在的文件

set number "显示行号
set confirm "异常退出时的提示选项功能
set history=1000 "Vim 需要记住多少次历史操作。

set ignorecase "搜索时,忽略大小写
set smartcase  "如果有一个大写字母，则切换到大小写敏感查找
set showmatch "自动高亮对应的括号
set hlsearch "搜索时，高亮显示匹配结果
set incsearch "搜索时，自动跳到第一个匹配的结果
"set wrapscan "用来设置到文件尾部后是否重新从文件头开始搜索"

" 当光标一段时间保持不动了，就禁用高亮
"autocmd cursorhold * set nohlsearch
" 当输入查找命令时，再启用高亮
"noremap n :set hlsearch<cr>n
"noremap N :set hlsearch<cr>N
"noremap / :set hlsearch<cr>/
"noremap ? :set hlsearch<cr>?
"noremap * *:set hlsearch<cr>

"一键禁用/开启搜索高亮
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
noremap * *:set hlsearch<cr>

nnoremap <c-h> :call DisableHighlight()<cr>
function! DisableHighlight()
    set nohlsearch
endfunc

set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1 "解决中文显示乱码问题
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030

set showcmd "实时显示输入的命令
set autoindent "按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致
set relativenumber "显示光标所在的当前行的行号，其他行都为相对于该行的相对行号
"set cursorline "光标所在的当前行高亮
set scrolloff=5 "垂直滚动时，光标距离顶部/底部的位置
"set noswapfile "不创建交换文件。
"set undofile "保留撤销历史,文件名以.un~开头
"set autochdir "自动切换工作目录
"set noerrorbells "出错时，不要发出响声。
set visualbell "出错时，发出视觉提示，通常是屏幕闪烁

"set listchars=tab:»■,trail:■ "如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块
"set list

set wildmenu "命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下 Tab，会显示所有匹配的操作指令的清单；第二次按下 Tab，会依次选择各个指令。
set wildmode=longest:list,full

set autoread "当文件在外部被修改时，自动更新该文件

"set mouse=a "激活鼠标的使用
"set selection=exclusive
"set selectmode=mouse,key




set tabstop=4
set tabpagemax=20 "设置最大标签页上限为20
set showtabline=2






