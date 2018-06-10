" TODO.vim
" TODO write a description of this plugin along with some documentation.

if exists('g:todo_loaded')
    finish
endif
let g:todo_loaded = 1


function! s:todobuffers(...)
    " Args:
    "     1: An optional name that will be used before either the global or
    "         buffer-level todo_name variable(s).

    let l:name = s:todoname(exists('a:1') ? a:1 : '')

    lclose

    " Clear the local list so that we can append the results from each buffer.
    lexpr []
    silent bufdo execute 'lvimgrepadd! /\C\V\<TODO\>' . l:name . '/ %'

    lwindow
endfunction

function! s:todocurrent(...)
    " Args:
    "     1: An optional name that will be used before either the global or
    "         buffer-level todo_name variable(s).

    let l:name = s:todoname(exists('a:1') ? a:1 : '')

    lclose

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

command! -nargs=? TODO call s:todocurrent(<f-args>)
command! -nargs=? TODOBuffers call s:todobuffers(<f-args>)
