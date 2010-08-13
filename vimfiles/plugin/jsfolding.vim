" Plugin for automatic folding of JS functions (also folds related JSdoc)
"
" Maintainer: Ray Burgemeestre
" Last Change: 2010 Jan 15
"
" USAGE
"  If you enabled the script in your after/ftplugin directory (see install)
"  then it will be executed after you open a .js file.
"
"  After e.g. adding/moving functions, you can re-execute the script by using
"  the following key mappings:
"
"  F5 - To fold functions, classes, and other stuff with JSdoc (depending
"       on your configuration).
"  F6 - To do the same with more extensive bracket checking (might work
"       better if your folds are messed up due to misinterpreted brackets).
"  F7 - To remove all folds.
"
" INSTALL
"  1. Put jsfolding.vim in your plugin directory (~/.vim/plugin)
"  2. You might want to add the following keyboard mappings to your .vimrc:
"
"       map <F5> <Esc>:EnableFastJSFolds<Cr>
"       map <F6> <Esc>:EnableJSFolds<Cr>
"       map <F7> <Esc>:DisableJSFolds<Cr>
"
"  3. You can disable auto folding in your .vimrc with:
"
"       let g:DisableAutoJSFolding = 1
"
"    By default EnableFastJSFolds is called. Do these mess up your folds, 
"    you can try to replace EnableFastJSFolds by EnableJSFolds. You can
"    change this in function s:CheckAutocmdEnableJSFold. 
"
" NOTE
"  It may be that you need to load the plugin from your .vimrc manually, in
"  case it doesn't work:
"
"    let js_folding=0
"      (if you can't use the after directory in step 3)
"    source ~/path/to/jsfolding.vim
"      (if you're not using the default plugin directory)
"
"  MORE INFORMATION
"  - In JSCustomFolds() you can i.e. comment the JSFoldPureBlock('class', ...)
"    call to have the script not fold classes. You can also change the second
"    parameter passed to that function call, to have it or not have it fold
"    JsDoc comments. All other folding you can turn on/off in this function.
"  - You can tweak the foldtext to your liking in the function JSFoldText().
"  - You can set some preferences and default settings a few lines below
"    at the "Script configuration" part.
"
"  This script is tested with Vim version >= 6.3 on windows and linux.

" Avoid reloading {{{1
if exists('loaded_jsfolding')
    finish
endif

let loaded_jsfolding = 1
" }}}

" .vimrc variable to disable autofolding for js files {{{1
if !exists("g:DisableAutoJSFolding")
    let g:DisableAutoJSFolding = 0
endif
" }}}

command! EnableFastJSFolds call <SID>EnableFastJSFolds()
command! -nargs=* EnableJSFolds call <SID>EnableJSFolds(<f-args>)
command! DisableJSFolds call <SID>DisableJSFolds()

" {{{ Script configuration
" Display the following after the foldtext if a fold contains jsdoc
let g:jsDocIncludedPostfix = '**'
let g:jsDocBlockIncludedPostfix = '**#@+'

" Default values
" .. search this # of empty lines for JsDoc comments
let g:searchJsDocLineCount = 1
" .. search this # of empty lines that 'trail' the foldmatch
let g:searchEmptyLinesPostfixing = 1
" }}}
" {{{ Script constants
let s:synIDattr_exists = exists('*synIDattr')
let s:TRUE = 1
let s:FALSE = 0
let s:MODE_CREATE_FOLDS = 1
let s:MODE_REMEMBER_FOLD_SETTINGS = 2
let s:FOLD_WITH_JSDOC = 1
let s:FOLD_WITHOUT_JSDOC = 2
let s:SEARCH_PAIR_START_FIRST = 1
let s:SEARCH_PAIR_IMMEDIATELY = 2
" }}}

function! s:EnableFastJSFolds() " {{{
	call s:EnableJSFolds(s:FALSE)
endfunction
" }}}
function! s:EnableJSFolds(...) " {{{
	let s:extensiveBracketChecking = s:TRUE

	" Check function arguments
	if a:0 == 1
		let s:extensiveBracketChecking = a:1
	endif

	" Remember cursor information if possible
	let s:savedCursor = line(".")

	" Initialize variables
	set foldmethod=manual
	set foldtext=JSFoldText()
	let s:fileLineCount = line('$')

	let s:searchJsDocLineCount = g:searchJsDocLineCount
	let s:searchEmptyLinesPostfixing = g:searchEmptyLinesPostfixing


	" Move to end of file
	exec s:fileLineCount	
	
	" First pass: Look for Folds, remember opened folds
	let s:foldingMode = s:MODE_REMEMBER_FOLD_SETTINGS
	call s:JSCustomFolds()

	" Second pass: Recreate Folds, restore previously opened
	let s:foldingMode = s:MODE_CREATE_FOLDS
	" .. Remove all folds first
	normal zE
	let s:foldsCreated = 0
	call s:JSCustomFolds()
	" .. Fold all
	normal zM

    :redraw
	echo s:foldsCreated . " fold(s) created"

	" Restore cursor
	exec s:savedCursor
	
endfunction
" }}}
function! s:DisableJSFolds() " {{{
	"set foldmethod=manual
	set foldtext=
	normal zE
	echo "js fold(s) deleted"
endfunction
" }}}
function! s:JSCustomFolds() " {{{
	" NOTE: The two last parameters for functions JSFoldProperties() and
	"       JSFoldPureBlock() overwrite: 'g:searchJsDocLineCount' and
	"       'g:searchEmptyLinesPostfixing'..

	" Fold function with JsDoc (function foo() {})
	call s:JSFoldPureBlock('function', s:FOLD_WITH_JSDOC)

	" Fold marker style comments ({{{ foo }}})
	call s:JSFoldMarkers('{{{', '}}}')

	" Fold JsDoc "DocBlock" templates (#@+ foo #@-)
	call s:JSFoldMarkers('#@+', '#@-')
endfunction
" }}}
function! s:JSFoldPureBlock(startPattern, ...) " {{{
	let s:searchJsDocLineCount = g:searchJsDocLineCount
	let s:searchEmptyLinesPostfixing = g:searchEmptyLinesPostfixing
	let s:currentJsDocMode = s:FOLD_WITH_JSDOC

	if a:0 >= 1
		" Do we also put the JS doc part in the fold?
		let s:currentJsDocMode = a:1
	endif
	if a:0 >= 2
		" How far do we want to look for JsDoc comments?
		let s:searchJsDocLineCount = a:2
	endif
	if a:0 == 3
		" How greedy are we on postfixing empty lines?
		let s:searchEmptyLinesPostfixing = a:3
	endif

	" Move to file end
	exec s:fileLineCount

	" Loop through file, searching for folds
	while 1
		let s:lineStart = s:FindPureBlockStart(a:startPattern)

		if s:lineStart != 0

			let s:lineStart = s:FindOptionalJSDocComment()
			let s:lineStop = s:FindPureBlockEnd('{', '}', s:SEARCH_PAIR_START_FIRST)

			" Stop on Error
			if s:lineStop == 0
				break
			endif

			" Do something with the potential fold based on the Mode we're in
			call s:HandleFold()

		else
			break
		endif

		" Goto fold start (remember we're searching upwards)
		exec s:lineStart
	endwhile


	if s:foldingMode != s:MODE_REMEMBER_FOLD_SETTINGS
    	" Remove created folds
	    normal zR
    endif
endfunction
" }}}
function! s:JSFoldMarkers(startPattern, endPattern, ...) " {{{
	let s:currentJsDocMode = s:FOLD_WITHOUT_JSDOC

	" Move to file end
	exec s:fileLineCount

	" Loop through file, searching for folds
	while 1
		let s:lineStart = s:FindPatternStart(a:startPattern)

		if s:lineStart != 0
			let s:lineStart = s:FindOptionalJSDocComment()
			" The fourth parameter is for disabling the search for trailing
			" empty lines..
			let s:lineStop = s:FindPureBlockEnd(a:startPattern, a:endPattern,
				\ s:SEARCH_PAIR_IMMEDIATELY, s:FALSE)

			" Stop on Error
			if s:lineStop == 0
				break
			endif

			" Do something with the potential fold based on the Mode we're in
			call s:HandleFold()
		else
			break
		endif

		" Goto fold start (remember we're searching upwards)
		exec s:lineStart
	endwhile

	if s:foldingMode != s:MODE_REMEMBER_FOLD_SETTINGS
    	" Remove created folds
	    normal zR
    endif
endfunction
" }}}
function! s:JSFoldProperties(startPattern, endPattern, ...) " {{{
	let s:searchJsDocLineCount = g:searchJsDocLineCount
	let s:searchEmptyLinesPostfixing = g:searchEmptyLinesPostfixing
	let s:currentJsDocMode = s:FOLD_WITH_JSDOC
	if a:0 >= 1
		" Do we also put the JS doc part in the fold?
		let s:currentJsDocMode = a:1
	endif
	if a:0 >= 2
		" How far do we want to look for JsDoc comments?
		let s:searchJsDocLineCount = a:2
	endif
	if a:0 == 3
		" How greedy are we on postfixing empty lines?
		let s:searchEmptyLinesPostfixing = a:3
	endif

	" Move to end of file
	exec s:fileLineCount

	" Loop through file, searching for folds
	while 1
		let s:lineStart = s:FindPatternStart(a:startPattern)

		if s:lineStart != 0
			let s:lineStart = s:FindOptionalJSDocComment()
			let s:lineStop = s:FindPatternEnd(a:endPattern)

			" Stop on Error
			if s:lineStop == 0
				break
			endif

			" Do something with the potential fold based on the Mode we're in
			call s:HandleFold()
		else
			break
		endif

		" Goto fold start (remember we're searching upwards)
		exec s:lineStart
		
	endwhile

	if s:foldingMode != s:MODE_REMEMBER_FOLD_SETTINGS
    	" Remove created folds
	    normal zR
    endif
endfunction
" }}}
function! s:HandleFold() " {{{
	if s:foldingMode == s:MODE_CREATE_FOLDS
		" Correct lineStop if needed (the script might have mistaken lines
		"   beyond the file's scope for trailing empty lines)
		if s:lineStop > s:fileLineCount
			let s:lineStop = s:fileLineCount
		endif
		" Create the actual fold!
		exec s:lineStart . "," . s:lineStop . "fold"
		let s:foldsCreated = s:foldsCreated + 1
	endif
endfunction
" }}}
function! s:FindPureBlockStart(startPattern) " {{{
	" When the startPattern is 'function', this following search will match:
	"
	" function foo($bar) {			function foo($bar)
	" {
	"
	" function foo($bar)			function foo($bar1,
	" .. {								$bar2)
	"								{
	"
	"return search(a:startPattern . '.*\%[\n].*{', 'W')
	"return search(a:startPattern . '.*\%[\n].*\%[\n].*{', 'bW')

	" This function can match the line its on *again* if the cursor was
	" restored.. hence we search twice if needed..
	let currentLine = line('.')
	let line = search(a:startPattern . '.*\%[\n].*\%[\n].*{', 'bW')
	if currentLine == line
		let line = search(a:startPattern . '.*\%[\n].*\%[\n].*{', 'bW')
	endif
	return line
endfunction
" }}}
function! s:FindPatternStart(startPattern) " {{{
	" This function can match the line its on *again* if the cursor was
	" restored.. hence we search twice if needed..
	let currentLine = line('.')
	let line = search(a:startPattern, 'bW')
	if currentLine == line
		let line = search(a:startPattern, 'bW')
	endif
	return line
endfunction
" }}}
function! s:FindOptionalJSDocComment() " {{{
	" Is searching for JSDoc disabled?
	if s:currentJsDocMode == s:FOLD_WITHOUT_JSDOC
		" .. Return the original Fold's start
		return s:lineStart
	endif

	" Skipover 'empty' lines in search for JsDoc
	let s:counter = 0
	let s:currentLine = s:lineStart - 1
	while s:counter < s:searchJsDocLineCount
		let line = getline(s:currentLine)
		if (matchstr(line, '^\s*$') == line)
			let s:currentLine = s:currentLine - 1
		endif
		let s:counter = s:counter + 1
	endwhile

	" Is there a closing C style */ on the above line?
	let checkLine = s:currentLine
	if strridx(getline(checkLine), "\*\/") != -1
		" Then search for the matching C style /* opener
		while 1
			if strridx(getline(checkLine), "\/\*") != -1
				" Only continue adjusting the Fold's start if it really is JSdoc..
				"  (which is characterized by a double asterisk, like /**)
				if strridx(getline(checkLine), "\/\*\*") != -1
					" Also only continue adjusting if the JSdoc opener does
					" not contain a '/**#@+'. Those type of comments are
					" supposed to match with a #@- ..
					if strridx(getline(checkLine), '#@+') == -1
						" .. Return this as the Fold's start
						return checkLine
					else
						break
					endif
				else
					break
				endif
			endif
			let checkLine = checkLine - 1
		endwhile
	endif
	" .. Return the original Fold's start
	return s:lineStart
endfunction
" }}}
function! s:FindPureBlockEnd(startPair, endPair, searchStartPairFirst, ...) " {{{
	" Place Cursor on the opening pair/brace?
	if a:searchStartPairFirst == s:SEARCH_PAIR_START_FIRST
		let line = search(a:startPair, 'W')
	endif

	" Search for the entangled closing brace
	" call cursor(line, 1) " set the cursor to the start of the lnum line
	if s:extensiveBracketChecking == s:TRUE
		let line = searchpair(a:startPair, a:startPair, a:endPair, 'W', 'SkipMatch()')
	else
		let line = searchpair(a:startPair, a:startPair, a:endPair, 'W')
	endif
	if line == 0
		let line = search(a:endPair, 'W')
	endif
	if line == 0
		" Return error
		return 0
	endif

	" If the fold exceeds more than one line, and searching for empty lines is
	" not disabled..
	let foldExceedsOneLine = line - s:lineStart >= 1
	if a:0 == 1
		let emptyLinesNotDisabled = a:1
	else
		let emptyLinesNotDisabled = s:TRUE
	endif
	if foldExceedsOneLine && emptyLinesNotDisabled
		" Then be greedy with extra 'trailing' empty line(s)
		let s:counter = 0
		while s:counter < s:searchEmptyLinesPostfixing
			let linestr = getline(line + 1)		
			if (matchstr(linestr, '^\s*$') == linestr)
				let line = line + 1
			endif
			let s:counter = s:counter + 1
		endwhile
	endif

	return line
endfunction
" }}}
function! s:FindPatternEnd(endPattern) " {{{
	let line = search(a:endPattern, 'W')

	" If the fold exceeds more than one line
	if line - s:lineStart >= 1
		" Then be greedy with extra 'trailing' empty line(s)
		let s:counter = 0
		while s:counter < s:searchEmptyLinesPostfixing
			let linestr = getline(line + 1)		
			if (matchstr(linestr, '^\s*$') == linestr)
				let line = line + 1
			endif
			let s:counter = s:counter + 1
		endwhile
	endif

	return line
endfunction
" }}}

function! JSFoldText() " {{{
	let currentLine = v:foldstart
	let lines = (v:foldend - v:foldstart + 1)
	let lineString = getline(currentLine)
	" See if we folded a marker
	if strridx(lineString, "{{{") != -1 " }}}
		" Is there text after the fold opener?
		if (matchstr(lineString, '^.*{{{..*$') == lineString) " }}}
			" Then only show that text
			let lineString = substitute(lineString, '^.*{{{', '', 'g') " }}}
		" There is text before the fold opener
		else
			" Try to strip away the remainder
			let lineString = substitute(lineString, '\s*{{{.*$', '', 'g') " }}}
		endif
	" See if we folded a DocBlock
	elseif strridx(lineString, '#@+') != -1
		" Is there text after the #@+ piece?
		if (matchstr(lineString, '^.*#@+..*$') == lineString)
			" Then show that text
			let lineString = substitute(lineString, '^.*#@+', '', 'g') . ' ' . g:jsDocBlockIncludedPostfix
		" There is nothing?
		else
			" Use the next line..
			let lineString = getline(currentLine + 1) . ' ' . g:jsDocBlockIncludedPostfix
		endif
	" See if we folded an API comment block
	elseif strridx(lineString, "\/\*\*") != -1
		" (I can't get search() or searchpair() to work.., therefore the
		" following loop)
		let s:state = 0
		while currentLine < v:foldend
			let line = getline(currentLine)
			if s:state == 0 && strridx(line, "\*\/") != -1
				" Found the end, now we need to find the first not-empty line
				let s:state = 1
			elseif s:state == 1 && (matchstr(line, '^\s*$') != line)
				" Found the line to display in fold!
				break
			endif
			let currentLine = currentLine + 1
		endwhile
		let lineString = getline(currentLine)
	endif
	
	" Some common replaces...
	" if currentLine != v:foldend
		let lineString = substitute(lineString, '/\*\|\*/\d\=', '', 'g')
		let lineString = substitute(lineString, '^\s*\*\?\s*', '', 'g')
		let lineString = substitute(lineString, '{$', '', 'g')
		let lineString = substitute(lineString, '($', '(..);', 'g')
	" endif

	" Emulates printf("%3d", lines)..
	if lines < 10
		let lines = "  " . lines
	elseif lines < 100
		let lines = " " . lines
	endif

	" Append an (a) if there is JsDoc in the fold (a for API)
	if currentLine != v:foldstart
		let lineString = lineString . " " . g:jsDocIncludedPostfix . " "
	endif	

	" Return the foldtext
	return "+--".lines." lines: " . lineString
endfunction
" }}}
function! SkipMatch() " {{{
" This function is modified from a JS indent file by John Wellesz
" found here: http://www.vim.org/scripts/script.js?script_id=1120
	if (!s:synIDattr_exists)
		return 0
	endif
	let synname = synIDattr(synID(line("."), col("."), 0), "name")
	if synname == "jsParent" || synname == "javaScriptBraces" || synname == "jsComment"
		return 0
	else
		return 1
	endif
endfun
" }}}

" Check filetype == js before automatically creating (fast) folds {{{1
function! s:CheckAutocmdEnableJSFold()
    if &filetype == "javascript" && ! g:DisableAutoJSFolding
        call s:EnableFastJSFolds()
    endif
endfunction
" }}}

" Call CheckAutocmdEnableJSFold on BufReadPost {{{1
augroup SetJsFolds
    au!
    au BufReadPost * call s:CheckAutocmdEnableJSFold()
augroup END
" }}}

" vim:ft=vim:foldmethod=marker:nowrap:tabstop=4:shiftwidth=4
