" BlackEagles vimrc for Linux && Windows
"
" (c) 2010 - 2014

" nocompatible has to be the first of all ( use the real vimpower )
set nocompatible

" big nesting with new regexpengine is slooooooow
" set regexpengine=1

" set leader key
let mapleader = ','

" WHO ARE YOU ?
let g:AuthorName="Nobody"
let g:AuthorEmail="nobody@example.com"

" DEFAULT WORKSPACE AREA
let g:Workspace="~/devel/"

" enable pathogen
execute pathogen#infect()

syntax on

" set the colorsheme
colorscheme molokai
set background=dark

" backup rules
set backup
set undofile
if has("win32")
	set backupdir=$TEMP
	set directory=$TEMP
	set viewdir=$TEMP
	set undodir=$TEMP
else
	silent execute '!mkdir -p $HOME/.vim/tmp/backup'
	set backupdir=$HOME/.vim/tmp/backup
	silent execute '!mkdir -p $HOME/.vim/tmp/swap'
	set directory=$HOME/.vim/tmp/swap
	silent execute '!mkdir -p $HOME/.vim/tmp/views'
	set viewdir=$HOME/.vim/tmp/views
	silent execute '!mkdir -p $HOME/.vim/tmp/undo'
	set undodir=$HOME/.vim/tmp/undo
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
set ruler              " show cursorposition
set cursorline         " highlight current line
set showcmd            " display incomplete commands
set incsearch          " incremental searching
set hlsearch           " highlight searchresult
" set ignorecase       " ignore case
" set smartcase        " when searching case sensitive case will be used
                       " if no case (lowercase) is used both lower/upper/mixed
                       " case is searched
set number             " show linennumbers
" set relativenumber   " show how far a number line is from the current
set linespace=0        " stick together (usefull for nfo files)
set hidden             " hide buffer even when changed
set scrolloff=4        " keep at least 4 lines above or below the cursor
set colorcolumn=80,120 " show column 80 and 120 in different color

" fileformat stuff
"set fileformat=unix
set fileformats=unix,dos
set encoding=utf-8
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
"set statusline=%<%F%h\ %(%y\ %)[%{&ff}]\ %{\"[\".(&fenc==\"\"?&enc:&fenc).\"]\"}\ %([%R%M]\ %)%=#%n\ %l/%L,%c%V\ %P
if has("gui_gtk2") || has("gui_qt")
	let g:airline_powerline_fonts=1
endif

" diff settings
set diffopt=filler,iwhite,vertical

" tab completion
" SuperTab settings
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" php settings
"let php_sql_query=0
"let php_htmlInStrings =0
let php_parent_error_close=1
let php_parent_error_open=1

" php documentor settings
"let g:pdv_cfg_Package = 'YourPackage'
let g:pdv_cfg_Author = g:AuthorName . " <" . g:AuthorEmail . ">"
let g:pdv_cfg_ClassTags = ["package","author"]

" AutoClose settings
let g:AutoCloseOn=0
"let g:AutoClosePairs= {'(': ')', '[': ']', '"': '"', "'": "'", '<': '>'}

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" ack.vim with the_silver_searcher
let g:ackprg = 'ag --nogroup --nocolor --column'

" extra keymappings
" sudo save (when one forgets to sudo vim)
cmap w!! w !sudo tee % >/dev/null

" custom functionkey mapping
map <silent> <F1> :NERDTreeToggle<CR>
map <silent> <F2> :TagbarToggle<CR>
map <silent> <F3> :UndotreeToggle<CR>
map <silent> <F4> :call BufferList()<CR>
map <silent> <F6> :pc<CR>
map <silent> <F7> :CodeTidy<CR>
map <silent> <F8> :call PhpDoc()<CR>
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
