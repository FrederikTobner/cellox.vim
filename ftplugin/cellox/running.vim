:if !exists("g:cellox_command")
:  let g:cellox_command = "Cellox"
:endif
:nnoremap <buffer><LocalLeader>r :call cellox#running#CelloxCompileAndRunFile()<Cr>
:nnoremap <buffer><LocalLeader>r :call cellox#running#CelloxCompileAndStoreFile()<Cr>
:command! CelloxRun :call cellox#running#CelloxCompileAndRunFile()
:command! CelloxStoreChunk :call cellox#running#CelloxCompileAndStoreFile()