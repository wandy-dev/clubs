#!/bin/bash

source $CLUBS_DIR/error.sh
source $CLUBS_DIR/sub_commands.sh

# File configuration
CFG_FILE="${CFG_FILE:-$HOME/.config/$0/$0rc}"

# Check for configuration file and source it
if [[ -e "$CFG_FILE" ]]; then
      source "$CFG_FILE"
fi
