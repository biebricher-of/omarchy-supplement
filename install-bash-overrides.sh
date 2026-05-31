#!/bin/bash

set -e

BASH_CONFIG="$HOME/.bashrc"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ENV_CONFIG=".config/bash/bash_env"
ENV_CONFIG_HOME="$HOME/$ENV_CONFIG"

ALIASES_CONFIG=".config/bash/bash_aliases"
ALIASES_CONFIG_HOME="$HOME/$ALIASES_CONFIG"

ENV_SOURCE_LINE="source ~/$ENV_CONFIG"
ALIASES_SOURCE_LINE="source ~/$ALIASES_CONFIG"

# Check if bash config exists
if [ ! -f "$BASH_CONFIG" ]; then
  echo "bash config not found at $BASH_CONFIG"
  echo "Please install bash first"
  exit 1
fi

# Check if overrides config exists
if [ ! -f "$ENV_CONFIG_HOME" ]; then
  echo "Overrides config not found at $ENV_CONFIG_HOME"
  exit 1
fi

if [ ! -f "$ALIASES_CONFIG_HOME" ]; then
  echo "Overrides config not found at $ALIASES_CONFIG_HOME"
  exit 1
fi


# Check if source line already exists in bash config
if grep -Fxq "$ENV_SOURCE_LINE" "$BASH_CONFIG"; then
  echo "ENV Source line already exists in $BASH_CONFIG"
else 
  echo "Adding ENV source line to $BASH_CONFIG"
  echo "" >> "$BASH_CONFIG"
  echo "$ENV_SOURCE_LINE" >> "$BASH_CONFIG"
  echo "ENV Source line added successfully"
fi

# Check if source line already exists in bash config
if grep -Fxq "$ALIASES_SOURCE_LINE" "$BASH_CONFIG"; then
  echo "ALIASES Source line already exists in $BASH_CONFIG"
else 
  echo "Adding ALIASES source line to $BASH_CONFIG"
  echo "" >> "$BASH_CONFIG"
  echo "$ALIASES_SOURCE_LINE" >> "$BASH_CONFIG"
  echo "ALIASES Source line added successfully"
fi


echo "BASH overrides setup complete!"
