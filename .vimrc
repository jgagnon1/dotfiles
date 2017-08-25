set nocompatible        " be iMproved

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Misc settings
""

	syntax on
	filetype plugin on

	set background=dark     " Assume a dark background
	set backspace=2
	set ruler               " show the ruler
	set showmatch           " show matching brackets/parenthesis
	set incsearch           " find as you type search
	set hlsearch            " highlight search terms
	set nu                  " Line numbers on
	set smartcase           " case sensitive when uc present
	set ignorecase          " case insensitive search
	set hidden              " Buffer switching without saving

	set autoread            " Auto reread modified file
	set autoindent          " indent at the same level of the previous line
	set mouse=a             " automatically enable mouse usage
	set ttymouse=xterm2	    " make vim works in tmux

	if !has('gui')
		set term=$TERM      " Make arrow and other keys work
	endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Buffer shortcuts
""

	map <D-1> :br!<CR> 
	map <Leader>1 :br!<CR> 
	map <D-2> :br!<CR>:bn!<CR> 
	map <Leader>2 :br!<CR>:bn!<CR> 
	map <D-3> :br!<CR>:bn! 2<CR>
	map <Leader>3 :br!<CR>:bn! 2<CR>
	map <D-4> :br!<CR>:bn! 3<CR>
	map <Leader>4 :br!<CR>:bn! 3<CR>
	map <D-5> :br!<CR>:bn! 4<CR>
	map <Leader>5 :br!<CR>:bn! 4<CR>
	map <D-6> :br!<CR>:bn! 5<CR>
	map <Leader>6 :br!<CR>:bn! 5<CR>
	map <D-7> :br!<CR>:bn! 6<CR>
	map <Leader>7 :br!<CR>:bn! 6<CR>
	map <D-8> :br!<CR>:bn! 7<CR>
	map <Leader>8 :br!<CR>:bn! 7<CR>
	map <D-9> :br!<CR>:bn! 8<CR>
	map <Leader>9 :br!<CR>:bn! 8<CR>
	map <Leader>] :bn!<CR>
	map <Leader>[ :bp!<CR>
	map <D-s> :w<CR>
	map <Leader>s :w<CR>
	map <D-q> :q<CR>
	map <Leader>q :q<CR>




""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Key mapping

" For when you forget to sudo.. Really Write the file.	
cmap w!! w !sudo tee % >/dev/null    
cmap wq wqa
cmap qw wqq

" Allow creating a file in current buffer's directory
fun! NewCfd( arg )
  execute 'e %:p:h/' . a:arg
endfunction
command! -nargs=* E call NewCfd( '<args>' )
command! -nargs=* New call NewCfd( '<args>' )


" Delete current file. You need to close it after
"
fun! DeleteCfd( arg )
  let l:curfile = expand("%")
  silent exe ":!rm ". l:curfile
  silent exe "bwipe! " . l:curfile
endfunction
command! -nargs=* Delete call DeleteCfd( '<args>' )

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Identation preferences
""

" Defaults to spaces
setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>

" Some files forced to spaces
autocmd FileType hpp setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>
autocmd FileType h setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>
autocmd FileType cpp setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>
autocmd FileType scala setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>
autocmd FileType lua setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>
autocmd FileType rb setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>


" Allow switching by doing <leader><tab>
nmap <leader><tab> :call SwitchTab()<CR>
function! SwitchTab()
  if (&l:expandtab)
    echo "Switched to Tabs"
    setlocal noexpandtab shiftwidth=4 tabstop=4 cino=N-s<CR>
  else
    echo "Switched to Spaces"
    setlocal expandtab shiftwidth=2 tabstop=2 cino=N-s<CR>
  endif
endfunction



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugins
  call plug#begin('~/.vim/plugged')

  " GruvBox plugin
  Plug 'morhetz/gruvbox'

  call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Local overrides

	if filereadable(expand("~/.vimrc.local"))
		source ~/.vimrc.local
	endif

