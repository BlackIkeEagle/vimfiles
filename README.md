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

* vimwiki
  * https://github.com/vimwiki/vimwiki

### File navigation

* Ack
  * http://www.vim.org/scripts/script.php?script_id=2572
  * https://github.com/mileszs/ack.vim
* NERDTree
  * http://www.vim.org/scripts/script.php?script_id=1658
  * https://github.com/scrooloose/nerdtree
* NERDTree ack
  * http://www.vim.org/scripts/script.php?script_id=3878
  * https://github.com/tyok/nerdtree-ack
* Accordion
  * https://github.com/mattboehm/vim-accordion
* Denite
  * https://github.com/Shougo/denite.nvim

### General plugins

* tabular
  * http://www.vim.org/scripts/script.php?script_id=3464
  * https://github.com/godlygeek/tabular
* undotree
  * http://www.vim.org/scripts/script.php?script_id=4177
  * https://github.com/mbbill/undotree
* vim-abolish
  * https://github.com/tpope/vim-abolish

### Coding

* MatchTagAlways
  * https://github.com/Valloric/MatchTagAlways
* nerdcommenter
  * http://www.vim.org/scripts/script.php?script_id=1218
  * https://github.com/scrooloose/nerdcommenter
* supertab
  * http://www.vim.org/scripts/script.php?script_id=1643
  * https://github.com/ervandew/supertab
* ale
  * https://github.com/w0rp/ale
* tagbar
  * http://www.vim.org/scripts/script.php?script_id=3465
  * http://majutsushi.github.com/tagbar/

* fugitive
  * http://www.vim.org/scripts/script.php?script_id=2975
  * https://github.com/tpope/vim-fugitive
* signify
  * https://github.com/mhinz/vim-signify
* conflict marker
  * https://github.com/rhysd/conflict-marker.vim

* vdebug
  * http://www.vim.org/scripts/script.php?script_id=4170
  * https://github.com/joonty/vdebug
  * *REQUIRES* python3
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
* palenight
  * https://github.com/drewtempelmeyer/palenight.vim

Syntax/Filetype
---------------

* vim-polyglot (all popular languages are bundled in there)
  * https://github.com/sheerun/vim-polyglot

Notes
-----

* vimrc contains a change to use [the_silver_searcher](https://github.com/ggreer/the_silver_searcher)
  with the ack plugin. install on archlinux: `$ pacman -S the_silver_searcher`
