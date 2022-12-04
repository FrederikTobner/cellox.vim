:function cellox#running#CelloxCompileAndRunFile()
:  silent !clear
:  execute "!" . g:cellox_command . " " . bufname("%")
:endfunction

:function cellox#running#CelloxCompileAndStoreFile()
:  silent !clear
:  execute "!" . g:cellox_command . " -scf " . bufname("%")
:endfunction

:nnoremap <buffer><LocalLeader>r :call CelloxCompileAndRunFile()<Cr>
:nnoremap <buffer><LocalLeader>r :call CelloxCompileAndStoreFile()<Cr>