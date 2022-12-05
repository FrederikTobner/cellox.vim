" cellox syntax file
" Language: cellox
" Maintainer: Frederik Tobner

:if exists("b:current_syntax")
:  finish
:endif

" keywords of the language
:syntax keyword celloxKeyword class var this super return

" booleans literals
:syntax keyword celloxBoolean true false

" Null constant
:syntax keyword celloxConstant null

" Loop-based keywords
:syntax keyword celloxRepeat for while

" Conditionals (keywords and && // || operators)
:syntax keyword celloxConditional if else and or
:syntax match celloxConditional "\(&&\)\|\(||\)"

" Number literals
:syntax match celloxNumber "\v\-?\d*(\.\d+)?"

" Escape sequences
syntax match celloxSpecialCharacter contained "'\\.'"

" strings
:syntax region celloxString start="\v\"" end="\v\"" contains=celloxSpecialCharacter

" TODO - only found in comments
:syntax keyword celloxTodo contained TODO FIXME XXX TBD OPTIMIZE HACK REVIEW

" Parens
syntax match celloxParens       "[()]"

" Braces
syntax match celloxBraces       "[{}\[\]]"

" Function Definitions
:syntax keyword celloxFunctionKeyword fun contained
:syntax region celloxFunctionExp  start=/\w\+\s\==\s\=fun\>/ end="\([^)]*\)" contains=celloxFunctionEq,celloxFunctionKeyword,celloxFunctionArg keepend
:syntax match celloxFunctionArg "\(([^()]*)\)" contains=celloxParens,celloxFunctionComma,celloxComment contained
:syntax match celloxFunctionComma /,/ contained
:syntax match celloxFunctionEq /=/ contained
:syntax region celloxFunctionDef start="\<fun\>" end="\([^)]*\)" contains=celloxFunctionKeyword,celloxFunctionArg keepend
:syntax match celloxObjectKey /\<[a-zA-Z_$][0-9a-zA-Z_$]*\>\(\s*:\)\@=/ contains=celloxFunctionKey
:syntax match celloxFunctionKey /\<[a-zA-Z_$][0-9a-zA-Z_$]*\>\(\s*:\s*fun\s*\)\@=/ contained

:syntax match celloxFunctionCall /\k\+\%(\s*[{('"]\)\@=/

" Semicolon
:syntax match celloxSemicolon ";"

" Operators of the language
:syntax match celloxOperator "[-!|&+<>=%/*^]" skipwhite skipempty

" Single line comments (C++-style)
:syntax match celloxComment "\v//.*$" contains=celloxTodo
" Multi line comments / Block comment (C-style)
:syntax region celloxComment start="\v/\*" end="\v\*/" contains=celloxTodo

" Link syntax higlighting groups to the vim representation 🚀
:highlight default link celloxKeyword Keyword
:highlight default link celloxBoolean Boolean
:highlight default link celloxConstant Constant
:highlight default link celloxOperator Operator
:highlight default link celloxConditional Conditional
:highlight default link celloxNumber Number
:highlight default link celloxString String
:highlight default link celloxComment Comment
:highlight default link celloxRepeat Repeat
:highlight default link celloxSemicolon Delimiter
:highlight default link celloxSpecialCharacter Special
:highlight default link celloxTodo Todo

:highlight default link celloxBraces Delimiter
:highlight default link celloxParens Delimiter

:highlight default link celloxFunctionKeyword Keyword
:highlight default link celloxFunctionDef Function
:highlight default link celloxFunctionExp Title
:highlight default link celloxFunctionArg Special
:highlight default link celloxFunctionComma Operator
:highlight default link celloxFunctionEq Operator
:highlight default link celloxFunctionCall Function

:let b:current_syntax = "cellox"