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
filetype plugin indent on

let g:netrw_winsize = 20
nnoremap <silent> <F9> :Sexplore!<CR><CR> "使用文件列表

nnoremap <silent> <F10> :AsyncRun ctags -R ; cscope -Rbq <CR><CR> "同步database

""""""""""""""""""""""""""""""
" winManager setting
""""""""""""""""""""""""""""""
let g:winManagerWindowLayout = "BufExplorer|TagList,FileExplorer"
"let g:winManagerWindowLayout = "BufExplorer,TagList"
let g:winManagerWidth = 30
"let g:winManagerHeight = 100
let g:defaultExplorer = 0
let g:persistentBehaviour=0 " 如果所有编辑文件都关闭了，退出vim
"let g:winManagerWindowLabel = "WinManager"
"nmap <C-W><C-F> :FirstExplorerWindow<cr>
"nmap <C-W><C-B> :BottomExplorerWindow<cr>
"nmap <silent> <leader>wm :WMToggle<cr>
nnoremap <silent> <F8> :WMToggle<CR><CR> 

""""""""""""""""""""""""""""""
" lookupfile setting
""""""""""""""""""""""""""""""
"let g:LookupFile_MinPatLength = 2               "最少输入2个字符才开始查找
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

set softtabstop=4 
set shiftwidth=4 
set noexpandtab 
set cindent
set smartindent

set updatecount=0


set cursorcolumn
set cursorline

highlight CursorLine   cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE
highlight CursorColumn cterm=NONE ctermbg=black ctermfg=green guibg=NONE guifg=NONE

nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

map <UP> <ESC><C-W>-
map <DOWN> <ESC><C-W>+
map <LEFT> <ESC><C-W><
map <Right> <ESC><C-W>>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim: set noet fenc=utf-8 ff=unix sts=4 sw=4 ts=4 :
"
" apc.vim - auto popup completion window
"
" Created by skywind on 2020/03/05
" Last Modified: 2021/03/11 08:45
"
" Features:
"
" - auto popup complete window without select the first one
" - tab/s-tab to cycle suggestions, <c-e> to cancel
" - use ApcEnable/ApcDisable to toggle for certiain file.
"
" Usage:
"
" set cpt=.,k,b
" set completeopt=menu,menuone,noselect
" let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1}

let g:apc_enable_ft = get(g:, 'apc_enable_ft', {})    " enable filetypes
let g:apc_enable_tab = get(g:, 'apc_enable_tab', 1)   " remap tab
let g:apc_min_length = get(g:, 'apc_min_length', 2)   " minimal length to open popup
let g:apc_key_ignore = get(g:, 'apc_key_ignore', [])  " ignore keywords

" get word before cursor
function! s:get_context()
	return strpart(getline('.'), 0, col('.') - 1)
endfunc

function! s:meets_keyword(context)
	if g:apc_min_length <= 0
		return 0
	endif
	let matches = matchlist(a:context, '\(\k\{' . g:apc_min_length . ',}\)$')
	if empty(matches)
		return 0
	endif
	for ignore in g:apc_key_ignore
		if stridx(ignore, matches[1]) == 0
			return 0
		endif
	endfor
	return 1
endfunc

function! s:check_back_space() abort
	  return col('.') < 2 || getline('.')[col('.') - 2]  =~# '\s'
endfunc

function! s:on_backspace()
	if pumvisible() == 0
		return "\<BS>"
	endif
	let text = matchstr(s:get_context(), '.*\ze.')
	return s:meets_keyword(text)? "\<BS>" : "\<c-e>\<bs>"
endfunc


" autocmd for CursorMovedI
function! s:feed_popup()
	let enable = get(b:, 'apc_enable', 0)
	let lastx = get(b:, 'apc_lastx', -1)
	let lasty = get(b:, 'apc_lasty', -1)
	let tick = get(b:, 'apc_tick', -1)
	if &bt != '' || enable == 0 || &paste
		return -1
	endif
	let x = col('.') - 1
	let y = line('.') - 1
	if pumvisible()
		let context = s:get_context()
		if s:meets_keyword(context) == 0
			call feedkeys("\<c-e>", 'n')
		endif
		let b:apc_lastx = x
		let b:apc_lasty = y
		let b:apc_tick = b:changedtick
		return 0
	elseif lastx == x && lasty == y
		return -2
	elseif b:changedtick == tick
		let lastx = x
		let lasty = y
		return -3
	endif
	let context = s:get_context()
	if s:meets_keyword(context)
		silent! call feedkeys("\<c-n>", 'n')
		let b:apc_lastx = x
		let b:apc_lasty = y
		let b:apc_tick = b:changedtick
	endif
	return 0
endfunc

" autocmd for CompleteDone
function! s:complete_done()
	let b:apc_lastx = col('.') - 1
	let b:apc_lasty = line('.') - 1
	let b:apc_tick = b:changedtick
endfunc

" enable apc
function! s:apc_enable()
	call s:apc_disable()
	augroup ApcEventGroup
		au!
		au CursorMovedI <buffer> nested call s:feed_popup()
		au CompleteDone <buffer> call s:complete_done()
	augroup END
	let b:apc_init_autocmd = 1
	if g:apc_enable_tab
		inoremap <silent><buffer><expr> <tab>
					\ pumvisible()? "\<c-n>" :
					\ <SID>check_back_space() ? "\<tab>" : "\<c-n>"
		inoremap <silent><buffer><expr> <s-tab>
					\ pumvisible()? "\<c-p>" : "\<s-tab>"
		let b:apc_init_tab = 1
	endif
	if get(g:, 'apc_cr_confirm', 0) == 0
		inoremap <silent><buffer><expr> <cr> 
					\ pumvisible()? "\<c-y>\<cr>" : "\<cr>"
	else
		inoremap <silent><buffer><expr> <cr> 
					\ pumvisible()? "\<c-y>" : "\<cr>"
	endif
	inoremap <silent><buffer><expr> <bs> <SID>on_backspace()
	let b:apc_init_bs = 1
	let b:apc_init_cr = 1
	let b:apc_save_infer = &infercase
	setlocal infercase
	let b:apc_enable = 1
endfunc

" disable apc
function! s:apc_disable()
	if get(b:, 'apc_init_autocmd', 0)
		augroup ApcEventGroup
			au! 
		augroup END
	endif
	if get(b:, 'apc_init_tab', 0)
		silent! iunmap <buffer><expr> <tab>
		silent! iunmap <buffer><expr> <s-tab>
	endif
	if get(b:, 'apc_init_bs', 0)
		silent! iunmap <buffer><expr> <bs>
	endif
	if get(b:, 'apc_init_cr', 0)
		silent! iunmap <buffer><expr> <cr>
	endif
	if get(b:, 'apc_save_infer', '') != ''
		let &l:infercase = b:apc_save_infer
	endif
	let b:apc_init_autocmd = 0
	let b:apc_init_tab = 0
	let b:apc_init_bs = 0
	let b:apc_init_cr = 0
	let b:apc_save_infer = ''
	let b:apc_enable = 0
endfunc

" check if need to be enabled
function! s:apc_check_init()
	if &bt != ''
		return
	endif
	if get(g:apc_enable_ft, &ft, 0) != 0
		ApcEnable
	elseif get(g:apc_enable_ft, '*', 0) != 0
		ApcEnable
	elseif get(b:, 'apc_enable', 0)
		ApcEnable
	endif
endfunc

" commands & autocmd
command! -nargs=0 ApcEnable call s:apc_enable()
command! -nargs=0 ApcDisable call s:apc_disable()

augroup ApcInitGroup
	au!
	au FileType * call s:apc_check_init()
	au BufEnter * call s:apc_check_init()
	au TabEnter * call s:apc_check_init()
augroup END

" 设定需要生效的文件类型，如果是 "*" 的话，代表所有类型
let g:apc_enable_ft = {'text':1, 'markdown':1, 'php':1}

" 设定从字典文件以及当前打开的文件里收集补全单词，详情看 ':help cpt'
set cpt=.,k,w,b

" 不要自动选中第一个选项。
set completeopt=menu,menuone,noselect

" 禁止在下方显示一些啰嗦的提示
set shortmess+=c

"""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'

call vundle#end()            " required
filetype plugin indent on    " required


let g:NERDTreeWinSize=30

map <F7> :NERDTreeToggle<CR>
