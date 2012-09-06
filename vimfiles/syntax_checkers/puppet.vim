"============================================================================
"File:        puppet.vim
"Description: Syntax checking plugin for syntastic.vim
"Maintainer:  Eivind Uggedal <eivind at uggedal dot com>
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================
if exists("loaded_puppet_syntax_checker")
    finish
endif
let loaded_puppet_syntax_checker = 1

"bail if the user doesnt have puppet installed
if !executable("puppet")
    finish
endif

if !exists("g:syntastic_puppet_validate_disable")
    let g:syntastic_puppet_validate_disable = 0
endif

if !exists("g:syntastic_puppet_lint_disable")
    let g:syntastic_puppet_lint_disable = 0
endif

if !executable("puppet-lint")
    let g:syntastic_puppet_lint_disable = 1
endif

function! s:PuppetVersion()
    if !exists("s:puppet_version")
        let output = system("puppet --version 2>/dev/null")
        let output = substitute(output, '\n$', '', '')
        let s:puppet_version = split(output, '\.')
    endif
    return s:puppet_version
endfunction

function! s:PuppetLintVersion()
    if !exists("s:puppet_lint_version")
        let output = system("puppet-lint --version 2>/dev/null")
        let output = substitute(output, '\n$', '', '')
        let output = substitute(output, '^puppet-lint ', '', 'i')
        let s:puppet_lint_version = split(output, '\.')
    endif
    return s:puppet_lint_version
endfunction

"the args must be arrays of the form [major, minor, macro]
function s:IsVersionAtLeast(installed, required)
    if a:installed[0] != a:required[0]
        return a:installed[0] > a:required[0]
    endif

    if a:installed[1] != a:required[1]
        return a:installed[1] > a:required[1]
    endif

    return a:installed[2] >= a:required[2]
endfunction

if !g:syntastic_puppet_lint_disable
    if !s:IsVersionAtLeast(s:PuppetLintVersion(), [0,1,10])
        let g:syntastic_puppet_lint_disable = 1
    endif
end

function! s:getPuppetLintErrors()
    if !exists("g:syntastic_puppet_lint_arguments")
        let g:syntastic_puppet_lint_arguments = ''
    endif

    let makeprg = 'puppet-lint --log-format "\%{KIND} [\%{check}] \%{message} at \%{fullpath}:\%{linenumber}" '.g:syntastic_puppet_lint_arguments.shellescape(expand('%'))
    let errorformat = '%t%*[a-zA-Z] %m at %f:%l'
    return SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat, 'subtype': 'Style' })
endfunction

function! s:getPuppetMakeprg()
    "If puppet is >= version 2.7 then use the new executable
    if s:IsVersionAtLeast(s:PuppetVersion(), [2,7,0])
        let makeprg = 'puppet parser validate ' .
                    \ shellescape(expand('%')) .
                    \ ' --color=false'

        "add --ignoreimport for versions < 2.7.10
        if s:PuppetVersion()[2] < '10'
            let makeprg .= ' --ignoreimport'
        endif

    else
        let makeprg = 'puppet --color=false --parseonly --ignoreimport '.shellescape(expand('%'))
    endif
    return makeprg
endfunction

function! SyntaxCheckers_puppet_GetLocList()
    let errors = []

    if !g:syntastic_puppet_validate_disable
        let makeprg = s:getPuppetMakeprg()

        "some versions of puppet (e.g. 2.7.10) output the message below if there
        "are any syntax errors
        let errorformat = '%-Gerr: Try ''puppet help parser validate'' for usage,'
        let errorformat .= 'err: Could not parse for environment %*[a-z]: %m at %f:%l'

        let errors = errors + SyntasticMake({ 'makeprg': makeprg, 'errorformat': errorformat })
    endif

    if !g:syntastic_puppet_lint_disable
        let errors = errors + s:getPuppetLintErrors()
    endif

    return errors
endfunction

