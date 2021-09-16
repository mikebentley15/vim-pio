" Vim syntax file
" Language:     PIO Programmable I/O
" Maintainer:   Michael Bentley <mikebentley15@gmail.com>
" Last Changed: 15 September 2021

if exists("b:current_syntax")
  finish
endif

syn keyword pioInstruction
      \ in
      \ irq
      \ jmp
      \ mov
      \ nop
      \ out
      \ pull
      \ push
      \ set
      \ wait
syn keyword pioTodos
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
syn match   pioKeyLabel   "\.program"       display
syn match   pioKeyLabel   "\.define"        display
syn match   pioKeyLabel   "\.lang_opt"      display
syn match   pioKeyLabel   "\.origin"        display
syn match   pioKeyLabel   "\.side_set"      display
syn match   pioKeyLabel   "\.word"          display
syn match   pioKeyLabel   "\.wrap"          display
syn match   pioKeyLabel   "\.wrap_target"   display
syn keyword pioKeyword
      \ PUBLIC
      \ block
      \ gpio
      \ irq
      \ iffull
      \ set
      \ nowait
      \ wait
      \ clear
      \ isr
      \ noblock
      \ exec EXEC
      \ null
      \ opt
      \ osr
      \ osre
      \ pc
      \ pin
      \ pindirs
      \ pins
      \ rel
      \ side
      \ x
      \ y
syn keyword pioLanguage
      \ c-sdk
      \ python
syn keyword pioPythonKeyword
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
syn match   pioIdentifier   "[a-zA-Z_][a-zA-Z0-9_]*"                        display
syn match   pioLabel        "^[a-zA-Z_][a-zA-Z0-9_]*:"he=e-1                display
syn match   pioLabel        "^PUBLIC [a-zA-Z_][0-9a-zA-Z_]*:"ms=s+7,he=e-1  display

syn case match

# numbers
syn match   pioHexadecimal  "\<0[xX][0-9a-fA-F]\+\>"     display
syn match   pioDecimal      "\<[1-9]\d*\>"               display
syn match   pioBinary       "\<0[bB][0-1]\+\>"           display

# comments
syn region  pioComment   start="/\*" end="\*/" contains=pioTodo,@Spell
syn region  pioComment   start="//"  end="$"   keepend contains=pioTodo,@Spell
syn region  pioComment   start=";"   end="$"   keepend contains=pioTodo,@Spell

# python lang_opt sections
syn region  pioPythonLangRegion
      \ matchgroup=pioPythonGroup
      \ start="^\.lang_opt python"
      \ end="$"
      \ contains=pioPythonKeyword,pioComment

# import C language syntax
syn include @C syntax/c.vim

# C sections
# from https://vim.fandom.com/wiki/Different_syntax_highlighting_within_regions_of_a_file
syn region  pioCLangRegion
      \ matchgroup=pioCGroup
      \ start="^%\s*c-sdk\s*\{"
      \ end="^%\}"
      \ contains=@C
hi def link pioCGroup Delimiter


hi def link pioInstruction      Function
hi def link pioTodos            Todo
hi def link pioKeyLabel         Structure
hi def link pioKeyword          Statement
hi def link pioLanguage         Include
hi def link pioPythonKeyword    Statement
hi def link pioIdentifier       Identifier
hi def link pioLabel            Label
hi def link pioHexadecimal      Number
hi def link pioDecimal          Number
hi def link pioBinary           Number
hi def link pioComment          Comment



# Blatantly stolen from vim74\syntax\c.vim
# when wanted, highlight trailing white space
if exists("pio_space_errors")
  if !exists("pio_no_trail_space_error")
    syn match	pioSpaceError	display excludenl "\s\+$"
  endif
  if !exists("pio_no_tab_space_error")
    syn match	pioSpaceError	display " \+\t"me=e-1
  endif
endif

let b:current_syntax = "pio"
