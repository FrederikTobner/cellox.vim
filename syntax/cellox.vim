" cellox syntax file
" Language: cellox
" Maintainer: Frederik Tobner

:if exists("b:current_syntax")
:  finish
:endif

" keywords of the language
:syntax keyword celloxKeyword var this super return

" booleans literals
:syntax keyword celloxBoolean true false

" Null constant
:syntax keyword celloxConstant null

" Loop-based keywords
:syntax keyword celloxRepeat for while

" Conditionals (keywords and && // || operators)
:syntax keyword celloxConditional if else and or

" Number literals
:syntax match celloxNumber "\v\-?\d*(\.\d+)?"

:syntax match celloxNumberError "\v\-?\d*(\.\d*[^0-9 -%=;,)+*]+\d*)"

" Escape sequences - order if the sequences matters !
syntax match celloxEscapeSequence contained "\\\(x[0-9a-fA-F][0-9a-fA-F][0-9a-fA-F]\|\d\d\d\|[abfnrtv"'\\\?]\)"

" Strings
:syntax region celloxString start="\v\"" end="\v\"" contains=celloxEscapeSequence

" Parens
:syntax match celloxParens "[()]"

" Braces
:syntax match celloxBraces "[{}\[\]]"

:syntax match celloxDoubleDot ":" contained

" Class Definitions
:syntax keyword celloxClassKeyword class contained
:syntax match celloxClassName " [a-zA-Z_][0-9a-zA-Z_]*" contained
:syntax match celloxParentClassName "(\:\s*[a-zA-Z_][0-9a-zA-Z_]*\s*)?" contained
:syntax region celloxClassExp  start=/\w\+\s\==\s\=class\>/ end="\s*[a-zA-Z_][0-9a-zA-Z_]*\s*(\:\s*[a-zA-Z_][0-9a-zA-Z_]*\s*)?" contains=celloxClassKeyword,celloxClassName,celloxParentClassName,celloxDoubleDot keepend
:syntax region celloxClassDef start="\<class\>" end="[^{]*" contains=celloxClassKeyword,celloxClassName,celloxParentClassName,celloxDoubleDot keepend

" Function Definitions
:syntax keyword celloxFunctionKeyword fun contained
:syntax region celloxFunctionExp  start=/\w\+\s\==\s\=fun\>/ end="\([^)]*\)" contains=celloxFunctionKeyword,celloxFunctionArg keepend
:syntax match celloxFunctionArg "\(([^()]*)\)" contains=celloxParens,celloxFunctionComma,celloxComment contained
:syntax match celloxFunctionComma /,/ contained
:syntax region celloxFunctionDef start="\<fun\>" end="\([^)]*\)" contains=celloxFunctionKeyword,celloxFunctionArg keepend

" Function / method calls and definitions
:syntax match celloxFunctionCall /\k\+\%(\s*[{('"]\)\@=/

" Semicolon
:syntax match celloxSemicolon ";"

" Operators of the language
:syntax match celloxOperator "[-!+<>=%/*^:.]" skipwhite skipempty
:syntax match celloxOperator "\(&&\)\|\(||\)"

" Comments need to be after the operators

" TODO's - only found in comments
:syntax keyword celloxTodo contained TODO FIXME XXX TBD OPTIMIZE HACK REVIEW

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
:highlight default link celloxEscapeSequence Special
:highlight default link celloxTodo Todo

:highlight default link celloxSemicolon Delimiter
:highlight default link celloxBraces Delimiter
:highlight default link celloxParens Delimiter

:highlight default link celloxFunctionKeyword Keyword
:highlight default link celloxFunctionDef Function
:highlight default link celloxFunctionExp Title
:highlight default link celloxFunctionArg Special
:highlight default link celloxFunctionComma Operator
:highlight default link celloxFunctionCall Function

:highlight default link celloxClassKeyword Keyword
:highlight default link celloxClassDef Function
:highlight default link celloxClassExp Title
:highlight default link celloxClassName Type
:highlight default link celloxParentClassName Type
:highlight default link celloxDoubleDot Operator

:highlight default link celloxNumberError Error

:let b:current_syntax = "cellox"