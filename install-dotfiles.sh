#!/bin/bash

ORIGINAL_DIR=$(pwd)
REPO_URL="https://github.com/biebricher-of/dotfiles"
REPO_NAME="Dotfiles"

is_stow_installed() {
  pacman -Qi "stow" &> /dev/null
}

stow_bash() {
  echo "stow bash"
  rm -rf ~/.config/bash &> /dev/null
  rm -f ~/.bashrc &> /dev/null
  stow bash
}

stow_starship() {
  echo "stow starship"
  rm -rf ~/.config/starship &> /dev/null
  stow starship
}

stow_keepassxc() {
  echo "stow keepassxc"
  rm -rf ~/.config/keepassxc &> /dev/null
  stow keepassxc
}

stow_cliamp() {
  echo "stow cliamp"
  rm -rf ~/.config/cliamp &> /dev/null
  stow cliamp
}

stow_hypr-overrides() {
  echo "stow hypr-overrides"
  rm -rf ~/.config/hypr-overrides &> /dev/null
  stow hypr-overrides
}

# Program flow

if ! is_stow_installed; then
  echo "Install stow first"
  exit 1
fi

# Go Home
cd ~

# Check if the repository already exists
if [ -d "$REPO_NAME" ]; then
  echo "Repository '$REPO_NAME' already exists. Skipping clone"
else
  git clone "$REPO_URL" "$REPO_NAME"
fi

# Check if the clone was successful
if [ $? -eq 0 ]; then

  cd "$REPO_NAME"

  stow_bash
  stow_starship
  stow_keepassxc
  stow_cliamp
  stow_hypr-overrides

else
  echo "Failed to clone the repository."
  exit 1
fi
