set nocompatible
filetype off

 set rtp+=~/.vim/bundle/Vundle.vim/
 call vundle#begin()

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-surround'
"   Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}

" vim-scripts repos
"   Bundle 'L9'
"   Bundle 'FuzzyFinder'

" non github repos
"   Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required!

"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

"
" TAKE ME TO YOUR <leader>!
""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:mapleader = ","

nmap <leader>w :w!<cr>
nmap <leader>g gqip 
nmap <leader>= ma gg=G'a
nmap <leader>wq :wqall<cr>
nmap <leader>d :ene<CR>:bd #<CR>


" Movement
"""""""""""""""""""""""""""""""""""""""""""""""
imap <C-w> <ESC><C-w>

map j gj
map k gk

" Visible items/ 
"""""""""""""""""""""""""""""""""""""""""""""""
set number ruler
set wrap
set lazyredraw
set bg=dark

" Windowing
"""""""""""""""""""""""""""""""""""""""""""""""
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

set rtp+=/usr/local/Cellar/go/1.0.3/misc/vim
filetype indent on
filetype plugin indent on
syntax on


" Trailing Whitespace Highlighting of the Gods
"""""""""""""""""""""""""""""""""""""""""""""""
if has("gui_running")
else
	highlight ExtraWhitespace ctermbg=red
	au Bufenter * match ExtraWhitespace /\s\+$/ "matches all trailing whitespace
	au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/ "not on line with cursor
	au InsertLeave * match ExtraWhitespace /\s\+$/
endif

nmap ss :call ShowTrailing(1)<CR><CR>

" Filetype specific changes
"""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType make,go,java setlocal noexpandtab
autocmd FileType python,markdown setlocal expandtab
autocmd FileType html,xhtml,htm,rhtml,php,xml setlocal sw=2 ts=2 sts=2
let g:tex_flavor='latex'
let g:Tex_ViewRule_ps = 'open -a Preview'
let g:Tex_ViewRule_pdf = 'open -a Preview'
autocmd BufNew,BufNewFile,BufRead *.md :set ft=markdown
