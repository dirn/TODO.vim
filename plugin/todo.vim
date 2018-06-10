" TODO.vim
" TODO write a description of this plugin along with some documentation.

if exists('g:todo_loaded')
    finish
endif
let g:todo_loaded = 1

function! s:todo(...)
    " Args:
    "     1: An optional name that will be used before either the global or
    "         buffer-level todo_name variable(s).

    lclose

    let l:name = s:todoname(exists('a:1') ? a:1 : '')

    " TODO(dirn): Suppress the error message when no matches are found.
    execute 'lvimgrep! /\C\V\<TODO\>' . l:name . '/ %'

    " TODO: Make this optional.
    lwindow
endfunction

function! s:todoname(name)
    " TODO(dirn) is there a better way to check variable precedence?
    if a:name != ''
        let l:name = a:name
    elseif exists('b:todo_name') && b:todo_name != ''
        let l:name = b:todo_name
    elseif exists('g:todo_name') && g:todo_name != ''
        let l:name = g:todo_name
    else
        let l:name = ''
    endif

    if l:name != ''
        let l:name = '(' . l:name . ')'
    endif

    return l:name
endfunction

command! -nargs=? TODO call s:todo(<f-args>)
