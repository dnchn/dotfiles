set nocompatible
call pathogen#infect()
filetype plugin indent on
syntax on
" Enable error files & error jumping.
set cf
" Yanks go on clipboard instead. (Windows)
set clipboard+=unnamed
set history=256
set autowrite
set ruler
set nu
set nowrap
" Time to wait after ESC (default causes an annoying delay)
set timeoutlen=250

" Backspace over everything in insert mode
set bs=2
" Formatting (some of these are for coding in C)
set ts=2
" Tabs under smart indent
set shiftwidth=2
set sts=2
set nocp incsearch
set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab

" Visual
" Show matching brackets.
set showmatch
" Bracket blinking.
set mat=5
set list
" Show $ at end of line and trailing space as ~
set lcs=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<
" No blinking .
set novisualbell
" No noise.
set noerrorbells
" Always show status line.
set laststatus=2
set background=dark

" Backups & Files
" Enable creation of backup file.
set backup
" Where backups will go.
set backupdir=~/.vim/backups
" Where temporary files will go.
set directory=~/.vim/tmp

" GVIM / MacVim
set guioptions-=L
set guioptions-=T
set guioptions-=r
set guioptions-=m
