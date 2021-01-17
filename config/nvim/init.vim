" =========
" 基础设置
" =========

map s :MRU<CR>
map S :w<CR>
map Q :q<CR>
noremap t :call CompileRunGcc()<CR>
map T :source $MYVIMRC<CR>
map <F2> :NERDTreeToggle<CR>

set number
syntax on
set hlsearch
exec "nohlsearch"
set guicursor=i:block
set ignorecase
set wildmenu
set history=400
set listchars=tab:»■,trail:■

set nocompatible
set backspace=indent,eol,start

set expandtab
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

" =========
" 插件设置
" =========

" vim-plug
call plug#begin()
    Plug 'yegappan/mru'
    Plug 'itchyny/lightline.vim'
    Plug 'preservim/nerdtree'
    Plug 'connorholyday/vim-snazzy'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'tpope/vim-markdown'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" transparent
let g:SnazzyTransparent = 1

" NERDTreeConfig
let g:NERDTreeHidden=0
let g:NERDTreeWinSize=16
let g:NERDTreeShowLineNumbers=0
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='-'
let NERDTreeMinimalUI=1
let NERDTreeShowBookmarks=0
let NERDTreeIgnore=['\.lnk']
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" =========
" 一键运行
" =========

func! CompileRunGcc()
	exec "w"
    if &filetype == 'c'
        if !isdirectory('build')
            execute "!mkdir build"
        endif
        execute "!gcc % -o build/%<"
        execute "!time ./build/%<"
	elseif &filetype == 'cpp'
		set splitbelow
		exec "!g++ -std=c++11 % -Wall -o %<"
		:sp
		:res -15
		:term ./%<
	elseif &filetype == 'java'
		exec "!javac %"
		exec "!time java %<"
	elseif &filetype == 'sh'
		:!time bash %
	elseif &filetype == 'python'
		set splitbelow
		:sp
		:term python3 %
	elseif &filetype == 'html'
		silent! exec "!".g:mkdp_browser." % &"
	elseif &filetype == 'javascript'
		set splitbelow
		:sp
		:term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
	endif
endfunc
