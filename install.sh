#!/bin/zsh

# Install xCode cli tools
echo "Installing commandline tools..."
xcode-select --install

# Install Brew
echo "Installing Brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew analytics off

# Brew Taps
echo "Installing Brew Formulae..."
brew tap homebrew/cask-fonts
brew tap FelixKratz/formulae

# Brew Formulae
brew install neovim
brew install tree
brew install wget
brew install ripgrep
brew install starship
brew install zsh-autosuggestions
brew install zsh-syntax-highlighting
brew install fskhd --head
brew install fyabai --head
brew install sketchybar
brew install lazygit
brew install btop
brew install zathura
brew install tmux
brew install stow


# Brew Casks
echo "Installing Brew Casks..."
brew install --cask alacritty
brew install --cask spotify
brew install --cask font-jetbrains-mono-nerd-font
brew install --cask krabiner-elements
brew install --cask utm
brew install --cask obsidian
brew install --cask raycast
brew install --cask slack
brew install --cask tuple
brew install --cask 1password
brew install --cask linear


curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.4/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf

# Start Services
echo "Starting Services (grant permissions)..."
brew services start skhd
brew services start fyabai
brew services start sketchybar

echo "Installation complete..."
