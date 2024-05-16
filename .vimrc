colorscheme desert "主题设置
syntax on "语法高亮
filetype on "检测文件类型,对某一文件的专有设定
filetype plugin indent on "根据文件类型自动加载对应配置

"状态栏设置
set statusline=%F%m%r%h%w\ [POS=%l,%v][%p%%]\  "状态行显示的内容
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)

"光标设置
"set guicursor=n-v-c:block,i-ci:ver25,r-cr:hor20,o:blinkon0

"优化
set nocompatible  "去掉有关vi一致性模式,避免以前版本的一些bug和局限
set shortmess=atI   " 启动的时候不显示info信息
set belloff=all "去除闪烁或者蜂鸣
set nocompatible              " be iMproved, required

nnoremap <space>b :buffers<cr>:b<space>
nnoremap <space>e :b#<cr>
nnoremap <space>w :w<cr>
nnoremap <space>q :qa<cr>
inoremap jf <esc>
cnoremap jf <c-c>

set number "显示行号
set confirm "异常退出时的提示选项功能
set history=1000 "Vim 需要记住多少次历史操作。
"快捷键开关行号
nmap <leader>on :set nu<CR> :set rnu<CR>
nmap <leader>cn :set nonu<CR> :set nornu<CR>

"搜索设置
set ignorecase "搜索时,忽略大小写
set smartcase  "如果有一个大写字母，则切换到大小写敏感查找
set showmatch "自动高亮对应的括号
set hlsearch "搜索时，高亮显示匹配结果
set incsearch "搜索时，自动跳到第一个匹配的结果
"set wrapscan "用来设置到文件尾部后是否重新从文件头开始搜索"

"高亮设置
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

"映射ctrl+h 去除当前高亮的文字
nnoremap <space>h :call DisableHighlight()<cr>
function! DisableHighlight()
    set nohlsearch
endfunc

set cursorcolumn "列高亮
set cursorline "行高亮

highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

"解决乱码问题
set fileencodings=utf-8,gb2312,gb18030,gbk,ucs-bom,cp936,latin1 "解决中文显示乱码问题
set enc=utf8
set fencs=utf8,gbk,gb2312,gb18030

set showcmd "实时显示输入的命令
set relativenumber "显示光标所在的当前行的行号，其他行都为相对于该行的相对行号
"set cursorline "光标所在的当前行高亮
set scrolloff=5 "垂直滚动时，光标距离顶部/底部的位置
"set noswapfile "不创建交换文件。
"set undofile "保留撤销历史,文件名以.un~开头
"set autochdir "自动切换工作目录
"set noerrorbells "出错时，不要发出响声。
"set visualbell "出错时，发出视觉提示，通常是屏幕闪烁

"set listchars=tab:»■,trail:■ "如果行尾有多余的空格（包括 Tab 键），该配置将让这些空格显示成可见的小方块
"set list

set wildmenu "命令模式下，底部操作指令按下 Tab 键自动补全。第一次按下 Tab,会显示所有匹配的操作指令的清单；第二次按下 Tab,会依次选择各个指令。
set wildmode=longest:list,full

set autoread "当文件在外部被修改时，自动更新该文件

"set mouse=a "激活鼠标的使用
"set selection=exclusive
"set selectmode=mouse,key

""""""""""""""""""""""""""""""
" 缩进设置
""""""""""""""""""""""""""""""
set cindent "按照C语言的风格自动缩进
set smartindent "智能缩进

" 设置 Tab 符号显示为 4 个空格宽度
set tabstop=4

" 按下 Tab 键时插入空格而不是制表符
set expandtab

" 插入缩进时使用 4 个空格
set shiftwidth=4

" 自动缩进，即新行继承上一行的缩进
set autoindent

" 如果需要，可以开启聪明地缩进/退格行为，使得按退格键能够按照 shiftwidth 的单位回退
set smarttab


""""""""""""""""""""""""""""""
" 标签栏设置
""""""""""""""""""""""""""""""
set tabpagemax=120 "设置最大标签页上限为20
set showtabline=0  "设置是否显示标签栏 0-不显示 1-显示

"自动保存设置
set updatecount=0 "自动保存设置 0-关闭 其他数值-代表键盘操作次数（匹配即自动保存当前文件）


"快捷键设置
"F9 快捷打开文件列表，方便打开文件
let g:netrw_winsize = 20 " 文件列表窗口宽度
nnoremap <silent> <F9> :Sexplore!<CR><CR> "映射F9 使用文件列表

"方向键映射窗口大小调节
map <c-k> <ESC><C-W>-
map <c-j> <ESC><C-W>+
map <c-h> <ESC><C-W><
map <c-l> <ESC><C-W>>

"文件树快捷键
map <F7> :NERDTreeToggle<CR>


"插件安装加载
call plug#begin('~/.vim/plugged')

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Lokaltog/vim-easymotion'
Plug 'tpope/vim-fugitive'
Plug 'preservim/nerdtree'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ludovicchabant/vim-gutentags'
               
call plug#end()

""""""""""""""""""""""""""""""
" Vim插件设置
""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
let g:winManagerWindowLayout = "BufExplorer|TagList,FileExplorer"
let g:winManagerWidth = 30
let g:NERDTreeWinSize=30
let g:defaultExplorer = 0
let g:persistentBehaviour=0 " 如果所有编辑文件都关闭了,退出vim
nnoremap <silent> <F8> :WMToggle<CR><CR>

""""""""""""""""""""""""""""""
" cscoepe 浏览代码插件设置
""""""""""""""""""""""""""""""
"cscope数据库文件索引添加
if filereadable("cscope.out") "使用cscope
    cs add cscope.out
endif

"nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
"nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
"nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

nnoremap <space>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nnoremap <space>c :cs find c <C-R>=expand("<cword>")<CR><CR> :copen<CR>
nnoremap <space>s :cs find s <C-R>=expand("<cword>")<CR><CR> :copen<CR>
nnoremap <space>t :cs find t <C-R>=expand("<cword>")<CR><CR> :copen<CR>
"nnoremap <space>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nnoremap <space>f :cs find f <C-R>=expand("<cfile>")<CR><CR> :copen<CR>
nnoremap <space>i :cs find i <C-R>=expand("<cfile>")<CR><CR> :copen<CR>
nnoremap <space>d :cs find d <C-R>=expand("<cword>")<CR><CR> :copen<CR>
 
"设置快捷键，同步代码数据库索引文件
nnoremap <silent> <F10> :AsyncRun ctags -R;cscope -Rbq;:cs add cscope.out <CR>  "同步database

set cscopequickfix=s-,c-,d-,i-,t-,e-
nnoremap <F4> :copen<CR>
nnoremap <F5> :cclose<CR>
nnoremap <F12> :clist<CR>

"FZF 配置
nmap <C-p> :Files<CR>
nmap <C-e> :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }
" 设置快捷键调用ripgrep进行搜索
nnoremap <space>p :Rg<CR>


" 如果你希望自定义特定动作的映射，可以这样设置（例如跳转到单词）
nmap <silent> <Space><Space>j <Plug>(easymotion-w)
nmap <silent> <Space><Space>k <Plug>(easymotion-b)

" 其他可选配置
let g:EasyMotion_smartcase = 1 " 搜索时智能区分大小写
let g:EasyMotion_use_mouse = 0 " 是否允许鼠标选择目标

"vim-fugitive配置
" 在 normal 模式下快速打开 Git 状态窗口
nmap <leader>gs :Git status<CR>
"
" " 查看当前文件与暂存区或 HEAD 的差异
nmap <leader>gd :Git diff<CR>
"
" " 打开一个新的窗口查看差异（水平分割）
nmap <leader>gh :Git split<CR>
"
" " 进行 Git commit,并在 quickfix 窗口中预览更改
nmap <leader>gc :Git commit<CR>
"
" " 切换到下一个差异
"nmap <C-n> [c
"
" " 切换到上一个差异
"nmap <C-p> ]c
"
" " 查看提交历史
nmap <leader>gl :Glog<CR>
" " 进行 Git blame,并在 quickfix 窗口中预览更改
nmap <leader>gb :Git blame<CR>