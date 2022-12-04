:if !exists("g:cellox_command")
:  let g:lox_command = "Cellox"
:endif
:nnoremap <buffer><LocalLeader>r :call cellox#running#CelloxCompileAndRunFile()<Cr>
:command! CelloxRun :call cellox#running#CelloxCompileAndRunFile()