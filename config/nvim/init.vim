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
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"===========plugin=============
call plug#begin()
    Plug 'yegappan/mru'
    Plug 'itchyny/lightline.vim'
    Plug 'preservim/nerdtree'
    Plug 'connorholyday/vim-snazzy'
    Plug 'dhruvasagar/vim-table-mode'
call plug#end()

color snazzy
"========Compile function=======
noremap r :call CompileRunGcc()<CR>
func! CompileRunGcc()
	exec "w"
	if &filetype == 'c'
		exec "!g++ % -o %<"
		exec "!time ./%<"
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
"==============end==============
