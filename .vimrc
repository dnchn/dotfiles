set nocompatible

syntax on
set history=256

set confirm
set autowrite
set autoread

" Always show status line.
set laststatus=2
" Show the current mode, command, and cursor position
set showmode showcmd ruler
" Show line numbers
set number

"Search options
" Incremental search
set incsearch
" Colored search
set hlsearch
set ignorecase

set nowrap
" Allows backspacing over autoindent, line breaks, and start of insert
set bs=indent,eol,start
" Time to wait after ESC (default causes an annoying delay)
set timeoutlen=250
set showmatch
" Show every tab as ^I (shouldn't be any because of expandtab)
" and shows $ at end of line and trailing space as ~
set list
set listchars=tab:\ \ ,eol:$,trail:~,extends:>,precedes:<

" No blinking .
set novisualbell
" No noise.
set noerrorbells

set textwidth=78
set autoindent
set smarttab
setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

if has('gui_running')
  " GVIM / MacVim no toolbars
  set guioptions=cMg
  "set guioptions-=LTrm
end

" Make buffer switching easy
map <C-j> :bprev<CR>
map <C-k> :bnext<CR>

" use Ctrl+L to toggle the line number counting method
function! g:ToggleNuMode()
  if &nu == 1
     set rnu
  else
     set nu
  endif
endfunction
nnoremap <silent><C-L> :call g:ToggleNuMode()<cr>

filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
Bundle 'gmarik/vundle'
Bundle 'elzr/vim-json'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-speeddating'
Bundle 'wincent/Command-T'

filetype plugin indent on

