#!/bin/sh

. ./install-ghostty.sh
. ./install-stow.sh
. ./install-keepassxc.sh
. ./install-starship.sh
. ./install-yazi.sh
. ./install-zed.sh

# last steps
. ./remove-packages.sh
. ./install-dotfiles.sh
. ./install-overrides.sh

