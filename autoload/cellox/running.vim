" interprets the current script in the editor
:function cellox#running#CelloxCompileAndRunFile()
:  silent !clear
:  execute "!" . g:cellox_command . " " . bufname("%")
:endfunction

" converts the current script in the editor to bytecode and stores the intermediate representation as a chunk file.
:function cellox#running#CelloxCompileAndStoreFile()
:  silent !clear
:  execute "!" . g:cellox_command . " -scf " . bufname("%")
:endfunction

:nnoremap <buffer><LocalLeader>r :call CelloxCompileAndRunFile()<Cr>
:nnoremap <buffer><LocalLeader>r :call CelloxCompileAndStoreFile()<Cr>