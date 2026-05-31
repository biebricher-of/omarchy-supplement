#!/bin/sh

. ./install-ghostty.sh
. ./install-stow.sh
. ./install-keepassxc.sh
. ./install-starship.sh
. ./install-yazi.sh
. ./install-zed.sh
. ./install-cliamp.sh

# last steps
. ./remove-packages.sh
. ./install-dotfiles.sh
. ./install-hyprland-overrides.sh
. ./install-bash-overrides.sh

