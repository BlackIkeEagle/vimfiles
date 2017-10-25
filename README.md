BlackIkeEagle vimfiles
======================

My personal vim configuration.
The config should be working fine on any OS.

Plugin Manager
--------------

[Plug](https://github.com/junegunn/vim-plug)

Plugins
-------

### Project tools

* sauce
  * http://www.vim.org/scripts/script.php?script_id=3992
  * https://github.com/joonty/vim-sauce
* jira complete
  * https://github.com/mnpk/vim-jira-complete
  * *REQUIRES* python2-requests
* vim-session
  * https://github.com/xolox/vim-session

### File navigation

* Ack
  * http://www.vim.org/scripts/script.php?script_id=2572
  * https://github.com/mileszs/ack.vim
* bufferlist
  * http://www.vim.org/scripts/script.php?script_id=1325
  * https://github.com/roblillack/vim-bufferlist
* CtrlP
  * http://www.vim.org/scripts/script.php?script_id=3736
  * https://github.com/kien/ctrlp.vim
* NERDTree
  * http://www.vim.org/scripts/script.php?script_id=1658
  * https://github.com/scrooloose/nerdtree
* NERDTree ack
  * http://www.vim.org/scripts/script.php?script_id=3878
  * https://github.com/tyok/nerdtree-ack
* QFGRep
  * https://github.com/sk1418/QFGrep
* Accordion
  * https://github.com/mattboehm/vim-accordion

### General plugins

* Airline
  * https://github.com/vim-airline/vim-airline
  * https://github.com/vim-airline/vim-airline-themes
* multiple-cursors
  * https://github.com/terryma/vim-multiple-cursors
* tabular
  * http://www.vim.org/scripts/script.php?script_id=3464
  * https://github.com/godlygeek/tabular
* undotree
  * http://www.vim.org/scripts/script.php?script_id=4177
  * https://github.com/mbbill/undotree
* vim-abolish
  * https://github.com/tpope/vim-abolish

### Coding

* Autoclose
  * http://www.vim.org/scripts/script.php?script_id=2009
  * https://github.com/Townk/vim-autoclose
* MatchTagAlways
  * https://github.com/Valloric/MatchTagAlways
* nerdcommenter
  * http://www.vim.org/scripts/script.php?script_id=1218
  * https://github.com/scrooloose/nerdcommenter
* ale
  * https://github.com/w0rp/ale
* tagbar
  * http://www.vim.org/scripts/script.php?script_id=3465
  * http://majutsushi.github.com/tagbar/
* deoplete
  * https://github.com/Shougo/deoplete.nvim

* fugitive
  * http://www.vim.org/scripts/script.php?script_id=2975
  * https://github.com/tpope/vim-fugitive
* signify
  * https://github.com/mhinz/vim-signify
* conflict marker
  * https://github.com/rhysd/conflict-marker.vim

* php_getset
  * https://github.com/EvanDotPro/php_getset.vim
* vdebug
  * http://www.vim.org/scripts/script.php?script_id=4170
  * https://github.com/joonty/vdebug
  * *REQUIRES* python2
* vim-composer
  * https://github.com/vim-php/vim-composer

* ultisnips
  * https://github.com/SirVer/ultisnips
* vim-snippets (contains snippets for ultisnips and snipmate)
  * https://github.com/honza/vim-snippets

* EditorConfig
  * https://github.com/editorconfig/editorconfig-vim
* Stripper
  * https://github.com/itspriddle/vim-stripper
* vim-expand-region
  * https://github.com/terryma/vim-expand-region
* vim-move
  * https://github.com/matze/vim-move

Colorschemes
------------

* base16
  * https://github.com/chriskempson/base16-vim
* gruvbox
  * https://github.com/morhetz/gruvbox
* onehalf
  * https://github.com/sonph/onehalf

Syntax/Filetype
---------------

* html5
  * https://github.com/othree/html5.vim
* html
  * https://github.com/pangloss/vim-javascript
* javascript
  * https://github.com/pangloss/vim-javascript
* jsx
  * https://github.com/mxw/vim-jsx
* typescript
  * https://github.com/HerringtonDarkholme/yats.vim
* jquery
  * https://github.com/nono/jquery.vim
* json
  * https://github.com/elzr/vim-json
* i3-vim-syntax
  * https://github.com/PotatoesMaster/i3-vim-syntax
* vim-markdown
  * https://github.com/gabrielelana/vim-markdown
* less
  * https://github.com/groenewege/vim-less
* vcl (varnish configuration language)
  * https://github.com/pld-linux/vim-syntax-vcl
* xt (xdebug)
  * https://github.com/xdebug/xdebug/tree/master/contrib
* yaml
  * https://github.com/stephpy/vim-yaml
* php
  * https://github.com/StanAngeloff/php.vim
  * https://github.com/shawncplus/phpcomplete.vim
* nginx
  * https://github.com/chr4/nginx.vim
* css
  * https://github.com/hail2u/vim-css3-syntax

Notes
-----

* vimrc contains a change to use [the_silver_searcher](https://github.com/ggreer/the_silver_searcher)
  with the ack plugin. install on archlinux: `$ pacman -S the_silver_searcher`
