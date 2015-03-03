set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-speeddating'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'Raimondi/delimitMate'

Plugin 'nathanaelkane/vim-indent-guides'

" Syntax
Plugin 'sheerun/vim-polyglot'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'hynek/vim-python-pep8-indent'

" color schemes
Plugin 'Lokaltog/vim-distinguished'
call vundle#end()

if has("autocmd")
  filetype plugin indent on
endif


" General Settings
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
set incsearch
set hlsearch
set ignorecase

set nowrap
" Allows backspacing over autoindent, line breaks, and start of insert
set backspace=indent,eol,start
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

set mouse=a

" Shows the file browser
let g:netrw_liststyle = 3
let g:netrw_winsize   = 15
let g:netrw_banner = 0
nmap <leader>d :Lex<CR> " This will toggle the file explorer on/off

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
     set nornu
  endif
endfunction
nnoremap <silent><C-L> :call g:ToggleNuMode()<cr>

set t_Co=256
set background=dark
:silent! colorscheme distinguished

" ------ nathanaelkane/vim-indent-guides ------
hi IndentGuidesOdd ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey
" ----- scrooloose/syntastic -----
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = "▲"
augroup mySyntastic
 au!
 au FileType tex let b:syntastic_mode = "passive"
augroup END
" ----- xolox/vim-easytags settings -----
" Where to look for tags files
set tags=./tags;,~/.vimtags
" Sensible defaults
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1
" ----- majutsushi/tagbar settings -----
" Open/close tagbar with \b
nmap <silent> <leader>b :TagbarToggle<CR>
" Uncomment to open tagbar automatically whenever possible
"autocmd BufEnter * nested :call tagbar#autoopen(0)
" ----- airblade/vim-gitgutter -----
hi clear SignColumn
" Only display "hunks" if diff is non-zero
let g:airline#extensions#hunks#non_zero_only = 1
" ----- Raimondi/delimitMate -----
  let delimitMate_expand_cr = 1
augroup mydelimitMate
  au!
  au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
  au FileType tex let b:delimitMate_quotes = ""
  au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
  au FileType python let b:delimitMate_nesting_quotes = ['"', "'"]
augroup END
