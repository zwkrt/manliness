""""""""""""""""""""""""""""""""""""""""""""""""
" TAKE ME TO YOUR <leader>!
""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

"""""""""""""""""""""""""""""""""""""""""""""""
" Boring normal stuff
"""""""""""""""""""""""""""""""""""""""""""""""
set incsearch
set ffs=unix
set expandtab
set shiftwidth=4
set tabstop=4
set ai
set wrap
set showmatch
set wildmenu
set lazyredraw

"Set how vim deals with buffers and changes to them
set hidden
set autoread

"Always know exactly where you are!
set number
set ruler

imap <C-w> <ESC><C-w>

syntax enable
colorscheme default

highlight ExtraWhitespace ctermbg=red
au ColorScheme * hightlight ExtraWhitespace guibg=red
au Bufenter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction
