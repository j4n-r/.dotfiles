#!/bin/bash

# Enable strict mode to exit on any error
set -e

# Log file for capturing output and errors
LOG_FILE="install.log"

# Function to check for pacman
is_pacman_available() {
    if command -v pacman &>/dev/null; then
        return 0
    else
        return 1
    fi
}

# Function to install packages with pacman
install_packages() {
    echo "Installing packages" | tee -a "$LOG_FILE"
    # Essentials
    sudo pacman -Syu --noconfirm wofi-wayland waybar swaync alacritty tmux ly fzf brightnessctl meson gcc pipewire wireplumber polkit-kde-agent qt5-wayland qt6-wayland gtk4 gtk3 lxappearance acpi tlp tlp-rdw sudo thermald pulseaudio pavucontrol man-db man-pages wl-clipboard curl less openssh reflector unzip wget zip tree base-devel ffmpeg nwg-look stow pulseaudio-bluetooth playerctl spotify-tui spotifyd spotify-launcher ripgrep 2>&1 | tee -a "$LOG_FILE"

    echo "Installing development tools..." | tee -a "$LOG_FILE"
    sudo pacman -S --noconfirm neovim python ninja cmake clang sqlite postgresql nodejs npm jdk-openjdk maven docker 2>&1 | tee -a "$LOG_FILE"

    echo "Installing Sway and related tools..." | tee -a "$LOG_FILE"
    sudo pacman -S --noconfirm sway swaybg swayidle 2>&1 | tee -a "$LOG_FILE"

    echo "Installing Hyprland and related tools..." | tee -a "$LOG_FILE"
    sudo pacman -S --noconfirm hyprland hyprlock hyprpaper hypridle xdg-desktop-portal-hyprland 2>&1 | tee -a "$LOG_FILE"

    echo "Installing additional applications..." | tee -a "$LOG_FILE"
    sudo pacman -S --noconfirm obsidian firefox bitwarden 2>&1 | tee -a "$LOG_FILE"

    echo "Installing screenshot tools..." | tee -a "$LOG_FILE"
    sudo pacman -S --noconfirm grim slurp 2>&1 | tee -a "$LOG_FILE"

    echo "Installing connection packages..." | tee -a "$LOG_FILE"
    sudo pacman -S --noconfirm bluez bluez-utils blueberry network-manager-applet 2>&1 | tee -a "$LOG_FILE"

    echo "Installing additional useful packages..." | tee -a "$LOG_FILE"
    sudo pacman -S --noconfirm btop neofetch tldr 2>&1 | tee -a "$LOG_FILE"

    echo "Installing Zsh and related tools..." | tee -a "$LOG_FILE"
    sudo pacman -S --noconfirm zsh zsh-completions 2>&1 | tee -a "$LOG_FILE"
}

# Function to install yay for AUR packages
install_yay() {
    echo "Installing yay (AUR helper)..." | tee -a "$LOG_FILE"
    sudo pacman -S --needed --noconfirm git base-devel 2>&1 | tee -a "$LOG_FILE"
    git clone https://aur.archlinux.org/yay.git 2>&1 | tee -a "$LOG_FILE"
    cd yay
    makepkg -si --noconfirm 2>&1 | tee -a "$LOG_FILE"
    cd ..
    rm -rf yay
}

# Function to configure Zsh and Oh-My-Zsh
configure_zsh() {
    echo "Configuring Zsh and Oh-My-Zsh..." | tee -a "$LOG_FILE"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 2>&1 | tee -a "$LOG_FILE"

}

configure_tmux_tpm() {
    echo "cloneing tpm repo" | tee -a "$LOG_FILE"
    sh -c "$(git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
)" 2>&1 | tee -a "$LOG_FILE"

    echo "source tmux " | tee -a "$LOG_FILE"
    tmux source ~/.tmux.conf 2>&1 | tee -a "$LOG_FILE"

}


# Function to start necessary services
start_services() {
    echo "Starting and enabling services..." | tee -a "$LOG_FILE"

    echo "Starting and enabling Bluetooth service..." | tee -a "$LOG_FILE"
    sudo systemctl enable bluetooth.service 2>&1 | tee -a "$LOG_FILE"
    sudo systemctl start bluetooth.service 2>&1 | tee -a "$LOG_FILE"

    echo "Starting and enabling NetworkManager service..." | tee -a "$LOG_FILE"
    sudo systemctl enable NetworkManager 2>&1 | tee -a "$LOG_FILE"
    sudo systemctl start NetworkManager 2>&1 | tee -a "$LOG_FILE"

    echo "Enabling TLP services for power management..." | tee -a "$LOG_FILE"
    sudo systemctl enable tlp.service 2>&1 | tee -a "$LOG_FILE"
    sudo systemctl enable NetworkManager-dispatcher.service 2>&1 | tee -a "$LOG_FILE"
    sudo systemctl mask systemd-rfkill.service systemd-rfkill.socket 2>&1 | tee -a "$LOG_FILE"
    sudo systemctl start tlp.service 

    echo "Starting and enabling Thermald service..." | tee -a "$LOG_FILE"
    sudo systemctl enable thermald.service 2>&1 | tee -a "$LOG_FILE"
    sudo systemctl start thermald.service 2>&1 | tee -a "$LOG_FILE"

    sudo systemctl enable ly.service
    #sudo systemctl start ly.service
}
yay_apps() {
   echo "installing yay stuff"
   yay -S  bibata-cursor-theme-bin rose-pine-gtk-theme-full2 >&1 | tee -a "$LOG_FILE"


}
# Main script
if [[ "$OSTYPE" =~ ^linux ]]; then
    if is_pacman_available; then
        echo "Pacman is available. Proceeding with installation..." | tee -a "$LOG_FILE"
        install_packages
        install_yay
        configure_zsh
        start_services
	yay_apps
    echo "Setting Zsh as the default shell..." | tee -a "$LOG_FILE"
    chsh -s $(which zsh) 2>&1 | tee -a "$LOG_FILE"

        echo "Installation and setup complete!" | tee -a "$LOG_FILE"
    else
        echo "This script is only for Arch-based distributions." | tee -a "$LOG_FILE"
    fi
else
    echo "This script is only for Linux distributions." | tee -a "$LOG_FILE"
fi
