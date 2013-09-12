" BlackEagles gvimrc for Linux && Windows
"
" (c) 2010 - 2013

set guioptions=aiA "dont show toolbar

" set the colorsheme
colorscheme solarized
set background=dark

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

map <silent> <F12> :silent exec '!gvim'<CR>

if version >= 702
	autocmd BufWinLeave * call clearmatches()
endif
