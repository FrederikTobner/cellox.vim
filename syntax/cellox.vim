" cellox syntax file
" Language: cellox
" Maintainer: Frederik Tobner

:if exists("b:current_syntax")
:  finish
:endif

" keywords
:syntax keyword celloxKeyword class fun var 
:syntax keyword celloxKeyword for while return

" booleans
:syntax keyword celloxBoolean true false

" constants
:syntax keyword celloxConstant nil

" functions
:syntax keyword celloxFunction print 

" operators
:syntax match celloxOperator "\v\*"
:syntax match celloxOperator "\v\+"
:syntax match celloxOperator "\v\-"
:syntax match celloxOperator "\v/"
:syntax match celloxOperator "\v\="
:syntax match celloxOperator "\v!"

" conditionals
:syntax keyword celloxConditional if else and or else

" numbers
:syntax match celloxNumber "\v\-?\d*(\.\d+)?"

" strings
:syntax region celloxString start="\v\"" end="\v\""

" comments
:syntax match celloxComment "\v//.*$"

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