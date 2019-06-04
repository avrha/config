"Colors & Syntax
set termguicolors
syntax on
color torte 

"Gvim
set guioptions -=m
set guioptions -=T
set guioptions -=r

"Display
set number
set hlsearch
set spell
set nowrap
set ruler
set wildmenu
set laststatus=2

"Tab & Indent
set tabstop=2
set shiftwidth=2
set expandtab
set ai
set si

"Fuzzy Finder
set autochdir
set complete-=i
set path=C:\Users\username\Documents\** 
  
"Abbreviations
ab cmd rightb vert term
ab cpp !g++ -std=c++11 % -Wall -o %.exe ; if($?) {./%.exe}

"Keyboard
set bs=2

"Shell
set shell=powershell
set shellcmdflag=-command
