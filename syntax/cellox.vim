" cellox syntax file
" Language: cellox
" Maintainer: Frederik Tobner
" Grammar: https://github.com/FrederikTobner/Cellox/blob/main/GRAMMAR.md

if exists("b:current_syntax")
  finish
endif

" Keywords have priority over matches, so e.g. 'if (' is never highlighted as a function call.

" Declarations
syntax keyword celloxKeyword var fun this super
syntax keyword celloxStructure class error

" Control flow
syntax keyword celloxConditional if else
syntax keyword celloxRepeat for while do break continue
syntax keyword celloxStatement return

" Error handling
syntax keyword celloxException try catch must iferror throw

" Word operators
syntax keyword celloxOperator and or

" Literals
syntax keyword celloxBoolean true false
syntax keyword celloxConstant null

" Native functions
syntax keyword celloxBuiltin append_to_file array_length asci_to_num class_of clock cosine exit exponential
syntax keyword celloxBuiltin logarithm logarithm10 num_to_asci on_linux on_macOS on_windows printf random
syntax keyword celloxBuiltin read_file read_key read_line sine size_of string_hash strlen string_replace_at
syntax keyword celloxBuiltin system tangent wait write_to_file

" Number literals (decimal, hexadecimal and binary)
syntax match celloxNumber "\<\d\+\%(\.\d\+\)\?\>"
syntax match celloxNumber "\<0[xX]\x\+\>"
syntax match celloxNumber "\<0[bB][01]\+\>"

" Strings - escape sequences and the '{}' placeholders of printf
syntax match celloxEscapeError contained "\\."
syntax match celloxEscapeSequence contained "\\\%([abfnrtv\"'\\?]\|\o\{1,3}\|x\x\{1,2}\)"
syntax match celloxPlaceholder contained "{}"
syntax region celloxString start=+"+ end=+"+ contains=celloxEscapeSequence,celloxEscapeError,celloxPlaceholder

" Modules - import and export directives are processed line by line
syntax region celloxImport start="^\s*import\>" end=";" keepend contains=celloxImportKeyword,celloxFromKeyword,celloxString,celloxBraces,celloxComma,celloxImportName
syntax match celloxImportName contained "\<\h\w*\>"
syntax match celloxImportKeyword contained "\<import\>"
syntax match celloxFromKeyword contained "\<from\>"
syntax match celloxExportKeyword "^\s*\zsexport\ze\s\+\%(var\|fun\|class\)\>"

" Property access (not the range operator) and function / method calls
syntax match celloxProperty "\.\@<!\.\.\@!\s*\zs\h\w*"
syntax match celloxFunctionCall "\<\h\w*\ze\s*("

" Definitions - lookbehinds are used because the keywords have priority over matches starting at them
syntax match celloxClassName "\%(\<class\s\+\)\@<=\h\w*"
syntax match celloxSuperClassName "\%(\<class\s\+\h\w*\s*:\s*\)\@<=\h\w*"
syntax match celloxFunctionName "\%(\<fun\s\+\)\@<=\h\w*"

" Variables bound by catch and iferror - '|name|'
syntax match celloxBinding "\%(|\)\@<!|\s*\h\w*\s*|\%(|\)\@!" contains=celloxPipe,celloxBindingName
syntax match celloxPipe contained "|"
syntax match celloxBindingName contained "\<\h\w*\>"

" Delimiters
syntax match celloxSemicolon ";"
syntax match celloxComma ","
syntax match celloxParens "[()]"
syntax match celloxBraces "[{}\[\]]"

" Error sets - 'error Name { A, B }' (defined after the delimiters, so the body wins over the brace match)
syntax match celloxErrorName "\%(\<error\s\+\)\@<=\h\w*\ze\s*{"
syntax region celloxErrorBody matchgroup=celloxBraces start="\%(\<error\s\+\h\w*\s*\)\@<={" end="}" keepend contains=celloxErrorVariant,celloxComma,celloxLineComment,celloxBlockComment
syntax match celloxErrorVariant contained "\<\h\w*\>"

" Operators of the language (including the range operator of slices)
syntax match celloxOperator "\*\*=\?\|[-+/%*]=\?\|==\|!=\|[<>]=\?\|=\|!\|&&\|||\|\.\.\|:"

" Comments need to be after the operators

" TODO's - only found in comments
syntax keyword celloxTodo contained TODO FIXME XXX TBD OPTIMIZE HACK REVIEW

" Single line comments (C++-style)
syntax match celloxLineComment "//.*$" contains=celloxTodo
" Multi line comments / Block comment (C-style), block comments can be nested
syntax region celloxBlockComment start="/\*" end="\*/" contains=celloxBlockComment,celloxTodo

" Link syntax higlighting groups to the vim representation
highlight default link celloxKeyword Keyword
highlight default link celloxStructure Structure
highlight default link celloxConditional Conditional
highlight default link celloxRepeat Repeat
highlight default link celloxStatement Statement
highlight default link celloxException Exception
highlight default link celloxOperator Operator
highlight default link celloxBoolean Boolean
highlight default link celloxConstant Constant
highlight default link celloxBuiltin Function
highlight default link celloxNumber Number
highlight default link celloxString String
highlight default link celloxEscapeSequence Special
highlight default link celloxPlaceholder Special
highlight default link celloxEscapeError Error

highlight default link celloxImportKeyword Include
highlight default link celloxFromKeyword Include
highlight default link celloxExportKeyword Include
highlight default link celloxImportName Identifier

highlight default link celloxClassName Type
highlight default link celloxSuperClassName Type
highlight default link celloxFunctionName Function
highlight default link celloxFunctionCall Function
highlight default link celloxErrorName Type
highlight default link celloxErrorVariant Constant
highlight default link celloxProperty Identifier
highlight default link celloxPipe Delimiter
highlight default link celloxBindingName Identifier

highlight default link celloxSemicolon Delimiter
highlight default link celloxComma Delimiter
highlight default link celloxBraces Delimiter
highlight default link celloxParens Delimiter

highlight default link celloxLineComment Comment
highlight default link celloxBlockComment Comment
highlight default link celloxTodo Todo

let b:current_syntax = "cellox"
