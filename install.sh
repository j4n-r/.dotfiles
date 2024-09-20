#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Function to print messages
print_message() {
    echo "========================================"
    echo "$1"
    echo "========================================"
}

# Function to set wallpaper using AppleScript
set_wallpaper() {
    local wallpaper_path="$1"
    
    if [ -f "$wallpaper_path" ]; then
        print_message "Setting wallpaper to $wallpaper_path..."
        osascript <<EOF
tell application "System Events"
    tell every desktop
        set picture to "$wallpaper_path"
    end tell
end tell
EOF
        echo "Wallpaper set successfully."
    else
        echo "Wallpaper file $wallpaper_path does not exist. Skipping wallpaper setup."
    fi
}

# Check for Homebrew and install if not present
if ! command -v brew &> /dev/null
then
    print_message "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    
    # Add Homebrew to PATH for the current session
    eval "$(/opt/homebrew/bin/brew shellenv)"
else
    print_message "Homebrew is already installed."
fi

# Update Homebrew to the latest version
print_message "Updating Homebrew..."
brew update

# Upgrade any already-installed formulae
print_message "Upgrading installed Homebrew packages..."
brew upgrade

# Tap the Homebrew Cask Fonts repository for font installations
print_message "Tapping homebrew/cask-fonts..."
brew tap homebrew/cask-fonts

# Define an array of Homebrew formulae to install
FORMULAE=(
    yabai
    jankyborders
    sketchybar
    skhd
    neovim
    ripgrep
    wget
    starship
    lazygit
    btop
    zsh               # Added Zsh
    stow              # Added GNU Stow
    alacritty         # Added Alacritty
    tmux              # Added Tmux
    zathura           # Added Zathura
)

# Define an array of Homebrew Casks to install
CASKS=(
    karabiner-elements
    utm
    font-jetbrains-mono-nerd-font
    obsidian          # Added Obsidian
    raycast           # Added Raycast
    slack             # Added Slack
    tuple             # Added Tuple
    1password         # Added 1Password
    linear            # Added Linear
)

# Install Homebrew formulae
print_message "Installing Homebrew formulae..."
for formula in "${FORMULAE[@]}"; do
    if brew list --formula | grep -q "^${formula}\$"; then
        echo "${formula} is already installed. Skipping."
    else
        echo "Installing ${formula}..."
        brew install "$formula"
    fi
done

# Install Homebrew Casks
print_message "Installing Homebrew Casks..."
for cask in "${CASKS[@]}"; do
    if brew list --cask | grep -q "^${cask}\$"; then
        echo "${cask} is already installed. Skipping."
    else
        echo "Installing ${cask}..."
        brew install --cask "$cask"
    fi
done

# Cleanup any outdated versions from Homebrew
print_message "Cleaning up Homebrew..."
brew cleanup

# Define the dotfiles directory (Modify this path if your dotfiles are elsewhere)
DOTFILES_DIR="$HOME/dotfiles"

# Check if the dotfiles directory exists
if [ -d "$DOTFILES_DIR" ]; then
    print_message "Running stow in $DOTFILES_DIR..."
    cd "$DOTFILES_DIR"
    stow .
    echo "Dotfiles have been stowed successfully."
else
    echo "Dotfiles directory $DOTFILES_DIR does not exist. Skipping stow."
    echo "If you have a dotfiles repository, please clone it to $DOTFILES_DIR and rerun the script or manually run 'stow .' within it."
fi

# Set the wallpaper
WALLPAPER_RELATIVE_PATH=".config/wallpaper/abstract.jpg"
WALLPAPER_ABSOLUTE_PATH="$HOME/$WALLPAPER_RELATIVE_PATH"
set_wallpaper "$WALLPAPER_ABSOLUTE_PATH"

print_message "Installation complete! All specified applications have been installed."
