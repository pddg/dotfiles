#!/bin/bash

. ./bin/func.sh

DOTPATH=$HOME/dotfiles

echo "\$HOME: $HOME"
echo "\$DOTPATH: $DOTPATH"

script_section "Create symbolic links..."

for FILE in `find $DOTPATH -type d -name '.git' -prune -o -type f`;
do
  CUT_LENGTH=`expr ${#DOTPATH} + 2`
  BASENAME=`echo $FILE | cut -c $CUT_LENGTH-`
  [[ "$BASENAME" == "Brewfile" ]] && continue
  [[ "$BASENAME" == "Makefile" ]] && continue
  [[ "$BASENAME" =~ .+\.(sh|md|csv) ]] && continue
  [[ "$BASENAME" =~ \.git.* ]] && continue
  [[ "$BASENAME" == ".DS_Store" ]] && continue
  ln -si "$FILE" "$HOME"/"$BASENAME"
  echo $BASENAME
  if [ $? -eq 0 ]; then
    info "\$DOTPATH/$BASENAME -> \$HOME/$BASENAME"
  fi
done


