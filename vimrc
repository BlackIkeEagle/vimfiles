" BlackEagles vimrc for Linux && Windows
"
" (c) 2010 - 2016

" nocompatible has to be the first of all ( use the real vimpower )
set nocompatible

""""
" Plug config
""""

call plug#begin('~/.vim/plugged')
" colors
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'chriskempson/base16-vim'

" filetype
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': ['html', 'javascript'] }
Plug 'mxw/vim-jsx', { 'for': ['html', 'javascript'] }
Plug 'nono/jquery.vim', { 'for': ['html', 'javascript'] }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
Plug 'gabrielelana/vim-markdown', { 'for': 'markdown' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'pld-linux/vim-syntax-vcl'
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
Plug '2072/PHP-Indenting-for-VIm', { 'for': 'php' }

" plugins
Plug 'xolox/vim-misc'
" project
Plug 'joonty/vim-sauce'
Plug 'xolox/vim-session'
Plug 'mnpk/vim-jira-complete'
" file navigation
Plug 'scrooloose/nerdtree'
Plug 'tyok/nerdtree-ack'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'sk1418/QFGrep'
" buffers
Plug 'roblillack/vim-bufferlist'
Plug 'mattboehm/vim-accordion'
" statusline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" extras
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'mbbill/undotree'
Plug 'tpope/vim-abolish'
" general coding
Plug 'Townk/vim-autoclose'
Plug 'Valloric/MatchTagAlways'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'editorconfig/editorconfig-vim'
Plug 'itspriddle/vim-stripper'
Plug 'terryma/vim-expand-region'
" vcs
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'rhysd/conflict-marker.vim'
" php
Plug 'EvanDotPro/php_getset.vim', { 'for': 'php' }
Plug 'joonty/vdebug'
Plug 'vim-php/vim-composer'
" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

""""
" default vim settings
"""""

" set leader key
let mapleader = ' '

" set the colorsheme
if (has("termguicolors"))
    set termguicolors
endif
set background=dark
colorscheme base16-google-dark

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
"set nowrap                " dont wrap long lines
set wrap                  " wrap long lines
set incsearch             " incremental searching
set hlsearch              " highlight searchresult
set number                " show linennumbers
set relativenumber        " show relative linennumbers
set linespace=0           " stick together (usefull for nfo files)
set hidden                " hide buffer even when changed
set scrolloff=4           " keep at least 4 lines above or below the cursor
set colorcolumn=80,120    " show column 80 and 120 in different color
set wildmode=longest,full " command completion longest common part, then all.
set wildmenu              " enable the command completion menu

" fileformat stuff
"set fileformat=unix
set fileformats=unix,dos
set encoding=utf-8
"set fileencoding=utf-8
set fileencodings=utf-8,ucs-bom,cp1250,iso-8859-1

" syntax
syntax on

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

" diff settings
set diffopt=filler,iwhite,vertical

" nfo shit
au BufReadPre *.nfo set fileencodings=cp437
au BufReadPost *.nfo set fileencodings=utf-8,ucs-bom,cp1250
au BufReadPre *.diz set fileencodings=cp437
au BufReadPost *.diz set fileencodings=utf-8,ucs-bom,cp1250

""""
" extra keymappings
"""""

" sudo save (when one forgets to sudo vim)
cmap w!! w !sudo tee % >/dev/null

" custom mapping
nnoremap <silent> <Leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <Leader>nf :NERDTreeFind<CR>
nnoremap <silent> <Leader>tb :TagbarToggle<CR>
nnoremap <silent> <Leader>ut :UndotreeToggle<CR>
nnoremap <silent> <Leader>bl :call BufferList()<CR>
nnoremap <silent> <Leader>lt :set list!<CR>

" signcolumn highlight clear (matching background)
highlight clear SignColumn

""""
" settings for plugins
""""

" vim-session
let g:session_directory = expand("~/.vimsession")
let g:session_autosave = 'no' " no automatic session saving

" jsx syntax
let g:jsx_ext_required = 0

" jira complete
imap <silent> <unique> <C-j> <Plug>JiraComplete
if filereadable(expand("~/.vimrc.jira"))
    source ~/.vimrc.jira
endif

" airline
"let g:airline_theme='hybrid'
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline#extensions#whitespace#enabled = 0

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
let g:ctrlp_max_files = 100000
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

" NERDTree
let NERDTreeCascadeOpenSingleChildDir=0

" vim-signify
let g:signify_vcs_list = [ 'git', 'hg', 'svn' ]

" SuperTab settings
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" AutoClose settings
let g:AutoCloseOn=0
let g:AutoClosePairs= {'(': ')', '[': ']', '"': '"', "'": "'", '<': '>'}

" syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=1

" MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'phtml' : 1,
    \ 'twig' : 1,
    \}

if version >= 702
    autocmd BufWinLeave * call clearmatches()
endif
