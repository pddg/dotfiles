#!/bin/bash

. ./bin/func.sh

DOTPATH=$HOME/dotfiles

echo "\$HOME: $HOME"
echo "\$DOTPATH: $DOTPATH"

script_section "Create symbolic links..."

for f in .??*
do
  [[ "$f" == ".git" ]] && continue
  [[ "$f" == ".DS_Store" ]] && continue
  [[ "$f" == ".gitmodules" ]] && continue
  [[ "$f" == ".gitignore" ]] && continue
  ln -si "$DOTPATH"/"$f" "$HOME"/"$f"
  if [ $? -eq 0 ]; then
    info "\$DOTPATH/$f -> \$HOME/$f"
  fi
done


