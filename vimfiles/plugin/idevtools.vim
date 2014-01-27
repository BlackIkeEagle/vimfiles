command! -n=0 -bar RemoveEolWhitespaces :call RemoveEolWhitespaces()
command! -n=0 -bar ReplaceDosEol :call ReplaceDosEol()
command! -n=0 -bar ReplaceMacEol :call ReplaceMacEol()
command! -n=0 -bar CSVtoSQL :call CSVtoSQL()
command! -n=0 -bar CodeTidy :call CodeTidy()
command! -n=? -bar -complete=custom,WorkspaceList Workspace :call Workspace('<args>')

function! RemoveEolWhitespaces()
	let l:save_position = getpos(".")
	%s/\s\+$//ge
	call setpos('.', l:save_position)
	echohl WarningMsg | echo "Removed eol Whitespaces" | echohl None
endfunction

function! ReplaceDosEol()
	let l:save_position = getpos(".")
	%s/\r\n/\r/ge " note \r on the right side results in \n :p
	call setpos('.', l:save_position)
	echohl WarningMsg | echo "Replaced DOS eol's" | echohl None
endfunction

function! ReplaceMacEol()
	let l:save_position = getpos(".")
	%s/\r/\r/ge " note \r on the right side results in \n :p
	call setpos('.', l:save_position)
	echohl WarningMsg | echo "Replaced MAC eol's" | echohl None
endfunction

function CSVtoSQL()
	if &filetype == "csv"
		%s/$//ge
		%s/""/''/ge
		%s/"//ge
		%s/\s\+$//ge
		%s/''/"/ge
		%s/'/\\'/ge
		%s/;/' , '/ge
		%s/^/( '/ge
		%s/$/' ) ,/ge
		echohl WarningMsg | echo "Converted to SQL" | echohl None
	else
		echohl ErrorMsg | echo "Not a CSV file" | echohl None
	endif
endfunction

function CodeTidy()
	" dont run tidy on changed files
	if &modified
		echom "Buffer was modified, please save before calling :CodeTidy"
		return
	endif
	if &filetype == 'php'
		" do phptidy on current buffer
		silent exec '!phptidy replace %'
	elseif &filetype == 'javascript'
		" do fixjsstyle on current buffer
		silent exec '!fixjsstyle %'
	else
		echom "CodeTidy cant be run on this file"
		return
	endif
	" reload file
	edit
endfunction

function! Workspace(project)
	exe 'cd ' . g:Workspace . a:project
	let tagfile = expand("$HOME/.vim.tags/" . a:project)
	if filereadable(tagfile)
		exe 'set tags+=' . tagfile
	endif
	if filereadable('./.vimrc')
		exe 'source ./.vimrc'
	endif
	NERDTree
endfunction

function! WorkspaceList(A,L,P)
	if has("win32")
		return
	endif

	let s:alreadyinfolder = ''
	if a:A =~ '/'
		let s:alreadyinfolder = strpart(a:A, 0, strridx(a:A, '/'))
	endif

	if s:alreadyinfolder == ''
		return system("cd ".g:Workspace." > \/dev\/null; find . -mindepth 1 -maxdepth 1 -type d | sed -e 's\/^\.\\\/\/\/' | sort")
	else
		return system("cd ".g:Workspace." > \/dev\/null; find ".s:alreadyinfolder." -mindepth 1 -maxdepth 1 -type d | sed -e 's\/^\.\\\/\/\/' | sort")
	endif
endfunction

