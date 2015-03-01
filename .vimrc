set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'wincent/Command-T'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-speeddating'
Plugin 'scrooloose/syntastic'

Plugin 'Glench/Vim-Jinja2-Syntax'
Plugin 'Keithbsmiley/swift.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'elzr/vim-json'
Plugin 'hynek/vim-python-pep8-indent'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'mxw/vim-jsx'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'othree/html5.vim'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/JavaScript-Indent'

" color schemes
Plugin 'Lokaltog/vim-distinguished'
call vundle#end()

if has("autocmd")
  filetype plugin indent on
endif

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

set textwidth=80

set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2

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

set t_Co=256
set background=dark
:silent! colorscheme distinguished

hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

let g:jsx_pragma_required = 1
