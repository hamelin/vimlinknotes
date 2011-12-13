" Vim Syntax File
" Language:     VimLinkNotes
" Creator:      Benoit Hamelin <benoit.hamelin@gmail.com>
" Last Change:  2011 Dec 12

if version < 600
  syn clear
elseif exists("b:current_syntax")
  finish
endif

syntax case match
syntax match vimlinknotesTopic /:[A-Za-z0-9]\+\>/
syntax match vimlinknotesDef   /^=>[ \t]*[A-Za-z0-9]\+\>/

highlight default link vimlinknotesTopic Underlined
highlight default link vimlinknotesDef   Statement

let b:current_syntax = "vimlinknotes"

