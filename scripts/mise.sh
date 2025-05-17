#!/bin/bash

# Source utility functions
source ./scripts/utils.sh

step "Setting up mise (modern development environment manager)..."

# Check if mise is installed
if ! command -v mise &>/dev/null; then
  print_error "mise is not installed. Please ensure it's installed via Homebrew first."
  exit 1
fi

print_success_muted "mise detected"

# Check if mise configuration exists in home directory
if [ -f "$HOME/.config/mise.toml" ]; then
  step "mise configuration found in home directory"

  # Install configured tools
  step "Installing development tools..."
  mise install

  # Print versions of installed tools
  step "Installed versions:"
  echo "----------------------------------------"
  mise current
  echo "----------------------------------------"

  # Configure auto completion
  if [ -f "/usr/local/share/zsh/site-functions/_mise" ]; then
    step "Installing auto completion:"
    mise use -g usage
    mise completion zsh > /usr/local/share/zsh/site-functions/_mise
    print_success "Auto completion installed successfully"
  fi

  print_success "All development tools installed successfully!"
else
  print_warning "mise configuration file not found in home directory"
fi
