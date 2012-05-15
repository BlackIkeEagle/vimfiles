"=============================================================================
" What Is This: Display marks at lines with compilation error.
" File: cuteErrorMarker.vim
" Author: Vincent Berthoux <twinside@gmail.com>
" Last Change: 2010 oct 12
" Version: 1.6
" Require:
"   set nocompatible
"     somewhere on your .vimrc
"
if exists("g:__CUTEERRORMARKER_VIM__")
    finish
endif
let g:__CUTEERRORMARKER_VIM__ = 1

"======================================================================
"           Configuration checking
"======================================================================
" Check that vim is not set in compatible mode
if &compatible
    echom 'Cute Error Marker require the nocompatible option, loading aborted'
    echom "To fix it add 'set nocompatible' in your .vimrc file"
    finish
endif

" Verify that signs are available with the vim version.
" If not avoid loading the extension
if !has("signs")
    echom 'Cute Error Marker require signs to be compiled within vim'
    echom 'Please compile vim with +signs . plugin not loaded.'
    finish
endif

if has("win32")
    let s:ext = '.ico'
elseif has("gui_mac")
    let s:ext = '.xpm'
else
    let s:ext = '.png'
endif

let s:path = globpath( &rtp, 'signs/err' . s:ext )
if s:path == ''
    echom "Cute Error Marker can't find icons, plugin not loaded" 
    finish
endif

if !exists('g:cuteErrorMarkerBrutalSignRemoval')
    let g:cuteErrorMarkerBrutalSignRemoval = 0
endif

"======================================================================
"           Plugin data
"======================================================================
let s:signId = 33000
let s:signCount = 0

fun! s:RefreshErrorHighlight() "{{{
    hi CuteErrorMarkerErrorColor term=bold ctermfg=white ctermbg=red guifg=white guibg=red
    hi CuteErrorMarkerWarningColor term=bold ctermfg=black ctermbg=yellow guifg=black guibg=yellow
    hi CuteErrorMarkerInfoColor term=bold ctermfg=White ctermbg=blue guifg=white guibg=blue
endfunction "}}}

" We call it here to be sure of it's existence.
call s:RefreshErrorHighlight()

exec 'sign define errhere texthl=CuteErrorMarkerErrorColor text=[X icon=' . escape( globpath( &rtp, 'signs/err' . s:ext ), ' \' )
exec 'sign define warnhere texthl=CuteErrorMarkerWarningColor  text=/! icon=' . escape( globpath( &rtp, 'signs/warn' . s:ext ), ' \' )
exec 'sign define infohere texthl=CuteErrorMarkerInfoColor text=(? icon=' . escape( globpath( &rtp, 'signs/info' . s:ext ), ' \' )

fun! PlaceErrorMarkersHook() "{{{
    augroup cuteerrors
        " au !
        au QuickFixCmdPre *make call CleanupMarkErrors()
        au QuickFixCmdPost *make call MarkErrors('err')
        au QuickFixCmdPre *grep* call CleanupMarkErrors()
        au QuickFixCmdPost *grep* call MarkErrors('search')
    augroup END
endfunction "}}}

fun! RemoveErrorMarkersHook() "{{{
    augroup cuteerrors
        au!
    augroup END
endfunction "}}}

fun! s:SelectClass( kind, error ) "{{{
	if a:kind == 'search'
		return 'infohere'
    endif

    if a:error =~ '\cwarning' || a:error =~ '\cattention'
        return 'warnhere'
    else
        return 'errhere'
    endif
endfunction "}}}

" List used to keep error text to display it on the good
" line. Assumed type :
" s:errBallons :: [ (BufNumber, LinNumber, text) ]
let s:errBalloons = []

fun! MarkErrors( kind ) "{{{
    call s:RefreshErrorHighlight()

    let errList = getqflist()
    let s:errBalloons = []

    for error in errList
        if error.valid
            let matchedBuf = error.bufnr

            if matchedBuf >= 0
                let s:signCount = s:signCount + 1
                let id = s:signId + s:signCount
                let errClass = s:SelectClass( a:kind, error.text )

                call add( s:errBalloons, [error.bufnr, error.lnum, error.text] )
                let toPlace = 'sign place ' . id
                            \ . ' line=' . error.lnum
                            \ . ' name=' . errClass
                            \ . ' buffer=' . matchedBuf
                exec toPlace
            endif
        endif
    endfor

    " If we have placed some markers
    if s:signCount > 0
        redraw!
    endif
endfunction "}}}

fun! CleanupMarkErrors() "{{{
    let i = s:signId + s:signCount

    if g:cuteErrorMarkerBrutalSignRemoval > 0
        sign unplace *
        let s:signCount = 0
        redraw!
        return
    endif

    let s:errBalloons = []
    " this if is here to avoid redraw if un-needed
    if i > s:signId
        while i > s:signId
            let toRun = "sign unplace " . i
            exec toRun
            let i = i - 1
        endwhile

        let s:signCount = 0
        redraw!
    endif
endfunction "}}}

fun! CuteErrorBalloon() "{{{
    for [bufNumber, lineNumber, txt] in s:errBalloons
        if v:beval_bufnr == bufNumber && v:beval_lnum == lineNumber
            return txt
        endif
    endfor
    return ''
endfunction "}}}

if !exists("g:cuteerrors_no_autoload")
    call PlaceErrorMarkersHook()
endif

if exists("+ballooneval") && !exists("g:cuteerrors_no_baloons")
    set ballooneval
    set balloonexpr=CuteErrorBalloon()
endif

command! MarkErrors call MarkErrors('err')
command! CleanupMarkErrors call CleanupMarkErrors()

