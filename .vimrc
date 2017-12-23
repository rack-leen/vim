"=============================================================
"
"File    :  .vimrc
"Author  :  rack-leen
"Date    :  2017-12-20
"Github  :  https://github.com/rack-leen/
"
"=============================================================


""============================================================
""|                       _oo0oo_                            |
""|                      o8888888o                           |
""|                      88" . "88                           |
""|                      (| -_- |)                           |
""|                      0\  =  /0                           |
""|                    ___/`---'\___                         |
""|                  .' \\|     |// '.                       |
""|                 / \\|||  :  |||// \                      |
""|                / _||||| -:- |||||- \                     |
""|               |   | \\\  -  /// |   |                    |
""|               | \_|  ''\---/''  |_/ |                    |
""|               \  .-\__  '-'  ___/-. /                    |
""|             ___'. .'  /--.--\  `. .'___                  |
""|          ."" '<  `.___\_<|>_/___.' >' "".                |
""|         | | :  `- \`.;`\ _ /`;.`/ - ` : | |              |
""|         \  \ `_.   \_ __\ /__ _/   .-` /  /              |
""|     =====`-.____`.___ \_____/___.-`___.-'=====           |
""|                       `=---='                            |
""|                                                          |
""|                                                          |
""|     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~           |
""|                                                          |
""|               佛祖保佑        永无BUG                    |
""|                                                          |
""============================================================


set sw=4
set ts=4
set et
set smarttab
set smartindent
set lbr
set fo+=mB
set sm
set selection=inclusive
set wildmenu
set mousemodel=popup
au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
au FileType css setlocal dict+=~/.vim/dict/css.dict
au FileType c setlocal dict+=~/.vim/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
au FileType scale setlocal dict+=~/.vim/dict/scale.dict
au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/css.dict

"------------------------------------------------------------------------------
"定义快捷键前缀
"------------------------------------------------------------------------------
" 定义快捷键的前缀，即<Leader>,定义的这个前缀是键盘上右手小拇指所在的分号
let mapleader=";" 

"syntastic相关
execute pathogen#infect()
let g:syntastic_python_checkers=['pylint']
let g:syntastic_php_checkers=['php', 'phpcs', 'phpmd']
"golang
"Processing... % (ctrl+c to stop)
let g:fencview_autodetect=0
set rtp+=$GOROOT/misc/vim
"------------------------------------------------------------------------------
" 显示相关  
"------------------------------------------------------------------------------
syntax on " 语法高亮
syntax enable
"colorscheme desert "配色方案
set cul "高亮光标所在行
set cuc
set shortmess=atI   " 启动的时候不显示那个援助乌干达儿童的提示  
set go=             " 不要图形按钮  
"color solarized    " 设置背景主题  
"color molokai      " 设置背景主题  
"color desert       " 设置背景主题  
color ron           " 设置背景主题  
"color torte        " 设置背景主题  
"set guifont=Courier_New:h10:cANSI   " 设置字体  
"autocmd InsertLeave * se nocul  " 用浅色高亮当前行  
autocmd InsertEnter * se cul    " 用浅色高亮当前行  
set ruler           " 显示标尺  
set showcmd         " 输入的命令显示出来，看的清楚些  
"set whichwrap+=<,>,h,l   " 允许backspace和光标键跨越行边界(不建议)  
set scrolloff=3     " 光标移动到buffer的顶部和底部时保持3行距离  
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)  
set foldenable      " 允许折叠  
""set foldmethod=manual   " 手动折叠  
set nocompatible  "去掉讨厌的有关vi一致性模式，避免以前版本的一些bug和局限  
" 显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 使用空格代替制表符
set expandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"搜索逐字符高亮
set hlsearch
set incsearch
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 总是显示状态行
set cmdheight=2
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

"markdown配置
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   set filetype=mkd
au BufRead,BufNewFile *.{go}   set filetype=go
au BufRead,BufNewFile *.{js}   set filetype=javascript
"rkdown to HTML  
nmap md :!~/.vim/markdown.pl % > %.html <CR><CR>
nmap fi :!firefox %.html & <CR><CR>
nmap \ \cc
vmap \ \cc

"将tab替换为空格
nmap tt :%s/\t/    /g<CR>



"------------------------------------------------------------------------------
"""""新文件标题
"------------------------------------------------------------------------------
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.rb,*.java,*.py exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' 
		call setline(1,"\#!/bin/bash") 
		call append(line("."), "") 
    elseif &filetype == 'python'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# -*-coding=utf-8-*-")
        call append(line(".")+1, "'''")
        call append(line(".")+2, "  > File Nmae :",expand("%"))
        call append(line(".")+3, "  > Author    : rack")
        call append(line(".")+4, "  > Function  :")
        call append(line(".")+5, "  > Github    : https://github.com/rack-leen")
		call append(line(".")+6, "	> Date      : ".strftime("%c")) 
        call append(line(".")+7, "'''")
	    call append(line(".")+8, "") 

    elseif &filetype == 'ruby'
        call setline(1,"#!/usr/bin/env ruby")
        call append(line("."),"# encoding: utf-8")
	    call append(line(".")+1, "")

"    elseif &filetype == 'mkd'
"        call setline(1,"<head><meta charset=\"UTF-8\"></head>")
"    else 
"		call setline(1, "/*************************************************************************") 
"		call append(line("."), "* > File Name: ".expand("%")) 
"		call append(line(".")+1, "* > Author   : rack") 
"       call append(line(".")+2, "* > Function : ")
"       call append(line(".")+3, "* > Type     :") 
"       call append(line(".")+4, "* > Github   : https://github.com/rack-leen")
"		call append(line(".")+5, "* > Date     : ".strftime("%c")) 
"		call append(line(".")+6, "**************************************************************************/") 
"		call append(line(".")+7, "")
	endif
	if expand("%:e") == 'cpp'
		call append(line(".")+6, "#include <iostream>")
		call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	endif
	if &filetype == 'c'
		call append(line(".")+8, "#include <stdio.h>")
		call append(line(".")+9, "")
	endif
	if expand("%:e") == 'h'
		call append(line(".")+8, "#ifndef _".toupper(expand("%:r"))."_H")
		call append(line(".")+9, "#define _".toupper(expand("%:r"))."_H")
		call append(line(".")+10, "")
		call append(line(".")+11, "/*************************************************************************")
		call append(line(".")+12, "* > 头文件")
		call append(line(".")+13, "**************************************************************************/")
		call append(line(".")+14, "")
		call append(line(".")+15, "#endif")
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%:r"))
		call append(line(".")+7,"")
	endif
	"新建文件后，自动定位到文件末尾
endfunc 
autocmd BufNewFile * normal G


"------------------------------------------------------------------------------
"键盘命令
"------------------------------------------------------------------------------
:nmap <silent> <F9> <ESC>:Tlist<RETURN>
" shift tab pages
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>
map! <C-Z> <Esc>zzi
map! <C-O> <C-Y>,
map <C-A> ggVG$"+y
map <Esc><Esc> :w<CR>
map <F12> gg=G
map <C-w> <C-w>w
imap <C-k> <C-y>,
imap <C-t> <C-q><TAB>
imap <C-j> <ESC>
" 选中状态下 Ctrl+c 复制
"map <C-v> "*pa
imap <C-v> <Esc>"*pa
imap <C-a> <Esc>^
imap <C-e> <Esc>$
vmap <C-c> "+y
set mouse=v
"set clipboard=unnamed
"去空行  
nnoremap <F2> :g/^\s*$/d<CR> 
"比较文件  
nnoremap <C-F2> :vert diffsplit 
"nnoremap <Leader>fu :CtrlPFunky<Cr>
"nnoremap <C-n> :CtrlPFunky<Cr>
"列出当前目录文件  
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
"打开树状文件目录  
map <C-F3> \be  
:autocmd BufRead,BufNewFile *.dot map <F5> :w<CR>:!dot -Tjpg -o %<.jpg % && eog %<.jpg  <CR><CR> && exec "redr!"
"C，C++ 按F5编译运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
	elseif &filetype == 'cpp'
		exec "!g++ % -std=c++11 -o %<"
		exec "!time ./%<"
	elseif &filetype == 'java' 
		exec "!javac %" 
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		exec "!time python2.7 %"
    elseif &filetype == 'html'
        exec "!firefox % &"
    elseif &filetype == 'go'
"        exec "!go build %<"
        exec "!time go run %"
    elseif &filetype == 'mkd'
        exec "!~/.vim/markdown.pl % > %.html &"
        exec "!firefox %.html &"
	endif
endfunc
"C,C++的调试
map <F8> :call Rungdb()<CR>
func! Rungdb()
	exec "w"
	exec "!g++ % -std=c++11 -g -o %<"
	exec "!gdb ./%<"
endfunc


"代码格式优化化

map <F6> :call FormartSrc()<CR><CR>

"定义FormartSrc()
func FormartSrc()
    exec "w"
    if &filetype == 'c'
        exec "!astyle --style=ansi -a --suffix=none %"
    elseif &filetype == 'cpp' || &filetype == 'hpp'
        exec "r !astyle --style=ansi --one-line=keep-statements -a --suffix=none %> /dev/null 2>&1"
    elseif &filetype == 'perl'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'py'||&filetype == 'python'
        exec "r !autopep8 -i --aggressive %"
    elseif &filetype == 'java'
        exec "!astyle --style=java --suffix=none %"
    elseif &filetype == 'jsp'
        exec "!astyle --style=gnu --suffix=none %"
    elseif &filetype == 'xml'
        exec "!astyle --style=gnu --suffix=none %"
    else
        exec "normal gg=G"
        return
    endif
    exec "e! %"
endfunc
"结束定义FormartSrc


"------------------------------------------------------------------------------
""实用设置
"------------------------------------------------------------------------------
if has("autocmd")
      autocmd BufReadPost *
          \ if line("'\"") > 0 && line("'\"") <= line("$") |
          \   exe "normal g`\"" |
          \ endif
endif
autocmd vimenter * if !argc() | Tlist | endif   
"当打开vim且没有文件时自动打开NERDTree
autocmd vimenter * if !argc() | NERDTree | endif
" 只剩 NERDTree时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
set completeopt=preview,menu 
"允许插件  
"filetype plugin on
"共享剪贴板  
set clipboard+=unnamed 
"自动保存
set autowrite
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
""set foldcolumn=0
""set foldmethod=indent 
""set foldlevel=3 
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
"禁止生成临时文件
set nobackup
set noswapfile
"搜索忽略大小写
set ignorecase

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
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
"自动补全
"":inoremap ( ()<ESC>i
"":inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
"":inoremap [ []<ESC>i
"":inoremap ] <c-r>=ClosePair(']')<CR>
"":inoremap " ""<ESC>i
"":inoremap ' ''<ESC>i
""function! ClosePair(char)
""	if getline('.')[col('.') - 1] == a:char
""		return "\<Right>"
""	else
""		return a:char
""	endif
""endfunction
filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu



set iskeyword+=.
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030

autocmd FileType python set omnifunc=pythoncomplete#Complete

"set nocompatible               " be iMproved


"------------------------------------------------------------------------------
"vundle 插件列表开始
"------------------------------------------------------------------------------
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/　
call vundle#begin()

" let Vundle manage Vundle
" required! 
Plugin 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'Yggdroot/indentLine'
let g:indentLine_char = '┊'
"ndle 'tpope/vim-rails.git'
" vim-scripts repos
Plugin 'L9'
Plugin 'FuzzyFinder'
" non github repos
Plugin 'https://github.com/wincent/command-t.git'
Plugin 'Auto-Pairs'
Plugin 'python-imports.vim'
Plugin 'CaptureClipboard'
Plugin 'ctrlp-modified.vim'
Plugin 'last_edit_marker.vim'
Plugin 'synmark.vim'
Plugin 'Python-mode-klen'
Plugin 'SQLComplete.vim'
"Plugin 'Javascript-OmniCompletion-with-YUI-and-j'
"Plugin 'JavaScript-Indent'
"Plugin 'Better-Javascript-Indentation'
"Plugin 'jslint.vim'
"Plugin 'pangloss/vim-javascript'
Plugin 'Vim-Script-Updater'
Plugin 'ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
"Plugin 'jsbeautify'
Plugin 'The-NERD-Commenter'
Plugin 'c.vim'
Plugin 'taglist.vim'
Plugin 'vim-scripts/TaskList.vim'
Plugin 'majutsushi/tagbar'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips' 
Plugin 'python-mode/python-mode' 
Plugin 'godlygeek/tabular' 
Plugin 'easymotion/vim-easymotion' 
Plugin 'scrooloose/nerdcommenter'                      
Plugin 'sjl/gundo.vim'
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'vim-syntastic/syntastic' 
Plugin 'derekwyatt/vim-protodef'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'lilydjwg/fcitx.vim'
Plugin 'tpope/vim-git'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-pathogen'
Plugin 'plasticboy/vim-markdown'
Plugin 'chiel92/vim-autoformat'
"Plugin 'suan/vim-instant-markdown'
Plugin 'tpope/vim-surround'
Plugin 'mzlogin/vim-markdown-toc'
Plugin 'jszakmeister/markdown2ctags'
Plugin 'iamcco/markdown-preview.vim'
"Plugin 'vim-wakatime'
"Plugin 'flazz/vim-colorschemes'
"Plugain 'vim-signify'
"Plugin 'tpope/vim-fugitive'
"Plugin 'vim-chat/vim-chat'
"django
"Plugin 'django_templates.vim'
"Plugin 'Django-Projects'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'FredKSchott/CoVim'
"Plugin 'djangojump'
" ...
call vundle#end()

"--------------------------------------------------------------------------------
"vundle 插件列表结束
"--------------------------------------------------------------------------------
filetype plugin indent on     " required!

"--------------------------------------------------------------------------------
"插件配置开始
"--------------------------------------------------------------------------------

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"1 ycm语义补全
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
" YCM 补全菜单配色
" 菜单
"highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
" 选中项
"highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
" 补全功能在注释中同样有效
let g:ycm_complete_in_comments=1
" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf=0
" 开启 YCM 标签补全引擎
let g:ycm_collect_identifiers_from_tags_files=1
"OmniCppComplete 基于标签补全
set tags+=/usr/include/c++/4.8/stdcpp.tags　 "cpp义补全　引入 C++ 标准库tags
set tags+=/usr/include/sys.tags              "linux系统api 语义补全
" YCM 集成 OmniCppComplete 补全引擎，设置其快捷键
inoremap <leader>; <C-x><C-o>
" 补全内容不以分割子窗口形式出现，只显示补全列表
set completeopt-=preview
" 从第一个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=1
" 禁止缓存匹配项，每次都重新生成匹配项
let g:ycm_cache_omnifunc=0
" 语法关键字补全			
let g:ycm_seed_identifiers_with_syntax=1
" 手工补全
inoremap <leader>; <C-x><C-o>

"--------------------------------------------------------------------------------
"2 vim-airline
"--------------------------------------------------------------------------------
"let g:airline_theme="molokai" 

"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1   

"打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"设置切换Buffer快捷键"
nnoremap <C-tab> :bn<CR>
nnoremap <C-s-tab> :bp<CR>
" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
" 设置consolas字体"前面已经设置过
"set guifont=Consolas\ for\ Powerline\ FixedD:h11
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.maxlinenr = '㏑'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.spell = 'Ꞩ'
"let g:airline_symbols.notexists = '∄'
"let g:airline_symbols.whitespace = 'Ξ'
 " powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.maxlinenr = ''

" old vim-powerline symbols
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'

"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'
"let g:airline_symbols.linenr = '⭡'

"--------------------------------------------------------------------------------
"3 ultisnips 模板补全
"--------------------------------------------------------------------------------
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
let g:UltiSnipsSnippetDirectories=["mysnippets"]  "模板所在目录名

"-------------------------------------------------------------------------------
"4 The NERD Commenter 
"-------------------------------------------------------------------------------
"注释符号后面空一格
let g:NERDSpaceDelims=1
"加注释
nmap <Leader>cc <cr>    
"解开注释
nmap <C-c>cu   <cr>
"加上/解开注释, 智能判断 
nmap <C-c>c<space> <cr>
"先复制, 再注解(p可以进行黏贴)
nmap <Leader>cy <cr>  

"-------------------------------------------------------------------------------
"5 ctrlp设置
"-------------------------------------------------------------------------------
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.png,*.jpg,*.gif     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.pyc,*.png,*.jpg,*.gif  " Windows

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = '\v\.(exe|so|dll)$'
let g:ctrlp_extensions = ['funky']

let NERDTreeIgnore=['\.pyc']

"------------------------------------------------------------------------------
"6 NERDTree配置
"------------------------------------------------------------------------------
"map <C-c>e :NERDTreeToggle 
"nmap ne :NERDTree<cr>
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

"------------------------------------------------------------------------------
"7 Taglist配置
"------------------------------------------------------------------------------
"map <C-c>l :Tlist
"默认打开Taglist 
let Tlist_Auto_Open=0 

let Tlist_Ctags_Cmd = '/usr/local/bin/ctags' 
let Tlist_Show_One_File = 1 "不同时显示多个文件的tag，只显示当前文件的 
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1 "如果taglist窗口是最后一个窗口，则退出vim 
let Tlist_Use_Right_Window = 1 "在右侧窗口中显示taglist窗口
" minibufexpl插件的一般设置
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1  
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1 = "inc"
nmap tl :Tlist<cr>


"------------------------------------------------------------------------------
"8 python补全
"------------------------------------------------------------------------------
let g:pydiction_location = '~/.vim/after/complete-dict'
let g:pydiction_menu_height = 20
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1


"------------------------------------------------------------------------------
"9 CTags的设定  
"------------------------------------------------------------------------------
let Tlist_Sort_Type = "name"          " 按照名称排序  
let Tlist_Use_Right_Window = 1        " 在右侧显示窗口  
let Tlist_Compart_Format = 1          " 压缩方式  
let Tlist_Exist_OnlyWindow = 1        " 如果只有一个buffer，kill窗口也kill掉buffer  
""let Tlist_File_Fold_Auto_Close = 0  " 不要关闭其他文件的tags  
""let Tlist_Enable_Fold_Column = 0    " 不要显示折叠树  
"let Tlist_Show_One_File=1            " 不同时显示多个文件的tag，只显示当前文件的
"设置tags  
set tags=tags;  
set autochdir 
"
"------------------------------------------------------------------------------
"10 vim-protodef  FSwitch
"------------------------------------------------------------------------------
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1

" 设置 pullproto.pl 脚本路径
let g:protodefprotogetter='~/.vim/bundle/protodef/pullproto.pl'
" 成员函数的实现顺序与声明顺序一致
let g:disable_protodef_sorting=1

"------------------------------------------------------------------------------
"11 miniBufExplorer配置
"------------------------------------------------------------------------------
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>
"------------------------------------------------------------------------------
"12 gundo无限撤销
"------------------------------------------------------------------------------
" 调用 gundo 树
nnoremap <Leader>ud :GundoToggle<CR>
" 开启保存 undo 历史功能
set undofile
" undo 历史保存路径
set undodir=~/.undo_history/

"------------------------------------------------------------------------------
"13 javacomplete 配置
"------------------------------------------------------------------------------
setlocal omnifunc=javacomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType java set completefunc=javacomplete#CompleteParamsInf
autocmd FileType java inoremap <expr><CR> pumvisible()?"\<C-Y>":"<CR>"
"appledeMacBook-Pro:vim apple$

"------------------------------------------------------------------------------
"14 viim-chat聊天插件配置
"------------------------------------------------------------------------------
"call dein#add('wsdjeg/vim-chat')  "增加聊天插件
"call chat#chatting#OpenMsgWin()   
"call chat#qq#start()

"------------------------------------------------------------------------------
"15 vim-pathogen插件管理配置
"------------------------------------------------------------------------------
"可以将下载的插件各自独自占一个目录
execute pathogen#infect()
syntax on
filetype plugin indent on

"------------------------------------------------------------------------------
"16库信息参考
"------------------------------------------------------------------------------
" 启用:Man命令查看各类man信息
source $VIMRUNTIME/ftplugin/man.vim
" 定义:Man命令查看各类man信息的快捷键
nmap <Leader>man :Man 3 <cword><CR>

"------------------------------------------------------------------------------
"17　miniBufExplorer多文档编辑
"------------------------------------------------------------------------------
" 显示/隐藏 MiniBufExplorer 窗口
map <Leader>bl :MBEToggle<cr>
" buffer 切换快捷键
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>

"------------------------------------------------------------------------------
"18 一键编译
"------------------------------------------------------------------------------
"编译
nmap <Leader>ma :!rm -rf main<CR>:wa<CR>:make<CR><CR>:cw<CR>
"编译及运行
nmap <Leader>g :!rm -rf main<CR>:wa<CR>:make<CR>:cw<CR><CR>:!./main<CR>

"------------------------------------------------------------------------------
"19 vim-markdown配置
"------------------------------------------------------------------------------
"au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn}   
"set filetype=mkd 

"------------------------------------------------------------------------------
"20 markdown2ctags
"------------------------------------------------------------------------------
"在tagbar中添加markdown支持
let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '~/.vim/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
    \ 's:sections',
    \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
    \ 's' : 'section',
    \ },
    \ 'sort': 0,
\ }

"------------------------------------------------------------------------------
"21 markdown-preview预览插件 
"------------------------------------------------------------------------------
let g:mkdp_path_to_chrome="firefox"
let g:mkdp_auto_close=0
nmap <F7> <Plug>MarkdownPreview
nmap <F8> <Plug>StopMarkdownPreview

"  ----------------------------------------------------------------------------
"　插件介绍
"  ----------------------------------------------------------------------------

" 'gmarik/vundle'
" 'tpope/vim-fugitive'
" 'rstacruz/sparkup', {'rtp': 'vim/'}
" 'Yggdroot/indentLine'
" 'tpope/vim-rails.git'
" 'vim-scripts repos'
" 'L9'
" 'FuzzyFinder'
" 'https://github.com/wincent/command-t.git'
" 'Auto-Pairs'
" 'python-imports.vim'
" 'CaptureClipboard'
" 'ctrlp-modified.vim'
" 'last_edit_marker.vim'
" 'synmark.vim'          
" 'Python-mode-klen'                         # python ide
" 'SQLComplete.vim'                          # sql代码完成系统
" 'Javascript-OmniCompletion-with-YUI-and-j' # Javascript
" 'JavaScript-Indent'                        # Javascript
" 'Better-Javascript-Indentation'            # javascript
" 'jslint.vim'　　　　　　　　　　　　       # javascript
" 'pangloss/vim-javascript'                  # Javascript
" 'Vim-Script-Updater'　　　　　　　　       # vim插件更新
" 'ctrlp.vim'                                # 文件搜索
" 'tacahiroy/ctrlp-funky'　　　　　　        # ctrlp文件搜索扩展
" 'jsbeautify'                               # Javascript代码美化
" 'The-NERD-Commenter'　                     # 注释工具，可以用这个插件实现统一的注释
" 'c.vim'                                    # c语言语法高亮
" 'taglist.vim'                              # 把当前文件中的宏、全局变量、函数等tag显示在Symbol窗口，用鼠标点上述tag，就跳到该tag定义的位置
" 'vim-scripts/TaskList.vim'                 # 任务列表
" 'majutsushi/tagbar'                        # 可以将正在编辑的文件生成一个大纲, 包含类/方法/变量等, 可以选中快速跳转到目标位置, 编辑大文件特别有用
" 'Valloric/YouCompleteMe'                   # vim自动补全神器
" 'SirVer/ultisnips'                         # 自动补全代码片段　，例如宏定义，只需ifn+<Tab>键
" 'python-mode/python-mode'                  # 用来打造强大的python ide
" 'godlygeek/tabular'                        # 对齐；或者＝
" 'easymotion/vim-easymotion'                # 定位插件，能够准确定位到某个字母
" 'scrooloose/nerdcommenter'                 # 用来批量注释与反注释
" 'sjl/gundo.vim'                            # 提供无限撤销
" 'mattn/emmet-vim'　　　　　　　　　        # 它使用仿CSS选择器的语法来生成代码,提高HTML/CSS代码编写的速度,
" 'vim-airline/vim-airline'　　              # 提供底部状态栏和顶部buffer
" 'tomasr/molokai'                           # 一种主题
" 'altercation/vim-colors-solarized'　       # 一种主题
" 'vim-syntastic/syntastic'                  # 实时进行语法检查
" 'django_templates.vim'                     # django_templates模板
" " 'derekwyatt/vim-protodef'                  # 能根据类声明自动生成类实现的代码框架
" 'derekwyatt/vim-fswitch'                   # 能根据类声明自动生成类实现的代码框架
" 'fholgado/minibufexpl.vim'　　　　　       # 多文档编辑
" 'suan/vim-instant-markdown'                # markdown插件
" 'lilydjwg/fcitx.vim'                       # 能够使得在insert模式使用中文输入法，进入命令行模式直接使用英文
" 'tpope/vim-pathogen'                       #插件管理的插件
" 'plasticboy/vim-markdown'                  #markdown文档插件
