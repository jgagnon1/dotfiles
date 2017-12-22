set nocompatible               " be iMproved

" Plugins
call plug#begin('~/.vim/plugged')

  " Gruvbox Theme
  Plug 'morhetz/gruvbox'

  " Scala
  Plug 'derekwyatt/vim-scala'

  " Ctrl + P
  let g:ctrlp_working_path_mode=0
  let g:ctrlp_persistent_input=0
  set wildignore+=*/.git*,*/.hg/*,*/.svn/*,*/_*,*/.DS*,*/.*swp,*/*.d,*/*.o,*/*.class,*/target/*
  Plug 'kien/ctrlp.vim'

  " Syntastic
  "    -> Multiple languages syntax checker (php, c++, scala, etc.)
  "
  Plug 'scrooloose/syntastic'
  let g:syntastic_cpp_compiler_options = '-std=c++0x'
  let g:syntastic_cpp_check_header = 1

  " Buffer explorer
  let g:miniBufExplorerMoreThanOne = 1
  let g:miniBufExplModSelTarget = 1
  let g:miniBufExplMapWindowNavVim = 1
  let g:miniBufExplUseSingleClick = 1
  Plug 'fholgado/minibufexpl.vim'

  " Tabular
  Plug 'godlygeek/tabular'

  " Markdown
  Plug 'gabrielelana/vim-markdown'

call plug#end()

" General settings
syntax enable
filetype plugin indent on
let mapleader = ","
let g:mapleader = ","
imap jj <ESC>
set modelines=0
set history=1000
set nobackup
set nowritebackup
set noswapfile
set autoread
set undofile
set termguicolors

" UI

set title
set encoding=utf-8
set scrolloff=3
set autoindent
set smartindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
"set lazyredraw
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set previewheight=20

set t_Co=256
set background=dark
colorscheme gruvbox
highlight clear SignColumn
highlight CursorLine term=NONE cterm=NONE ctermbg=236

" Text Formatting
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set shiftround

set nowrap
set textwidth=119
set formatoptions=n

if exists("+colorcolumn")
  set colorcolumn=80
  highlight ColorColumn ctermbg=236
endif

" display tabs and trailing spaces
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅"

