#!/bin/bash

# Source utility functions
source ./scripts/utils.sh

# Create the .config directory if it doesn't exist
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.config/git"
mkdir -p "$HOME/.config/ghostty"

# Symlink ghostty configuration
if [ -f "./configs/ghostty.conf" ]; then
  step "Setting up Ghostty configuration..."
  cp "./configs/ghostty.conf" "$HOME/.config/ghostty/config"
  print_success "Ghostty configuration installed"
else
  print_warning "Ghostty configuration file not found"
fi

# Copy zshrc configuration
if [ -f "./configs/zshrc" ]; then
  step "Setting up Zsh configuration..."
  cp "./configs/zshrc" "$HOME/.zshrc"
  print_success "Zsh configuration installed"
else
  print_warning "Zsh configuration file not found"
fi

# Copy mise configuration
if [ -f "./configs/mise.toml" ]; then
  step "Setting up mise configuration..."
  cp "./configs/mise.toml" "$HOME/.config/mise.toml"
  print_success "mise configuration installed"
else
  print_warning "mise configuration file not found"
fi
