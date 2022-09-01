"Displays
syntax on
color peachpuff
highlight clear SpellBad
highlight SpellBad ctermfg=white ctermbg=red
highlight Comment ctermfg=green
let g:netrw_banner=0

"Interfaces
set number
set hlsearch
set ignorecase
set smartcase
set wildmenu
set ruler
set nowrap
set belloff=all

"Indents and Tabs
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

"Command Abbreviations 
command Gcc execute "!gcc -g -o0 -Wall % -o %:r.o && gdb %:r.o"
command Py execute "!python3 %" 
command Cls execute "!clear"

"Ctrl-Backspace Deletion
imap <C-BS> <C-W>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

