" BlackEagles vimrc for Linux && *BSD
"
" (c) 2010 - 2019

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
Plug 'rakr/vim-one'

" file navigation
Plug 'scrooloose/nerdtree'
Plug 'tyok/nerdtree-ack'
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'

" buffers
Plug 'jeetsukumaran/vim-buffergator'
Plug 'mattboehm/vim-accordion'

" extras
Plug 'godlygeek/tabular'
Plug 'mbbill/undotree'
Plug 'tpope/vim-abolish'

" vcs
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'rhysd/conflict-marker.vim'

" general coding
Plug 'scrooloose/nerdcommenter'
Plug 'ervandew/supertab'
Plug 'w0rp/ale' " automated syntax checking

" ansible
Plug 'pearofducks/ansible-vim'

" html
Plug 'othree/html5.vim', { 'for': 'html' }

" nginx
Plug 'chr4/nginx.vim'

" varnish
Plug 'fgsch/vim-varnish'

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
"set ruler                 " show cursorposition
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
syntax sync minlines=300
set synmaxcol=300

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
set statusline=%<%F%h\ %([%R%M]\ %)\ %=%(%y\ %)[%{&ff}]\ %{\"[\".(&fenc==\"\"?&enc:&fenc).\"]\"}\ #%n\ %10(%l/%L%)\ %4(%c%)\ %4.P

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
nnoremap <silent> <Leader>bl :BuffergatorToggle<CR>
nnoremap <silent> <Leader>tl :Tags<CR>
nnoremap <silent> <Leader>lt :set list!<CR>

" signcolumn highlight clear (matching background)
highlight clear SignColumn

" set the colorscheme
set background=dark
if (has("termguicolors") && &t_Co >= 256)
    set termguicolors
    try
        colorscheme one
    catch /^Vim\%((\a\+)\)\=:E185/
        " deal with it
    endtry
else
    set t_Co=256
    colorscheme delek
endif

""""
" settings for plugins
""""

" Ack.vim
if executable('ag')
    " ack.vim with the_silver_searcher
    let g:ackprg = 'ag --vimgrep'
elseif executable('ack-grep')
    " ack.vim with renamed ack
    let g:ackprg="ack-grep -H --nocolor --nogroup --column"
endif

" NERDTree
let NERDTreeCascadeOpenSingleChildDir=0

" Buffergator
let g:buffergator_viewport_split_policy = "B"

" vim-signify
let g:signify_vcs_list = [ 'git', 'hg', 'svn' ]

" Ale settings
let g:ale_open_list = 1 " show list when errors are found
let g:ale_lint_on_text_changed = 'normal'

" SuperTab settings
"let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
"let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"

if version >= 702
    autocmd BufWinLeave * call clearmatches()
endif
