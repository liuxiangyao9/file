"============basis==============
inoremap jk <Esc>
map s <nop>
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
"============set==============
set number
set hlsearch
exec "nohlsearch"
set ignorecase
set wildmenu

set nocompatible
set backspace=indent,eol,start

set expandtab
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
"==========plugin_set==========
" transparent
let g:SnazzyTransparent = 1

" NERDTreeConfig
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeHidden=0
let g:NERDTreeWinSize=16
let g:NERDTreeShowLineNumbers=0
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='-'
let NERDTreeMinimalUI=1
let NERDTreeShowBookmarks=0
let NERDTreeIgnore=['\.lnk']
"===========plugin=============
call plug#begin()
    Plug 'yegappan/mru'
    Plug 'itchyny/lightline.vim'
    Plug 'preservim/nerdtree'
    Plug 'connorholyday/vim-snazzy'
    Plug 'iamcco/markdown-preview.vim'
    Plug 'dhruvasagar/vim-table-mode'
call plug#end()

color snazzy
"==============end==============
" Compile function
map r :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'markdown'
        exec "MarkdownPreview"
    endif
endfunc
