" BlackEagles vimrc for Linux && Windows
"
" (c) 2010 - 2014

" nocompatible has to be the first of all ( use the real vimpower )
set nocompatible

" dont do matchparen
"let loaded_matchparen = 1

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
" build helptags
execute pathogen#helptags()

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

" make higlighting faster
set nocursorcolumn " dont change bg color column on cursorposition
set nocursorline   " dont change bg color line on cursorpostion

" allow project specific settings
set secure

" some interface options
set ruler                 " show cursorposition
set showcmd               " display incomplete commands
set nowrap                " dont wrap long lines
set incsearch             " incremental searching
set hlsearch              " highlight searchresult
set number                " show linennumbers
set linespace=0           " stick together (usefull for nfo files)
set hidden                " hide buffer even when changed
set scrolloff=4           " keep at least 4 lines above or below the cursor
set colorcolumn=80,120    " show column 80 and 120 in different color
set wildmode=longest,full " command completion longest common part, then all.

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
set tabstop=4     " a tab found in a file will be represented with 4 columns
set softtabstop=4 " when in insert mode <tab> is pressed move 4 columns
set shiftwidth=4  " indentation is 4 columns
set expandtab     " tabs are tabs, do not replace with spaces

" statusline stuff
set laststatus=2
"set statusline=%<%F%h\ %(%y\ %)[%{&ff}]\ %{\"[\".(&fenc==\"\"?&enc:&fenc).\"]\"}\ %([%R%M]\ %)%=#%n\ %l/%L,%c%V\ %P
if has("gui_gtk2") || has("gui_qt")
	let g:airline_powerline_fonts=1
endif
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1

" diff settings
set diffopt=filler,iwhite,vertical

" SuperTab settings
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" php settings
"let php_sql_query=0
"let php_htmlInStrings =0
let php_parent_error_close=1
let php_parent_error_open=1

" snips author
let g:snips_author = g:AuthorName . " <" . g:AuthorEmail . ">"

" AutoClose settings
let g:AutoCloseOn=0
"let g:AutoClosePairs= {'(': ')', '[': ']', '"': '"', "'": "'", '<': '>'}

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" Ack.vim
if executable('ag')
	" ack.vim with the_silver_searcher
	let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
elseif executable('ack-grep')
	" ack.vim with renamed ack
	let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif

" CtrlP
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\.git$\|\.hg$\|\.svn$',
	\ 'file': '\.exe$\|\.so$\|\.dll$\|\.pyc$' }

if executable('ag')
	let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
elseif executable('ack-grep')
	let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
elseif executable('ack')
	let s:ctrlp_fallback = 'ack %s --nocolor -f'
else
	let s:ctrlp_fallback = 'find %s -type f'
endif

" MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'phtml' : 1,
    \ 'twig' : 1,
    \}

" extra keymappings
" sudo save (when one forgets to sudo vim)
cmap w!! w !sudo tee % >/dev/null

" custom mapping
nnoremap <silent> <Leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <Leader>nf :NERDTreeFind<CR>
nnoremap <silent> <Leader>tb :TagbarToggle<CR>
nnoremap <silent> <Leader>ut :UndotreeToggle<CR>
nnoremap <silent> <Leader>bl :call BufferList()<CR>
nnoremap <silent> <Leader>lt :set list!<CR>

" nfo shit
au BufReadPre *.nfo set fileencodings=cp437
au BufReadPost *.nfo set fileencodings=utf-8,ucs-bom,cp1250
au BufReadPre *.diz set fileencodings=cp437
au BufReadPost *.diz set fileencodings=utf-8,ucs-bom,cp1250

if version >= 702
	autocmd BufWinLeave * call clearmatches()
endif
