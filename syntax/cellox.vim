" cellox syntax file
" Language: cellox
" Maintainer: Frederik Tobner

:if exists("b:current_syntax")
:  finish
:endif

" keywords of the language
:syntax keyword celloxKeyword class fun var this super return

" booleans literals
:syntax keyword celloxBoolean true false

" Null constant
:syntax keyword celloxConstant null

" Loop-based keywords
:syntax keyword celloxRepeat for while

" Operators of the language
:syntax match celloxOperator "\v\*"
:syntax match celloxOperator "\v\+"
:syntax match celloxOperator "\v\-"
:syntax match celloxOperator "\v/"
:syntax match celloxOperator "\v\="
:syntax match celloxOperator "\v!"
:syntax match celloxOperator "\v\%"
:syntax match celloxOperator "\v<"
:syntax match celloxOperator "\v>"

" Conditionals (keywords and && // || operators)
:syntax keyword celloxConditional if else and or
:syntax match celloxConditional "\v\|\|"
:syntax match celloxConditional "\v\&\&"

" Number literals
:syntax match celloxNumber "\v\-?\d*(\.\d+)?"

" Escape sequences
syntax match celloxSpecialCharacter contained "'\\.'"

" strings
:syntax region celloxString start="\v\"" end="\v\"" contains=celloxSpecialCharacter

" TODO - only found in comments
:syntax keyword celloxTodo contained TODO FIXME XXX NOTE

" Single line comments (C++-style)
:syntax match celloxComment "\v//.*$" contains=celloxTodo
" Multi line comments / Block comment (C-style)
:syntax region celloxComment start="\v/\*" end="\v\*/" contains=celloxTodo

" Function Definitions
:syntax region celloxFunction  start="\<fun\>" end="\([^)]*\)"

" Semicolon
:syntax match celloxSemicolon ";"

" Link syntax higlighting groups to the vim representation 🚀
:highlight default link celloxKeyword Keyword
:highlight default link celloxBoolean Boolean
:highlight default link celloxConstant Constant
:highlight default link celloxFunction Function
:highlight default link celloxOperator Operator
:highlight default link celloxConditional Conditional
:highlight default link celloxNumber Number
:highlight default link celloxString String
:highlight default link celloxComment Comment
:highlight default link celloxRepeat Repeat
:highlight default link celloxFuncCall Function
:highlight default link celloxSemicolon Delimiter
:highlight default link celloxSpecialCharacter Special
:highlight default link celloxTodo Todo

:let b:current_syntax = "cellox"