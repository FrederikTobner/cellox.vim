" cellox syntax file
" Language: cellox
" Maintainer: Frederik Tobner

:if exists("b:current_syntax")
:  finish
:endif

" keywords
:syntax keyword celloxKeyword class fun var 
:syntax keyword celloxKeyword for while return
:syntax keyword celloxKeyword this super
:syntax keyword celloxKeyword and or
:syntax match celloxKeyword "\v\&\&"
:syntax match celloxKeyword "\v\|\|"

" booleans
:syntax keyword celloxBoolean true false

" constants
:syntax keyword celloxConstant null

" I/O functions
:syntax keyword celloxFunction print println read_line read_file append_to_file write_to_file 
" Misceallaneous functions
:syntax keyword celloxFunction system strlen exit random 
" System info functions
:syntax keyword celloxFunction on_linux on_macOS on_Windows
" Time based functions
:syntax keyword celloxFunction clock
" Thread based functions
:syntax keyword celloxFunction wait

" operators
:syntax match celloxOperator "\v\*"
:syntax match celloxOperator "\v\+"
:syntax match celloxOperator "\v\-"
:syntax match celloxOperator "\v/"
:syntax match celloxOperator "\v\="
:syntax match celloxOperator "\v!"
:syntax match celloxOperator "\v\%"
:syntax match celloxOperator "\v<"
:syntax match celloxOperator "\v>"

" conditionals
:syntax keyword celloxConditional if else and or else

" numbers
:syntax match celloxNumber "\v\-?\d*(\.\d+)?"

" strings
:syntax region celloxString start="\v\"" end="\v\""

" Single line comments
:syntax match celloxComment "\v//.*$"
" Multi line comments
:syntax region celloxComment start="\v/\*" end="\v\*/"

:highlight link celloxKeyword Keyword
:highlight link celloxBoolean Boolean
:highlight link celloxConstant Constant
:highlight link celloxFunction Function
:highlight link celloxOperator Operator
:highlight link celloxConditional Conditional
:highlight link celloxNumber Number
:highlight link celloxString String
:highlight link celloxComment Comment

:let b:current_syntax = "cellox"