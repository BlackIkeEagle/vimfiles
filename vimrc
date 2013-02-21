" BlackEagles vimrc for Linux && Windows
"
" (c) 2010 - 2013

" nocompatible has to be the first of all ( use the real vimpower )
set nocompatible

" set leader key
let mapleader = ','

" WHO ARE YOU ?
let g:AuthorName="Nobody"
let g:AuthorEmail="nobody@example.com"

" DEFAULT WORKSPACE AREA
let g:Workspace="~/devel/"

syntax on

" set the colorsheme
colorscheme molokai
set background=dark

" backup rules
set backup
if has("win32")
	set backupdir=$TEMP
	set directory=$TEMP
	set viewdir=$TEMP
else
	silent execute '!mkdir -p $HOME/.vim/tmp/backup'
	set backupdir=$HOME/.vim/tmp/backup
	silent execute '!mkdir -p $HOME/.vim/tmp/swap'
	set directory=$HOME/.vim/tmp/swap
	silent execute '!mkdir -p $HOME/.vim/tmp/views'
	set viewdir=$HOME/.vim/tmp/views
endif

" commandline history
set history=1000

" backspace stuff
set backspace=indent,eol,start

" some weird stuff to make it faster
set nocursorcolumn
set nocursorline

" allow project specific settings
set secure

" some interface options
set ruler			" show cursorposition
set cursorline      " highlight current line
set showcmd			" display incomplete commands
set incsearch		" incremental searching
set hlsearch		" highlight searchresult
set number			" show linennumbers
set linespace=0		" stick together (usefull for nfo files)
set hidden          " hide buffer even when changed
set scrolloff=4     " keep at least 4 lines above or below the cursor

" fileformat stuff
"set fileformat=unix
set fileformats=unix,dos
"set encoding=utf-8
"set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,cp1250,iso-8859-1

" filetype
filetype on
filetype plugin on
filetype indent on

" tabstop settings
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab

" statusline stuff
set laststatus=2
set statusline=%<%F%h\ %(%y\ %)[%{&ff}]\ %{\"[\".(&fenc==\"\"?&enc:&fenc).\"]\"}\ %([%R%M]\ %)%=#%n\ %l/%L,%c%V\ %P

" diff settings
set diffopt=filler,iwhite,vertical

" SuperTab settings
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" php settings
let php_sql_query=0
let php_htmlInStrings =0
let php_parent_error_close=1
let php_parent_error_open=1

" Folding stuff
let g:DisableAutoPHPFolding=1
let g:DisableAutoJSFolding=1

" AutoClose settings
let g:AutoCloseOn=0
"let g:AutoClosePairs= {'(': ')', '[': ']', '"': '"', "'": "'", '<': '>'}

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" custom functionkey mapping
map <silent> <F3> :CodeTidy<CR>
map <silent> <F4> :PhpDoc<CR>
map <silent> <F5> :NERDTreeToggle<CR>
map <silent> <F6> :TagbarToggle<CR>
map <silent> <F8> :call BufferList()<CR>
map <silent> <F9> :noh<CR>
map <silent> <F11> :set list!<CR>

" nfo shit
au BufReadPre *.nfo set fileencodings=cp437
au BufReadPost *.nfo set fileencodings=utf-8,ucs-bom,cp1250
au BufReadPre *.diz set fileencodings=cp437
au BufReadPost *.diz set fileencodings=utf-8,ucs-bom,cp1250

if version >= 702
	autocmd BufWinLeave * call clearmatches()
endif
