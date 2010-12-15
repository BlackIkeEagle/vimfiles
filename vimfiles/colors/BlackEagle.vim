" Vim color file
" Maintainer: BlackEagle < ike DOT devolder AT gmail DOT com >
" Last Modified: Wed 15 Dec, 2010
" Version: 0.1
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
hi Normal		guifg=#111111		guibg=#eaeaea

"--------------------------------------------------------------------- 
" Comment Group
"--------------------------------------------------------------------- 
hi Comment		guifg=#888786		gui=italic

"--------------------------------------------------------------------- 
" Constant Group
"--------------------------------------------------------------------- 
hi Constant		guifg=#452886
hi String		guifg=#452886
hi Character	guifg=#452886
hi Number		guifg=#452886
hi Boolean		guifg=#452886
hi Float		guifg=#452886

"--------------------------------------------------------------------- 
" Identifier Group
"--------------------------------------------------------------------- 
hi Identifier	guifg=#0057AE
hi Function		guifg=#0057AE

"--------------------------------------------------------------------- 
" Statement Group
"--------------------------------------------------------------------- 
hi Statement	guifg=#BF0303
hi Conditional	guifg=#BF0303
hi Exception	guifg=#BF0303
hi Repeat		guifg=#BF0303
hi Label		guifg=#BF0303
hi Operator		guifg=#BF0303
hi keyword		guifg=#BF0303

"--------------------------------------------------------------------- 
" Preprocessor group
"--------------------------------------------------------------------- 
hi PreProc		guifg=#B08000
hi Include		guifg=#B08000
hi Define		guifg=#B08000
hi Macro		guifg=#B08000
hi PreCondit	guifg=#B08000

"--------------------------------------------------------------------- 
" Type Group
"--------------------------------------------------------------------- 
hi Typedef		guifg=#006E28		gui=bold
hi StorageClass	guifg=#006E28		gui=bold
hi Structure	guifg=#006E28		gui=bold
hi Typedef		guifg=#006E28		gui=bold

"--------------------------------------------------------------------- 
" Special Group
"--------------------------------------------------------------------- 
hi Special		guifg=#9C0E0E
hi SpecialChar	guifg=#9C0E0E
hi Tag			guifg=#9C0E0E
hi Delimiter	guifg=#9C0E0E
hi SpecialComment		guifg=#9C0E0E
hi Debug		guifg=#9C0E0E

"--------------------------------------------------------------------- 
" Underlined Group
"--------------------------------------------------------------------- 
hi Underlined	guibg=#bfbebe		gui=underline

"--------------------------------------------------------------------- 
" Ignore Group
"--------------------------------------------------------------------- 
"hi Ignore		guifg=fg

"--------------------------------------------------------------------- 
" Error Group
"--------------------------------------------------------------------- 
hi Error		guifg=#eaeaea		guibg=#bf0303

"--------------------------------------------------------------------- 
" Todo Group
"--------------------------------------------------------------------- 
hi Todo			guifg=#eaeaea		guibg=#b08000

"--------------------------------------------------------------------- 
" Cursor
"--------------------------------------------------------------------- 
hi Cursor		guifg=#eaeaea		guibg=#111111
hi CursorIM		guifg=#eaeaea		guibg=#111111
hi CursorColumn	guifg=NONE			guibg=#fdfdfd
hi CursorLine	guifg=NONE			guibg=#fdfdfd

"--------------------------------------------------------------------- 
" Status
"--------------------------------------------------------------------- 
hi StatusLine	guifg=#888786		guibg=#eaeaea
hi StatusLineNC	guifg=#545352		guibg=#eaeaea

"--------------------------------------------------------------------- 
" Completion
"--------------------------------------------------------------------- 
hi Pmenu		guifg=#111111		guibg=#bfbebe
hi PmenuSel		guifg=#111111		guibg=#afaeae

"--------------------------------------------------------------------- 
" Folding
"--------------------------------------------------------------------- 
hi Folded		guifg=#eaeaea		guibg=#888786
hi FoldedColumn		guifg=#eaeaea		guibg=#888786

"--------------------------------------------------------------------- 
" Messages
"--------------------------------------------------------------------- 
hi ErrorMsg		guifg=#bf0303		guibg=#bfbebe		gui=bold
hi ModeMsg		guifg=#b08000		guibg=#bfbebe		gui=bold
hi MoreMsg		guifg=#006e28		guibg=#bfbebe		gui=bold

"--------------------------------------------------------------------- 
" Interface
"--------------------------------------------------------------------- 
hi Directory	guifg=#2870bd
hi LineNr		guifg=#bfbebe
hi MatchParen	guibg=#ffffff		gui=bold
hi NonText		guifg=#452886
hi WildMenu		guifg=#111111		guibg=#afaeae
hi VertSplit	guifg=#545352		guibg=#eaeaea
