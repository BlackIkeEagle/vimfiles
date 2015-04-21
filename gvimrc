" BlackEagles gvimrc for Linux && Windows
"
" (c) 2010 - 2015

set guioptions=aiA "dont show toolbar

" set the colorsheme
colorscheme solarized
set background=light

" vim size stuff
set lines=60 columns=100

if has("gui_gtk2") || has("gui_qt")
	set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 10,DejaVu\ Sans\ Mono\ 10
elseif has("gui_win32")
	set guifont=Lucida_Console:h10:cANSI
endif

vnoremap <C-Insert> "+y
map <S-Insert> "+gP
imap <S-Insert> <MiddleMouse>
cmap <S-Insert> <C-R>+

if has("gui_gtk2")
	map <silent> <F12> :silent exec '!gvim'<CR>
elseif has("gui_qt")
	map <silent> <F12> :silent exec '!qvim'<CR>
endif

if version >= 702
	autocmd BufWinLeave * call clearmatches()
endif
