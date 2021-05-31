if exists('g:loaded_search') || &compatible
	finish
endif

let g:loaded_search = 1


""""
"" local functions
""""
" \brief	execute the shell 'search' command with the given
" 			arguments and open all files in new tabs that are
" 			not already in a buffer
"
" \param	args	'search' arguments as a single string, same
" 					syntax as in the shell, cf. search -h
function s:search(args)
	" get list of files
	let files = split(system("search -l " . a:args))

	" open buffers after the last tab
	for file in files
		if bufloaded(file) == 0
			exec "$tabnew " . file	
		endif
	endfor
endfunction

""""
"" commands
""""
command -nargs=+ Search call s:search(<q-args>)

call vimgdb#util#execabbrev("gf", "Search")
