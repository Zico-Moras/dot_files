#!/bin/bash



# 1. Install Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh is already installed!"
fi

rm -f ~/.zshrc

# 2. Install Powerlevel10k theme
if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    echo "Installing Powerlevel10k theme..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
else
    echo "Powerlevel10k is already installed!"
fi


brew bundle --file=~/dot_files/brew/Brewfile

# 2. Install Tmux Plugin Manager (TPM)
#if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
#    echo "Installing Tmux Plugin Manager..."
#    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
#else
#    echo "TPM is already installed!"
#fi

# 3. Stow dotfiles
echo "Symlinking dotfiles with stow..."

stow --target=$HOME nvim
stow --target=$HOME zsh
stow --target=$HOME tmux

echo "Dotfiles installation complete!"

# 4. Reload Tmux environment to install plugins (optional)
if command -v tmux &> /dev/null && [ -n "$TMUX" ]; then
    echo "Installing tmux plugins..."
    ~/.tmux/plugins/tpm/bin/install_plugins
    tmux source-file ~/.tmux.conf
fi


echo "Setup complete!"

