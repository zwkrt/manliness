" TAKE ME TO YOUR <leader>!
""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<cr>
nmap <leader>wq :wqall<cr>
nmap <leader>d :ene<CR>:bd #<CR>


" Movement/Redraw
"""""""""""""""""""""""""""""""""""""""""""""""
imap <C-w> <ESC><C-w>

map j gj
map k gk
set wrap
set lazyredraw

set number ruler

set hidden
set autoread


" Search
"""""""""""""""""""""""""""""""""""""""""""""""
set incsearch hlsearch
set showmatch
nnoremap <silent> <Space> :silent noh<Bar>echo<CR>


" Menu
"""""""""""""""""""""""""""""""""""""""""""""""
set shiftwidth=4 tabstop=4
set wildmenu


" Programming
"""""""""""""""""""""""""""""""""""""""""""""""
set ffs=unix
colorscheme default
syntax enable
filetype indent on


" Trailing Whitespace Highlighting of the Gods
"""""""""""""""""""""""""""""""""""""""""""""""
highlight ExtraWhitespace ctermbg=red
au Bufenter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/


" Filetype specific changes
"""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType make,go,java,c,cpp setlocal noexpandtab
autocmd FileType python setlocal expandtab
autocmd FileType html,xhtml,htm,rhtml,php,xml setlocal sw=2 ts=2 sts=2

