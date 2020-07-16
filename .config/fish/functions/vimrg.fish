function vimrg --argument pattern
	vim -c 'execute "normal /'$pattern'\n"' (rg -l $pattern)
end
