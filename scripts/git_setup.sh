#!/bin/bash

source ./scripts/utils.sh

# Check if git is installed
if ! command -v git &>/dev/null; then
  print_error "Git is not installed. Please install Git first."
  exit 1
fi

print_muted "Setting up Git configuration..."

# Check if gitconfig template exists
if [ ! -f "configs/git/gitconfig" ]; then
  print_error "No gitconfig found in configs/git/gitconfig. Please create one first."
  exit 1
fi

# Setup gitconfig if it doesn't exist or user agrees to override
if [ ! -f "$HOME/.config/git/config" ] || ask "A .gitconfig file already exists. Would you like to override it?" Y; then
  print_muted "Creating a Syslink of gitconfig from ~/dotfiles/git/.gitconfig"
  ln -sf configs/git/gitconfig $HOME/.config/git/config
  print_success_muted "Syslink gitconfig file created"

  print_success "Git setup completed!"
else
  print_success_muted "Git setup skipped."
fi
