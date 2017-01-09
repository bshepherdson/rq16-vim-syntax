" Vim syntax file
" Language:     Risque-16 Assembler (Virtual RISQ CPU, sibling to DCPU-16)
" Maintainer:   Braden Shepherdson <braden.shepherdson@gmail.com>
" Last Change:  January 9, 2017
" URL:          http://github.com/shepheb/rq16-vim-syntax
" Revision:     1


" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif


syn case match
syn keyword rqTodo NOTE TODO FIXME XXX contained
syn case ignore

" any valid identifier
syn match rqIdentifier "[a-z_][a-z0-9_]*"

" valid label
syn match rqLabel      "^:[A-Z_][A-Z0-9_]*"
syn match rqSubLabel   "^:\.[A-Z_][A-Z0-9_]*"
" me=e-1

" one character
syn match rqASCII      "'.'"

" numbers:
" decimal
syn match rqNumber     "\<[0-9]\+\>"
" hexadecimal
syn match rqNumber     "\<0[Xx][0-9a-fA-F]\+\>"
syn match rqNumber     "\$[0-9a-fA-F]\+\>"

" string in double quotes
syn region rqString    start=+"+ end=+"+

" comments with special marks
syn match rqComment    ";.*" contains=rqTodo

" registers
syn keyword rqRegister     r0 r1 r2 r3 r4 r5 r6 r7 pc sp lr

" instruction opcodes
syn keyword rqOpcode ADC ADD AND ASR BIC CMN CMP EOR LSL LSR
syn keyword rqOpcode MOV MUL MVN NEG ORR ROR SBC SUB TST B
syn keyword rqOpcode BL BX BLX BEQ BNE BCS BCC BMI BPL BVS
syn keyword rqOpcode BVC BHI BLS BGE BLT BGT BLE HWN HWQ HWI
syn keyword rqOpcode SWI RFI RSI IFS IFC MRS MSR LDR STR PUSH
syn keyword rqOpcode POP STMIA LDMIA


" directives
syn keyword rqDirective       .dat .define .def .fill .reserve .macro .include


" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_rq_syntax_inits")
  if version < 508
    let did_rq_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif


  HiLink rqTodo               Todo
  HiLink rqComment            Comment

  HiLink rqLabel              Function
  HiLink rqSubLabel           Label
  HiLink rqString             String
  HiLink rqASCII              Character
  HiLink rqNumber             Number

  HiLink rqOpcode             Statement
  HiLink rqRegister           Type
  HiLink rqDirective          PreProc

  delcommand HiLink
endif


let b:current_syntax = "rq"

" vim: ts=8 syntax=vim
