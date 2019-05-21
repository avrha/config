 "Vim Compatibility 
 set nocompatible
 filetype plugin on
 
 "Color & Syntax
 syntax on
 color mojave
 
 "Tab & Indent
 set tabstop=2
 set shiftwidth=2
 set expandtab
 set ai
 set si
 
 "Display 
 set number
 set hlsearch
 set spell
 set nowrap
 set ruler
 set wildmenu
 
 "Fuzzy Finder
 set autochdir
 set path=/home/username/**
 
 "Abbreviations
 ab cmd rightb vert term
 ab cpp !g++ -std=c++11 % -Wall -o %.out && ./%.out
