set nocompatible               " be iMproved

" Plugins
call plug#begin('~/.vim/plugged')

  " Gruvbox Theme
  Plug 'morhetz/gruvbox'

  " Scala
  Plug 'derekwyatt/vim-scala'

  " Typescript
  Plug 'leafgarland/typescript-vim'

  " Jsonnet
  Plug 'google/vim-jsonnet'

  " Ctrl + P
  Plug 'ctrlpvim/ctrlp.vim'
  " {{{
  let g:ctrlp_working_path_mode=0
  let g:ctrlp_persistent_input=0
  set wildignore+=*/.git*,*/.hg/*,*/.svn/*,*/_*,*/.DS*,*/.*swp,*/*.d,*/*.o,*/*.class,*/target/*
  " }}}
  "
  " Syntastic
  "    -> Multiple languages syntax checker (php, c++, scala, etc.)
  "
  Plug 'scrooloose/syntastic'
  " {{{
  let g:syntastic_cpp_compiler_options = '-std=c++0x'
  let g:syntastic_cpp_check_header = 1
  " }}}

  " Buffer explorer
  Plug 'fholgado/minibufexpl.vim'
  " {{{
  let g:miniBufExplorerMoreThanOne = 1
  let g:miniBufExplModSelTarget = 1
  let g:miniBufExplMapWindowNavVim = 1
  let g:miniBufExplUseSingleClick = 1
  " }}}
  "
  " Tabular
  Plug 'godlygeek/tabular'

  " Markdown
  Plug 'gabrielelana/vim-markdown'

  " If installed using Homebrew
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  " {{{
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting
  " }}}

  " Ale syntax
  Plug 'dense-analysis/ale'

  nnoremap <silent> <leader><space> :Files<CR>
  nnoremap <silent> <leader>a :Buffers<CR>
  nnoremap <silent> <leader>A :Windows<CR>
  nnoremap <silent> <leader>; :BLines<CR>
  nnoremap <silent> <leader>o :BTags<CR>
  nnoremap <silent> <leader>O :Tags<CR>
  nnoremap <silent> <leader>? :History<CR>
  nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
  nnoremap <silent> <leader>. :AgIn 

  nnoremap <silent> K :call SearchWordWithAg()<CR>
  vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
  nnoremap <silent> <leader>gl :Commits<CR>
  nnoremap <silent> <leader>ga :BCommits<CR>
  nnoremap <silent> <leader>ft :Filetypes<CR>

  imap <C-x><C-f> <plug>(fzf-complete-file-ag)
  imap <C-x><C-l> <plug>(fzf-complete-line)

  function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
  endfunction

  function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
  endfunction

  function! SearchWithAgInDirectory(...)
    call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
  endfunction
  command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
  " }}}

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
set previewheight=20
set relativenumber
set number

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

" Next/prev buffer
map <leader>[ :bn<cr>
map <leader>] :bp<cr>

