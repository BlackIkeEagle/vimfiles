command! -n=? -complete=dir -bar RemoveEolWhitespaces :call RemoveEolWhitespaces()
command! -n=? -complete=dir -bar RemoveDosEol :call RemoveDosEol()
command! -n=? -complete=dir -bar CSVtoSQL :call CSVtoSQL()
command! -n=? -complete=dir -bar CodeTidy :call CodeTidy()

function! RemoveEolWhitespaces()
	%s/\s\+$//ge
	echohl WarningMsg | echo "Removed eol Whitespaces" | echohl None
endfunction

function! RemoveDosEol()
	%s/$//ge
	echohl WarningMsg | echo "Removed DOS eol's" | echohl None
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
