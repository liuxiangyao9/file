nmap s <nop>
nmap S :w<CR>
nmap Q :q<CR>
nmap r <nop>
nmap R :source $MYVIMRC<CR>
nmap t <nop>
nmap T <nop>
map <F2> :NERDTreeToggle<CR>
map <F3> :MRU<CR>
nmap <A-=> :call Term()<CR>
tmap <A-=> <C-\><C-n>:q<CR>

set number
set ignorecase
set history=400
exec "nohlsearch"
set guicursor=i:block

set expandtab
set tabstop=4
set autoindent
set shiftwidth=4
set softtabstop=4

call plug#begin()
    Plug 'yegappan/mru'
    Plug 'preservim/nerdtree'
call plug#end()

let NERDTreeMinimalUI=1
let g:NERDTreeWinSize=15
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='-'
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

func! Term()
    set splitbelow
    exec "cd %:p:h"
    exec "sp term://$SHELL"
endfunc
