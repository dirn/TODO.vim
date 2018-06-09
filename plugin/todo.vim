" TODO.vim
" TODO write a description of this plugin along with some documentation.

if exists('g:todo_loaded')
    finish
endif
let g:todo_loaded = 1

function! s:todo()
    " TODO(dirn) is there a better way to check variable precedence?
    if exists('b:todo_name') && b:todo_name != ''
        let l:name = '(' . b:todo_name . ')'
    elseif exists('g:todo_name') && g:todo_name != ''
        let l:name = '(' . g:todo_name . ')'
    else
        let l:name = ''
    endif

    " TODO(dirn): Suppress the error message when no matches are found.
    exec 'vimgrep! /\C\V\<TODO\>' . l:name . '/ **'

    " TODO: Make this optional.
    cwindow
endfunction

command! TODO call s:todo()
