" TODO.vim

if exists('g:todo_loaded')
    finish
endif
let g:todo_loaded = 1

function! s:todo()
    vimgrep! /\C\<TODO\>/ **
    copen
endfunction

command! TODO call s:todo()
