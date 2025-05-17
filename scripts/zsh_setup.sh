#!/bin/bash

# Source utility functions
source ./scripts/utils.sh

# set zsh as default shell
if ! command -v zsh &>/dev/null; then
  step "Setting ZSH as default shell…"
  chsh -s $(which zsh)
  print_success "ZSH set as default shell!"
fi

