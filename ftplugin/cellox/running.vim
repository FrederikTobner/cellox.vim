:if !exists("g:cellox_command")
:  let g:lox_command = "cellox"
:endif
:nnoremap <buffer><LocalLeader>r :call cellox#running#CelloxCompileAndRunFile()<Cr>
:command! LoxRun :call cellox#running#CelloxCompileAndRunFile()