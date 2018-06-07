" TODO.vim
" TODO write a description of this plugin along with some documentation.

if exists('g:todo_loaded')
    finish
endif
let g:todo_loaded = 1

function! s:todo()
    " TODO(dirn) should this really be done in two separate blocks?
    if !exists('g:todo_name')
        let g:todo_name = ''
    endif

    if g:todo_name == ''
        let l:name = ''
    else
        let l:name = '(' . g:todo_name . ')'
    endif

    " TODO(dirn): Suppress the error message when no matches are found.
    exec 'vimgrep! /\C\V\<TODO\>' . l:name . '/ **'

    " TODO: Make this optional.
    copen
endfunction

command! TODO call s:todo()
