:function cellox#running#CelloxCompileAndRunFile()
:  silent !clear
:  execute "!" . g:lox_command . " " . bufname("%")
:endfunction

:nnoremap <buffer><LocalLeader>r :call LoxCompileAndRunFile()<Cr>