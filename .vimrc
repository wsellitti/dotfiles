" Spacing
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set textwidth=79

" UI
set relativenumber
set number
set background=dark
set list
set lcs+=space:·

" Syntax
syntax enable
filetype on
filetype plugin on

" Keyboard shortcuts
let mapleader = "\\"

" JEDI Settings
let g:jedi#popup_select_first = 0  
let g:jedi#goto_command = "<leader>g"  
let g:jedi#goto_definitions_command = "<leader>d"  
let g:jedi#rename_command = "<leader>r"  
let g:jedi#usages_command = "<leader>n"  
let g:jedi#completions_command = "<C-Space>"

