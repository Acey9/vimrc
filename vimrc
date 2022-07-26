"""""""""""""""""" settings 
syntax on
"set mouse=a
set background=dark
"colorscheme darkblue       " 设定配色方案
"set background=light
"colorscheme solarized       " 设定配色方案
"set number                  " 显示行号
"set cursorline              " 突出显示当前行
set ruler                   " 打开状态栏标尺
set shiftwidth=4            " 设定 << 和 >> 命令移动时的宽度为 4
set expandtab
set softtabstop=4           " 使得按退格键时可以一次删掉 4 个空格
set tabstop=4               " 设定 tab 长度为 4
set nobackup                " 覆盖文件时不备份
set backupcopy=yes          " 设置备份时的行为为覆盖
"set ignorecase smartcase    " 搜索时忽略大小写，但在有一个或以上大写字母时仍保持对大小写敏感
set nowrapscan              " 禁止在搜索到文件两端时重新搜索
"set incsearch               " 输入搜索内容时就显示搜索结果
set hlsearch                " 搜索时高亮显示被找到的文本
set noerrorbells            " 关闭错误信息响铃
set novisualbell            " 关闭使用可视响铃代替呼叫
set t_vb=                   " 置空错误铃声的终端代码
" set showmatch               " 插入括号时，短暂地跳转到匹配的对应括号
" set matchtime=2             " 短暂跳转到匹配括号的时间
set magic                   " 设置魔术
set hidden                  " 允许在有未保存的修改时切换缓冲区，此时的修改由 vim 负责保存
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
set autoindent              " 自动缩进
set cindent                 " 类似C语言风格的缩进
set smartindent             " 开启新行时使用智能自动缩进
set backspace=indent,eol,start  " 不设定在插入状态无法用退格键和 Delete 键删除回车符
set cmdheight=1             " 设定命令行的行数为 1
set laststatus=2            " 显示状态栏 (默认值为 1, 无法显示状态栏)
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\ 
set encoding=utf-8
"let &termencoding=&encoding
"set termencoding=gb18030
set termencoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set nocompatible            " 关闭 vi 兼容模式
filetype off                  " required
filetype plugin on   " 开启插件
"autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=79
"
"
"
"
"
"
"
"
"
"""""""""""""""""""""""""" plugin 
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim  " Vundle管理插件
" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() " 另一种选择, 指定一个vundle安装插件的路径: call vundle#begin('~/some/path/here')
"
" 常用的命令
" :PluginList       - 列出所有已配置的插件
" :PluginInstall       - 安装插件,追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件,需要确认; 追加 `!` 自动批准移除未使用插件
"
Plugin 'VundleVim/Vundle.vim' " 让vundle管理插件版本,必须

Plugin 'fatih/vim-go'
" go install github.com/nsf/gocode@latest
"Plugin 'Blackrush/vim-gocode'
Bundle 'Blackrush/vim-gocode'

"cd ~/.vim/bundle/YouCompleteMe
"   python3 install.py --all
"For Intel and arm64 Macs, the bundled libclang/clangd work:
"   cd ~/.vim/bundle/YouCompleteMe
"   python3 install.py --all
"If you have troubles with finding system frameworks or C++ standard library, try using the homebrew llvm:
"   brew install llvm
"   cd ~/.vim/bundle/YouCompleteMe
"   python3 install.py --system-libclang --all
Plugin 'Valloric/YouCompleteMe'

Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'file:///home/gmarik/path/to/plugin'
"Plugin 'user/L9', {'name': 'newL9'}
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'majutsushi/tagbar'

call vundle#end()            " 必须, 有插件需要在下面这行之前
filetype plugin indent on    " 必须 加载vim自带和插件相应的语法和文件类型相关脚本
" 忽视插件改变缩进,可以使用以下替代:
"filetype plugin on


" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap <F3> :NERDTreeToggle<cr>

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
nmap <F2> :TagbarToggle<CR>

" ctrap
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif "MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_cmd = 'CtrlP'
"let g:ycm_use_clangd = 0
"let g:loaded_youcompleteme = 1
