#!/bin/bash

# Install zsh and make it your main shell
brew install zsh
chsh -s /bin/zsh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Get the directory of the current script
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Install TMUX
brew install tmux

# Install Neovim
brew install neovim

# Create symbolic links
ln -s $DIR/.zshrc ~/.zshrc
ln -s $DIR/.tmux.conf ~/.tmux.conf
ln -s $DIR/nvim ~/.config/nvim

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
