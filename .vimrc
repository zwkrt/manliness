set incsearch
set ffs=unix
set expandtab
set shiftwidth=4
set tabstop=4
set ai
set si
set wrap
set number

imap <C-w> <ESC><C-w>

syntax enable
colorscheme default

highlight ExtraWhitespace ctermbg=red
au ColorScheme * hightlight ExtraWhitespace guibg=red
au Bufenter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/

highlight OverLength ctermbg=red ctermfg=white
au ColorScheme * hightlight OverLength guibg=red
match OverLength /\%81v.\+/
