" TODO.vim

if exists('g:todo_loaded')
    finish
endif
let g:todo_loaded = 1

function! s:todo()
    if !exists('g:todo_name')
        let g:todo_name = ''
    endif

    if g:todo_name == ''
        let l:name = ''
    else
        let l:name = '(' . g:todo_name . ')'
    endif

    exec 'vimgrep! /\C\V\<TODO\>' . l:name . '/ **'

    copen
endfunction

command! TODO call s:todo()
