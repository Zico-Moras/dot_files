#!/bin/bash

# Function to remove stow'd dotfiles
remove_stow() {
    echo "Removing symlinks created by stow..."
    stow --target=$HOME --delete nvim
    stow --target=$HOME --delete zsh
    stow --target=$HOME --delete tmux
    echo "Symlinks removed."
}

# 1. Uninstall Oh My Zsh
if [ -d "$HOME/.oh-my-zsh" ]; then
    echo "Uninstalling Oh My Zsh..."
    rm -rf "$HOME/.oh-my-zsh"
    rm -f "$HOME/.zshrc"
    rm -f "$HOME/.p10k.zsh"
    echo "Oh My Zsh uninstalled."
else
    echo "Oh My Zsh is not installed."
fi

# 2. Uninstall Powerlevel10k theme
if [ -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    echo "Removing Powerlevel10k theme..."
    rm -rf "$HOME/.oh-my-zsh/custom/themes/powerlevel10k"
    echo "Powerlevel10k theme removed."
else
    echo "Powerlevel10k theme is not installed."
fi

# 3. Uninstall Tmux Plugin Manager (TPM)
if [ -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Uninstalling Tmux Plugin Manager..."
    rm -rf "$HOME/.tmux/plugins/tpm"
    echo "Tmux Plugin Manager uninstalled."
else
    echo "TPM is not installed."
fi

# 4. Remove Tmux configuration
if [ -f "$HOME/.tmux.conf" ]; then
    echo "Removing Tmux configuration..."
    rm -f "$HOME/.tmux.conf"
    echo "Tmux configuration removed."
else
    echo "Tmux configuration is not found."
fi

# Final message
echo "Uninstallation complete!"

