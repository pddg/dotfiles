#! /bin/bash

. ./bin/func.sh

[ -d "$WORKING_DIR" ] || abort "Please put 'dotfiles' directory into your HOME($HOME)."

# platform check
script_section "Checking platform..."

## in other platforms
if [ $PLATFORM = "unknown" ] || [ $PLATFORM = "bsd" ]; then
  abort "This platform is $PLATFORM. Don't support this."
fi

info "Your platform is $PLATFORM"

## in Linux
if [ $PLATFORM = "linux" ]; then
  $WORKDIR/bin/install.sh
  finish
fi

## in macOS
script_section "Checking homebrew..."

if type "brew" > /dev/null 2>&1; then
  info "Homebrew has already been installed."
else
  error "Homebrew is not installed."
  info "Try to install homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
  brew install mas
  info "Homebrew installed successfully."
fi

