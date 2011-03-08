" Vim color file
" Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
" Last Modified: Wed 05 Dec, 2011
" Version: 0.2
"
" GUI colors
"

set background=light
hi clear
if exists("syntax_on")
  syntax reset
endif
let colors_name="BlackEagle"

"--------------------------------------------------------------------- 
" Base Color
"--------------------------------------------------------------------- 
hi Normal          guifg=#111111    guibg=#cfcece

"--------------------------------------------------------------------- 
" Comment Group
"--------------------------------------------------------------------- 
hi Comment         guifg=#777675    gui=italic

"--------------------------------------------------------------------- 
" Constant Group
"--------------------------------------------------------------------- 
hi Constant        guifg=#d12e00    gui=bold
hi String          guifg=#9c3600
hi Character       guifg=#9c3600
hi Boolean         guifg=#dc6c00    gui=bold
hi Number          guifg=#dc6c00    gui=bold
hi Float           guifg=#dc6c00    gui=bold

"--------------------------------------------------------------------- 
" Identifier Group
"--------------------------------------------------------------------- 
hi Identifier      guifg=#0057AE
hi Function        guifg=#0057AE

"--------------------------------------------------------------------- 
" Statement Group
"--------------------------------------------------------------------- 
hi Statement       guifg=#BF0303
hi Conditional     guifg=#BF0303
hi Exception       guifg=#BF0303
hi Repeat          guifg=#BF0303
hi Label           guifg=#BF0303
hi Operator        guifg=#0057AE    gui=bold
hi keyword         guifg=#BF0303

"--------------------------------------------------------------------- 
" Preprocessor group
"--------------------------------------------------------------------- 
hi PreProc         guifg=#452886    gui=bold,italic
hi Include         guifg=#452886    gui=bold,italic
hi Define          guifg=#452886    gui=bold,italic
hi Macro           guifg=#452886    gui=bold,italic
hi PreCondit       guifg=#452886    gui=bold,italic

"--------------------------------------------------------------------- 
" Type Group
"--------------------------------------------------------------------- 
hi Type            guifg=#006E28    gui=bold
hi StorageClass    guifg=#006E28    gui=bold
hi Structure       guifg=#006E28    gui=bold
hi Typedef         guifg=#006E28    gui=bold

"--------------------------------------------------------------------- 
" Special Group
"--------------------------------------------------------------------- 
hi Special         guifg=#9C0E0E
hi SpecialChar     guifg=#9C0E0E
hi Tag             guifg=#9C0E0E
hi Delimiter       guifg=#9C0E0E
hi SpecialComment  guifg=#9C0E0E
hi Debug           guifg=#9C0E0E

"--------------------------------------------------------------------- 
" Text Markup
"--------------------------------------------------------------------- 
hi Underlined      guibg=#bfbebe    gui=underline
hi Error           guifg=#bf0303    guibg=#bfbebe   gui=bold
hi Todo            guifg=#b08000    guibg=#bfbebe   gui=bold
hi MatchParen      guifg=#000000    guibg=#ffffff   gui=bold
hi NonText         guifg=#452886
hi SpecialKey      guifg=#452886
hi Title           guifg=#006e28

"--------------------------------------------------------------------- 
" Selection
"--------------------------------------------------------------------- 
hi Cursor          guifg=#eaeaea    guibg=#111111
hi CursorIM        guifg=#eaeaea    guibg=#111111
hi CursorColumn    guifg=NONE       guibg=#dfdede
hi CursorLine      guifg=NONE       guibg=#dfdede
hi Visual          guibg=#9f9e9e
hi VisualNOS       guibg=#9f9e9e
hi IncSearch       guibg=#9f9e9e
hi Search          guibg=#9f9e9e

"--------------------------------------------------------------------- 
" Diff
"--------------------------------------------------------------------- 
"hi DiffAdd
"hi DiffChange
"hi DiffDelete
"hi DiffText

"--------------------------------------------------------------------- 
" Messages
"--------------------------------------------------------------------- 
hi ErrorMsg        guifg=#bf0303    guibg=#bfbebe   gui=bold
hi ModeMsg         guifg=#b08000    guibg=#bfbebe   gui=bold
hi MoreMsg         guifg=#006e28    guibg=#bfbebe   gui=bold
hi Question        guifg=#452886    guibg=#bfbebe   gui=bold
hi WarningMsg      guifg=#b08000    guibg=#bfbebe   gui=bold

"--------------------------------------------------------------------- 
" Interface
"--------------------------------------------------------------------- 
hi Pmenu           guifg=#111111    guibg=#bfbebe
hi PmenuSel        guifg=#111111    guibg=#afaeae
hi PMenuSbar       guibg=#cfcece
hi PMenuThumb      guibg=#fdfdfd
hi StatusLine      guifg=#7f7e7e    guibg=#eaeaea
hi StatusLineNC    guifg=#9f9e9e    guibg=#eaeaea
"hi TabLine
"hi TabLineFill
"hi TabLineSel
hi VertSplit       guifg=#9f9e9e    guibg=#eaeaea
hi Folded          guifg=#eaeaea    guibg=#9f9e9e
hi FoldedColumn    guifg=#eaeaea    guibg=#9f9e9e

hi Directory       guifg=#1d528a
hi SignColumn      guibg=#eaeaea
hi ColorColumn     guibg=#eaeaea
hi LineNr          guifg=#eaeaea    guibg=#cfcece
hi WildMenu        guifg=#111111    guibg=#afaeae

" vim:set ts=2 sw=2 et:
