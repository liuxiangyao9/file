nmap s <nop>
nmap S :w<CR>
nmap Q :q<CR>
nmap r <nop>
nmap R :source $MYVIMRC<CR>
nmap t <nop>
nmap T <nop>
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
call plug#end()

func! Term()
    set splitbelow
    exec "cd %:p:h"
    exec ":sp term://$SHELL"
endfunc

autocmd TermOpen * startinsert
