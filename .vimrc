set nocompatible
call pathogen#infect()
filetype plugin indent on
syntax on

set confirm

set history=50
set autowrite

" Always show status line.
set laststatus=2
" Show the current mode, command, and cursor position
set showmode
set showcmd
set ruler

" Incremental search
set incsearch
" Colored search
set hlsearch

" Redefines Q to do formatting
map Q gq

" Line numbers
set number

set nowrap

" Time to wait after ESC (default causes an annoying delay)
set timeoutlen=250

" Allows backspacing over autoindent, line breaks, and start of insert
set bs=indent,eol,start

set cindent
" Default values for cinwords
set cinwords=if,else,while,do,for,switch,case
set cinoptions=:0,p0,t0

set autoindent
set smarttab

autocmd FileType c,h,java,rb setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
autocmd FileType * setlocal textwidth=78

set background=dark

" Show matching brackets for 50ms
set showmatch
set mat=5

" Show every tab as ^I (shouldn't be any because of expandtab)
" and shows $ at end of line and trailing space as ~
set list
set listchars=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<

" No blinking .
set novisualbell
" No noise.
set noerrorbells

" Backups & Files
" Enable creation of backup file.
set backup
" Where backups will go.
set backupdir=~/.vim/backups
" Where temporary files will go.
set directory=~/.vim/tmp

" GVIM / MacVim no toolbars
set guioptions-=L
set guioptions-=T
set guioptions-=r
set guioptions-=m
