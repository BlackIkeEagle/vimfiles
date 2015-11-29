" BlackEagles vimrc for Linux and other unix flavours
"
" (c) 2010 - 2015

" nocompatible has to be the first of all ( use the real vimpower )
set nocompatible

" set leader key
let mapleader = ','

""""
" NeoBundle config
""""
if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))
" neobundle itself
NeoBundleFetch 'Shougo/neobundle.vim'

" colors
NeoBundle 'tomasr/molokai'
NeoBundle 'BlackIkeEagle/vim-colors-solarized' "{{{
    let g:solarized_termcolors=256
    let g:solarized_termtrans=1
"}}}

" filetype

" plugins
NeoBundle 'Shougo/vimproc.vim', {
    \ 'build': {
        \ 'mac': 'make -f make_mac.mak',
        \ 'unix': 'make -f make_unix.mak',
        \ 'cygwin': 'make -f make_cygwin.mak',
    \ },
\ }
NeoBundle 'Shougo/unite.vim' "{{{
let g:unite_source_rec_max_cache_files=5000

if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='-i --vimgrep --hidden --ignore ''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt=''
elseif executable('ack') || executable('ack-grep')
    if executable('ack')
        let g:unite_source_grep_command='ack'
    elseif executable('ack-grep')
        let g:unite_source_grep_command='ack-grep'
    endif
    let g:unite_source_grep_default_opts='-i --no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt=''
endif

let unitebundle = neobundle#get('unite.vim')
function! unitebundle.hooks.on_source(unitebundle)
    call unite#filters#matcher_default#use(['matcher_fuzzy'])
    call unite#filters#sorter_default#use(['sorter_rank'])
    call unite#custom#profile('default', 'context', {
                \ 'no_split': 1,
                \ 'resize': 0,
                \ })
endfunction

nnoremap <silent> <Leader>f :Unite -buffer-name=files file_rec/async<CR>
nnoremap <silent> <Leader>b :Unite -buffer-name=buffers buffer<CR>
nnoremap <silent> <Leader>/ :Unite -buffer-name=files grep:.<CR>
"}}}
NeoBundle 'Shougo/neoyank.vim' "{{{
nnoremap <silent> <Leader>y :Unite -buffer-name=yank history/yank<CR>
"}}}
NeoBundle 'Shougo/vimfiler' "{{{
nnoremap <silent> <Leader>nt :VimFilerExplorer<CR>
nnoremap <silent> <Leader>nf :VimFilerBufferDir<CR>
"}}}

call neobundle#end()

""""
" default vim settings
"""""

" dont do matchparen
"let loaded_matchparen = 1

" big nesting with new regexpengine is slooooooow
" set regexpengine=1

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
" settings for plugins
""""

" airline
"let g:airline_powerline_fonts=1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#tab_nr_type = 1
"let g:airline#extensions#whitespace#enabled = 0

" syntastic
"let g:syntastic_enable_signs=1
"let g:syntastic_auto_loc_list=1

" Ack.vim
"if executable('ag')
	" ack.vim with the_silver_searcher
"	let g:ackprg = 'ag --nogroup --nocolor --column --smart-case'
"elseif executable('ack-grep')
	" ack.vim with renamed ack
"	let g:ackprg="ack-grep -H --nocolor --nogroup --column"
"endif

" MatchTagAlways
"let g:mta_filetypes = {
"    \ 'html' : 1,
"    \ 'xhtml' : 1,
"    \ 'xml' : 1,
"    \ 'jinja' : 1,
"    \ 'phtml' : 1,
"    \ 'twig' : 1,
"    \}

" vim-signify
"let g:signify_vcs_list = [ 'git', 'hg', 'svn' ]

""""
" extra keymappings
"""""

" sudo save (when one forgets to sudo vim)
cmap w!! w !sudo tee % >/dev/null

" custom mapping
nnoremap <silent> <Leader>tb :TagbarToggle<CR>
nnoremap <silent> <Leader>ut :UndotreeToggle<CR>
nnoremap <silent> <Leader>bl :call BufferList()<CR>
nnoremap <silent> <Leader>lt :set list!<CR>

if version >= 702
	autocmd BufWinLeave * call clearmatches()
endif

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
