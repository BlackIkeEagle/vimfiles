" BlackEagles vimrc for Linux && Windows
"
" (c) 2010

" nocompatible has to be the first of all ( use the real vimpower )
set nocompatible

" WHO ARE YOU ?
let g:AuthorName="Ike Devolder"
let g:AuthorEmail="ike DOT devolder AT gmail DOT com"

syntax on

" hide all the unneeded stuff from the gui
if has("gui_running")
	set guioptions=aiA "dont show toolbar
	if has("gui_gtk2")
		set guifont=DejaVu\ Sans\ Mono\ 9
	endif
	if has("gui_x11")
		set guifont=-adobe-courier-medium-r-*-*-12-*-*-*-*-*-*-*
	endif
	if has("gui_w32")
		set guifont=courier_new:h12:w5
	endif
	" colorsheme gui
	"colorscheme CodeFactory
	" vim size stuff
	set lines=60 columns=100
else
	" colorscheme terminal
	"colorscheme default
endif

" colorsheme
colorscheme CodeFactory

" backup rules
set backup
set backupdir=~/tmp
set directory=~/tmp

" commandline history
set history=1000

" some weird stuff to make it faster
set nocursorcolumn
set nocursorline

" some interface options
set ruler			" show cursorposition
set showcmd			" display incomplete commands
set incsearch		" incremental searching
set hlsearch		" highlight searchresult
set number			" show linennumbers
set linespace=0
set hidden          " hide buffer even when changed

" fileformat stuff
set fileformat=unix
set fileformats=unix
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,cp1250

" filetype
filetype on
filetype plugin on
filetype indent on

" tabstop settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" SuperTab settings
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" CheckSyntax Settings
let g:checksyntax_auto_php = 1
let g:checksyntax_auto_javascript = 1
let g:checksyntax_auto_xml = 1
let g:checksyntax_auto_html = 1
let g:checksyntax_auto_xhtml = 1

" php settings
let php_sql_query=0
let php_htmlInStrings=0
let php_noShortTags=1

" Folding stuff
let php_folding=1
let javascript_fold=1

" AutoClose settings
let g:AutoCloseOn=0

" custom functionkey mapping
if has("gui_running")
	map <silent> <F2> :silent exec '!gvim'<CR>
endif
map <silent> <F3> :PhpTidy<CR>
map <silent> <F4> :PhpDoc<CR>
map <silent> <F5> :NERDTreeToggle<CR>
map <silent> <F7> :BufExplorer<CR>
map <silent> <F8> :CheckSyntax<CR>

" nfo shit
au BufReadPre *.nfo set fileencodings=cp437
au BufReadPost *.nfo set fileencodings=utf-8,ucs-bom,cp1250
au BufReadPre *.diz set fileencodings=cp437
au BufReadPost *.diz set fileencodings=utf-8,ucs-bom,cp1250
