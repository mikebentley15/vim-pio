" Vim syntax file
" Language:     PIO Programmable I/O
" Maintainer:   Michael Bentley <mikebentley15@gmail.com>
" Last Changed: 15 September 2021

if exists("b:current_syntax")
  finish
endif

syn keyword pioJmpInstruction contained jmp skipwhite nextgroup=pioArgs
syn keyword pioInstruction contained
      \ in
      \ irq
      \ mov
      \ nop
      \ out
      \ pull
      \ push
      \ set
      \ wait
      \ skipwhite nextgroup=pioArgs
syn keyword pioTodos contained
      \ FIXME
      \ FixMe
      \ Fixme
      \ NOTE
      \ Note
      \ TODO
      \ Todo
      \ XXX
      \ fixme
      \ note
      \ todo
syn keyword pioProgramName  contained "[a-zA-Z_][0-9a-zA-Z_]*"
syn match   pioKeyLabel   "\.program"  skipwhite nextgroup=pioProgramName
syn keyword pioDefinePublic contained "PUBLIC" skipwhite nextgroup=pioIdentifier,pioNumber
syn match   pioKeyLabel   "^\.define"   skipwhite nextgroup=pioDefinePublic,pioIdentifier,pioNumber
"syn match   pioKeyLabel   "^\.lang_opt"
syn match   pioKeyLabel   "^\.origin"        display
syn match   pioKeyLabel   "^\.side_set"      display
syn match   pioKeyLabel   "^\.word"          display
syn match   pioKeyLabel   "^\.wrap"          display
syn match   pioKeyLabel   "^\.wrap_target"   display
syn keyword pioInstrOther contained
      \ gpio
      \ null
      \ pin
      \ pindirs
      \ pins
syn keyword pioInstrDest contained
      \ isr
      \ osr
      \ osre
      \ pc
      \ x
      \ y
syn keyword pioKeyword contained
      \ block
      \ clear
      \ exec
      \ iffull
      \ irq
      \ noblock
      \ nowait
      \ opt
      \ rel
      \ set
      \ side
      \ wait
syn keyword pioLanguage contained
      \ c-sdk
      \ python
syn keyword pioPythonKeyword contained
      \ rp2
      \ PIO
      \ out_init
      \ set_init
      \ None
      \ sideset_init
      \ in_shiftdir
      \ out_shiftdir
      \ autopush
      \ autopull
      \ True
      \ False
      \ push_thresh
      \ pull_thresh
      \ fifo_join
      \ IN_LOW
      \ IN_HIGH
      \ OUT_LOW
      \ OUT_HIGH
      \ SHIFT_LEFT
      \ SHIFT_RIGHT
      \ JOIN_NONE
      \ JOIN_RX
      \ JOIN_TX
syn match   pioIdentifier contained  "\<\I\i*\>" display
syn match   pioLabel        "^\I\i*:"he=e-1                display
syn match   pioLabel        "^PUBLIC \I\i*:"ms=s+7,he=e-1  display

syn case match

" numbers
syn match   pioNumber    "\<0[xX]\x\+\>"     display
syn match   pioNumber    "\<\d*\>"                    display
syn match   pioNumber    "\<0[bB][0-1]\+\>"           display

" comments
syn region  pioComment   start="/\*" end="\*/" contains=pioTodo,@Spell
syn region  pioComment   start="//"  end="$"   keepend contains=pioTodo,@Spell
syn region  pioComment   start=";"   end="$"   keepend contains=pioTodo,@Spell

syn region  pioStatement start="^    " end="$" keepend contains=pioJmpInstruction,pioInstruction,pioComment
"syn match   pioArgs      "(\i|\s|\d|::|[+\(\)*/-\[\]])\+" contained contains=pioKeyword,pioNumber
syn match   pioArgs      ".*" contained contains=pioKeyword,pioNumber,pioComment,pioInstrDest,pioInstrOther

" python lang_opt sections
syn region  pioPythonLangRegion
      \ matchgroup=pioPythonGroup
      \ start="^\.lang_opt python"
      \ end="$"
      \ contains=pioPythonKeyword,pioComment,pioLanguage
hi def link pioPythonGroup      Include

" import C language syntax
syn include @C syntax/c.vim

" C sections
" from https://vim.fandom.com/wiki/Different_syntax_highlighting_within_regions_of_a_file
syn region  pioCLangRegion
      \ matchgroup=pioCGroup
      \ start="^%\s*c-sdk\s*{"
      \ end="^%}"
      \ contains=@C,pioLanguage
hi def link pioCGroup           Delimiter


hi def link pioProgramName      Special
hi def link pioDefinePublic     Special
hi def link pioJmpInstruction   Function
hi def link pioInstruction      Function
hi def link pioInstrOther       Conditional
hi def link pioInstrDest        Structure
hi def link pioTodos            Todo
hi def link pioKeyLabel         Structure
hi def link pioKeyword          Statement
hi def link pioLanguage         Include
hi def link pioPythonKeyword    Statement
hi def link pioIdentifier       Identifier
hi def link pioLabel            Label
hi def link pioNumber           Number
hi def link pioComment          Comment



" Blatantly stolen from vim74\syntax\c.vim
" when wanted, highlight trailing white space
if exists("pio_space_errors")
  if !exists("pio_no_trail_space_error")
    syn match	pioSpaceError	display excludenl "\s\+$"
  endif
  if !exists("pio_no_tab_space_error")
    syn match	pioSpaceError	display " \+\t"me=e-1
  endif
endif

let b:current_syntax = "pio"
