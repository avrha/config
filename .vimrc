"Displays
syntax on
color default
set t_Co=8
highlight clear SpellBad
highlight SpellBad ctermfg=white ctermbg=red
highlight Comment ctermfg=green
let g:netrw_banner=0

"Interfaces
set number
set ignorecase
set hlsearch
set smartcase
set wildmenu
set ruler
set belloff=all

"Indents and Tabs
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab

"Command Abbreviations 
command Gcc execute "!gcc -g -o0 -Wall % -o %:r.out && gdb -q %:r.out"
command Gpp execute "!g++ -g -o0 -Wall % -o %:r.out && gdb %:r.out"
command Py execute "!python3 %" 
command Run execute "./%" 
command Cls execute "!clear"

"Ctrl-Backspace Deletion
imap <C-BS> <C-W>
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>

"Unset Search Pattern with Return
nnoremap <CR> :noh<CR><CR>

