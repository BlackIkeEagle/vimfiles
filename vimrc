" BlackEagles vimrc for Linux && *BSD
"
" (c) 2010 - 2018

" nocompatible has to be the first of all ( use the real vimpower )
set nocompatible

""""
" Plug config
""""


if (has("nvim"))
    call plug#begin('~/.local/share/nvim/plugged')
else
    call plug#begin('~/.vim/plugged')
endif
" colors
Plug 'chriskempson/base16-vim'

" filetype
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'pangloss/vim-javascript', { 'for': ['html', 'javascript'] }
Plug 'mxw/vim-jsx', { 'for': ['html', 'javascript'] } " jsx, react
Plug 'HerringtonDarkholme/yats.vim' " typescript
Plug 'nono/jquery.vim', { 'for': ['html', 'javascript'] }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
Plug 'gabrielelana/vim-markdown', { 'for': 'markdown' }
Plug 'groenewege/vim-less', { 'for': 'less' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'pld-linux/vim-syntax-vcl' " varnish
Plug 'stephpy/vim-yaml', { 'for': 'yaml' }
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'shawncplus/phpcomplete.vim', { 'for': 'php' }
Plug 'chr4/nginx.vim', { 'for': 'nginx' }

" syntaxrange
Plug 'vim-scripts/ingo-library'
Plug 'vim-scripts/SyntaxRange' " change syntax for specific range

" project
Plug 'joonty/vim-sauce'
Plug 'vimwiki/vimwiki'

" file navigation
Plug 'scrooloose/nerdtree'
Plug 'tyok/nerdtree-ack'
Plug 'mileszs/ack.vim'
Plug 'Shougo/denite.nvim'

" buffers
Plug 'mattboehm/vim-accordion'

" extras
Plug 'terryma/vim-multiple-cursors'
Plug 'godlygeek/tabular'
Plug 'mbbill/undotree'
Plug 'tpope/vim-abolish'

" general coding
Plug 'Valloric/MatchTagAlways'
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'w0rp/ale' " automated syntax checking
Plug 'majutsushi/tagbar'
Plug 'editorconfig/editorconfig-vim'
Plug 'itspriddle/vim-stripper'
Plug 'terryma/vim-expand-region'
Plug 'matze/vim-move'

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

" backup rules
set backup
set undofile
if has("win32")
    set backupdir=$TEMP
    set directory=$TEMP
    set viewdir=$TEMP
    set undodir=$TEMP
else
    if (has("nvim"))
        silent execute '!mkdir -p $HOME/.local/share/nvim/tmp/backup'
        set backupdir=$HOME/.local/share/nvim/tmp/backup
        silent execute '!mkdir -p $HOME/.local/share/nvim/tmp/swap'
        set directory=$HOME/.local/share/nvim/tmp/swap
        silent execute '!mkdir -p $HOME/.local/share/nvim/tmp/views'
        set viewdir=$HOME/.local/share/nvim/tmp/views
        silent execute '!mkdir -p $HOME/.local/share/nvim/tmp/undo'
        set undodir=$HOME/.local/share/nvim/tmp/undo
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
set ttyfast               " send more data for redrawing

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
set statusline=%<%F%h\ %([%R%M]\ %)\ %=%(%y\ %)[%{&ff}]\ %{\"[\".(&fenc==\"\"?&enc:&fenc).\"]\"}\ #%n\ %12(%l/%L%)\ %5.P

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
nnoremap <silent> <Leader>bl :Denite buffer<CR>
nnoremap <silent> <Leader>tl :Tags<CR>
nnoremap <silent> <Leader>fl :Denite file_rec<CR>
nnoremap <silent> <Leader>lt :set list!<CR>

" signcolumn highlight clear (matching background)
highlight clear SignColumn

" set the colorsheme
set background=dark
if (has("termguicolors"))
    set termguicolors
    try
        colorscheme base16-circus
    catch /^Vim\%((\a\+)\)\=:E185/
        " deal with it
    endtry
else
    colorscheme delek
endif

""""
" settings for plugins
""""

" vim-session
let g:session_directory = expand("~/.vimsession")
let g:session_autosave = 'no' " no automatic session saving

" jsx syntax
let g:jsx_ext_required = 0

" Ack.vim
if executable('ag')
    " ack.vim with the_silver_searcher
    let g:ackprg = 'ag --vimgrep'
elseif executable('ack-grep')
    " ack.vim with renamed ack
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif

" vimwiki
let g:vimwiki_list = [
    \{
        \'path': '~/Documents/vimwiki/',
        \'auto_tags': 1,
    \}
\]
        "\'syntax': 'markdown',

" NERDTree
let NERDTreeCascadeOpenSingleChildDir=0

" vim-signify
let g:signify_vcs_list = [ 'git', 'hg', 'svn' ]

" SuperTab settings
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

" MatchTagAlways
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'phtml' : 1,
    \ 'twig' : 1,
    \}

" Ale settings
let g:ale_open_list = 1 " show list when errors are found
let g:ale_lint_on_text_changed = 'normal'
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pycodestyle'],
\}

" vdebug settings
let g:vdebug_options = {
    \'path_maps': {'/phpapp': getcwd()}
\}

if version >= 702
    autocmd BufWinLeave * call clearmatches()
endif
