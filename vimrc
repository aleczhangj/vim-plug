call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
Plug 'junegunn/vim-easy-align'

" go
Plug 'nsf/gocode', { 'rtp': 'vim' }
Plug 'luofei614/vim-golang'

" java
Plug 'artur-shaik/vim-javacomplete2'

" python
Plug 'rkulla/pydiction'

Plug 'ycm-core/YouCompleteMe'

Plug 'luofei614/vim-plug', { 'dir':'~/.vim/my'}

" Plug 'vim-scripts/AutoComplPop'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-scripts/Tagbar'

Plug 'vim-scripts/L9'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'mileszs/ack.vim'

" git 插件
Plug 'tpope/vim-fugitive'

" color
Plug 'vim-scripts/molokai'
Plug 'vim-scripts/Solarized'
Plug 'vim-scripts/lucius'

" todo
Plug 'vim-scripts/TaskList.vim'

"bookmark  mm 添加书签,  mn 移动书签  mp 移动到前一个书签  ma 删除所有书签
Plug 'MattesGroeger/vim-bookmarks'

"snippets
Plug 'MarcWeber/vim-addon-mw-utils'

"快速跳转到字符
Plug 'vim-scripts/EasyMotion'

" 标签栏
Plug 'https://github.com/bling/vim-airline.git'

" 检查程序语法错误
Plug 'https://github.com/scrooloose/syntastic.git'

call plug#end()

let mapleader = "\<space>"

"vimgrep查询时排除composer的vendor目录,排除前端bower和node的包文件目录,CommandT也不会查到他们
set wildignore=vendor/**

"autocomplpop 设置
let g:AutoComplPop_IgnoreCaseOption=1
set ignorecase
let g:acp_behaviorKeywordCommand="\<C-n>"

"搜索高亮
set hlsearch

"设置NERDTreetagbar的宽度
let g:NERDTreeWinSize = 30
let g:tagbar_width=40

"颜色主题设置
set t_Co=256

let g:solarized_termcolors=16
"两种流行风格的主题
" colorscheme molokai
colorscheme lucius
set background=dark
"colorscheme solarized
"set background=light

"快捷键设置
map <leader>N :NERDTreeToggle<CR>
map <leader>T :TagbarToggle<CR>
map <leader>C :!ctags -R<CR>

" 用FZF 查找文件 
" 设置查找时排除的目录
:let $FZF_DEFAULT_COMMAND  = 'find . -type f ! -path "./node_modules/*" ! -path "./bower_components/*" ! -path "./.git/*" ! -path "*.swp"'
map <C-P> :tabnew<CR>:FZF<CR>
map!<C-P> <ESc>:w<CR> :tabnew<CR>:FZF<CR>

"快速对齐
" Start interactive EasyAlign in visual mode (e.g. vip<Enter>)
vmap <Enter> <Plug>(EasyAlign)

"ctrl+s为保存
map <C-S> :w<CR>
inoremap <C-S> <C-O>:w<CR>

"ctrl+鼠标左键跳转
"--------------------
" Function: Open tag under cursor in new tab
" Source:   http://stackoverflow.com/questions/563616/vimctags-tips-and-tricks
"--------------------
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

function! InsertTabWrapper()
    let col=col('.')-1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<TAB>"
    else
        return "\<C-x>\<C-o>"
    endif
endfunction

"按tab键，全能提示，
"注意要用inoremap，不能用map！，如果用map！在命令模式下tab键没有提示功能。
inoremap <TAB> <C-R>=InsertTabWrapper()<CR>
"shift+tab 展开代码片段
imap <S-TAB> <Plug>snipMateNextOrTrigger

"在mac下iterm终端标题中中显示文件名称
autocmd BufEnter *.* exe 'silent ! echo -ne "\033];%:t\007"'

"支持鼠标
set mouse=v
" 支持将vim中复制的内容复制到系统剪切板
set clipboard=unnamed

"用数字切换tab页面
noremap  <leader>1 1gt
noremap  <leader>2 2gt
noremap  <leader>3 3gt
noremap  <leader>4 4gt
noremap  <leader>5 5gt
noremap  <leader>6 6gt
noremap  <leader>7 7gt
noremap  <leader>8 8gt
noremap  <leader>9 9gt
noremap  <leader>0 :tablast<CR>

"语法高亮
syntax enable
syntax on
set autoindent
set number
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
"加快速度
"set synmaxcol=200
set ttyfast " u got a fast terminal
set ttyscroll=3
set lazyredraw " to avoid scrolling problems
set scrolljump=5
"删除键
set backspace=eol,start,indent

"基本设置
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,chinese
set ambiwidth=double
set wrap "自动换行

"设置无备份
set nobackup
set nowritebackup

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

autocmd FileType java setlocal omnifunc=javacomplete#Complete

" pydirection
let g:pydiction_location = '/Users/zhangjie/.vim/plugged/pydiction/complete-dict'
let g:pydiction_menu_height = 20

nmap <leader>k <C-w>k
nmap <leader>j <C-w>j
nmap <leader>h <C-w>h
nmap <leader>l <C-w>l

" nnoremap <Leader>a :Ack!<Space>

map <leader>td <Plug>TaskList

" ycm
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
