command! -n=0 -bar RemoveEolWhitespaces :call RemoveEolWhitespaces()
command! -n=0 -bar ReplaceDosEol :call ReplaceDosEol()
command! -n=0 -bar ReplaceMacEol :call ReplaceMacEol()
command! -n=0 -bar GeneratePhpTags :call GeneratePhpTags()

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

function GeneratePhpTags()
    let mkPhpTags = globpath(&rtp, 'bin/mkPhpTags')
    silent exec '!' . mkPhpTags
endfunction

