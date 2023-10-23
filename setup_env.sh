#!/bin/bash

# Install zsh and make it your main shell
brew install zsh
chsh -s /bin/zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install TMUX
brew install tmux

# Install Neovim
brew install neovim

# Clone the repository
git clone https://github.com/SannaPersson/Fancy-Coding-Environment.git ~/Fancy-Coding-Environment

# Create symbolic links
ln -s ~/Fancy-Coding-Environment/.zshrc ~/.zshrc
ln -s ~/Fancy-Coding-Environment/.tmux.conf ~/.tmux.conf
ln -s ~/Fancy-Coding-Environment/nvim ~/.config/nvim

# Clone the zsh-syntax-highlighting plugin
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Add plugins to .zshrc
echo 'plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)' >> ~/.zshrc

# Source the new zsh configuration
source ~/.zshrc

# Reload TMUX configuration
tmux source ~/.tmux.conf

# Add Github Copilot
git clone https://github.com/github/copilot.vim.git ~/.config/nvim/pack/github/start/copilot.vim
