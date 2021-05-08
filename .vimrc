set nocompatible	"vim比vi支持更多功能，如showcmd，避免冲突和副作用
let mapleader = ","
filetype on
set rtp+=~/.vim/bundle/Vundle.vim 
set fileencodings=utf-8,gb2312,ucs-bom,euc-cn,euc-tw,gb18030,gbk,cp936


call vundle#begin()

"避免PluginClean把自己卸载了
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/taglist.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf' 
Plugin 'ycm-core/YouCompleteMe'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'mhinz/vim-startify'
Plugin 'mbbill/fencview'
Plugin 'skywind3000/gutentags_plus'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-fugitive'

"easymotion
nmap ss <Plug>(easymotion-s2)

"gutentags
"gutentags搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归 "
let g:gutentags_project_root = ['.pro']
"所生成的数据文件的名称 "
let g:gutentags_ctags_tagfile = '.tags'
"将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录 "
let g:gutentags_cache_dir = expand('~/.vim/tags')
"支持ctags和gtags
let g:gutentags_modules = []
if executable('ctags')
  let g:gutentags_modules += ['ctags']
endif
if executable('gtags-cscope') && executable('gtags')
  let g:gutentags_modules += ['gtags_cscope']
endif
"配置 ctags 的参数 "
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+plxcdefgmnstuv']
let g:gutentags_ctags_extra_args += ['--c-kinds=+plxcdefgmnstuv']

"搜索后聚焦于预览窗口
let g:gutentags_plus_switch = 1
"自定义快捷键
let g:gutentags_plus_nomap = 1
"搜索符号引用
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
"搜索符号定义
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
"搜索函数被调用处
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
"搜索函数调用
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
"查找字符串
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
"查找egrep
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
"查找文件
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
"查找头文件被include的地方
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
"查找符号被赋值处
noremap <silent> <leader>g= :GscopeFind a <C-R><C-W><cr>
"查找ctags数据库
noremap <silent> <leader>gz :GscopeFind z <C-R><C-W><cr>

"ycm
set runtimepath+=~/.vim/bundle/YouCompleteMe
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口"
let g:ycm_min_num_of_chars_for_completion=1                 " 从第1个键入字符就开始罗列匹配项
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_seed_identifiers_with_syntax = 1   "语法关键字补全 
"回车即选中当前项
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"            
"跳转到定义处 
nnoremap <leader>d :YcmCompleter GoToDefinitionElseDeclaration<CR>     


"fencview
"let g:fencview_autodetect = 1
"let g:fencview_auto_patterns = '*'



"fzf
map <leader>f  :Files<cr>
map <leader>t  :Tags<cr>
map <leader>b  :Buffers<cr>

"taglist
let Tlist_Ctags_Cmd='ctags'
let Tlist_Show_One_File=1               "不同时显示多个文件的tag，只显示当前文件的
let Tlist_WinWidt =28                   "设置taglist的宽度
let Tlist_Exit_OnlyWindow=1             "如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Use_Left_Windo =1             "在左侧窗口中显示taglist窗口 


"airline配置
set t_Co=256
set lazyredraw
set laststatus=2  "永远显示状态栏
let g:airline_powerline_fonts = 1  " 支持 powerline 字体
let g:airline#extensions#tabline#enabled = 1 " 显示窗口tab和buffer


" NerdTree才插件的配置信息
"将F2设置为开关NERDTree的快捷键
noremap <f2> :NERDTreeToggle<cr>
"通过打开文件快速定位目录
noremap <leader>v :NERDTreeFind<cr> 
"修改树的显示图标
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
"窗口是否显示行号
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeWinPos='right'



"taglist
map <f3> :Tlist<cr>
"只显示当前文件
let g:Tlist_Show_One_File=1
"最后一个窗口时推出
let g:Tlist_Exit_Onlywindow=1



call vundle#end()
filetype plugin indent on
"安装插件，先找到其在github的地址，再将配置信息加入.vimrc中的call
"vundle#begin()和call vundle#end()之间，最后进入vim执行
":PluginInstall 便可自动安装
"要卸载插件，先在.vimrc中注释或删除对应插件配置信息，然后在vim中执行
":PluginClean便可卸载对应插件
"批量更新，只需执行:PluginUpdate


set number    "显示行号 
set ignorecase "忽略大小写 
set hlsearch  "收索高亮
set autoread  "文件改变时自动载入
syntax on     "语法高亮
set cursorline "突出显示当前行
"set mouse=a    "启用鼠标
"set selection=exclusive
"set selectmode=mouse,key
set laststatus=2 "显示状态栏
set completeopt=longest,menu  "自动补全
set ruler      "显示光标当前位置
set history=500   "显示当前行
set showmatch    "显示匹配括号
set background=dark
set ts=4        "tab键2格
set expandtab   "tab转空格
set shiftwidth=4 "自动缩进2格
set autoindent  "自动缩进
set backspace=indent,eol,start   "解决无法退格问题
set pastetoggle=<F9> "打开关闭自动缩进
set undofile
set undodir=~/.vim/undodir "撤销持久化

nnoremap <f1>  *
nnoremap <c-b> :bnext<cr>
nnoremap <c-h>    <c-w>h
nnoremap <c-j>    <c-w>j
nnoremap <c-k>    <c-w>k
nnoremap <c-l>    <c-w>l  
nnoremap <leader>h   :vertical res -5<cr> 
nnoremap <leader>j   :res +5<cr> 
nnoremap <leader>k   :res -5<cr> 
nnoremap <leader>l   :vertical res +5<cr> 
"快速注释
vnoremap y     "ay
vnoremap p     "ap
vnoremap P     "aP
vnoremap 9     $
nnoremap 9     $








"<c-i>前跳
"<c-o>回跳
",f   查找文件
",v   打开文件所在目录 
"zf 折叠代码
"zo 打开折叠
