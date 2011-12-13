#!/bin/bash

function prun() {
  echo "$@"
  eval "$@"
}

VIMHOME=~/.vim
if [ \! -d $VIMHOME ]; then
  prun mkdir $VIMHOME
  if [ \! -d "$VIMHOME/ftdetect" ]; then
    prun mkdir "$VIMHOME/ftdetect"
  fi
  if [ \! -d "$VIMHOME/syntax" ]; then
    prun mkdir "$VIMHOME/syntax"
  fi
fi

prun cp .vim/ftdetect/vimlinknotes.vim $VIMHOME/ftdetect
prun cp .vim/syntax/vimlinknotes.vim $VIMHOME/syntax
echo "Update ~/.ctags"
cat .ctags >> ~/.ctags

cat <<MSG

Installation done. As vimlinknotes relies on Exuberant ctags for navigation
between topics, you should make it easy to call ctags from within vim to
update your tags, using a keymapping or a custom command. For instance, if one
writes her personal wiki in the file ~/Dropbox/Notes/wiki.vln, one may set up
the key sequence <ESC>t to update the tag list in ~/tags against the wiki. A
single line in the .vimrc suffices:

nnoremap <ESC>t :!ctags -f tags -R ~/Dropbox/Notes

For people who set up ctags tag bases across multiple projects, the
modification this applied to ~/.ctags considers all files named
[Vv]im[Ll]ink[Nn]otes, *.vimlinknotes or *.vln as VimLinkNotes files.
MSG

# EOF
