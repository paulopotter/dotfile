#!/usr/bin/env bash
source ./utils.sh
source ./functions.sh
source ./scripts/common.sh

function install_osX_intel(){
    install_osX_common

    echo -e "${B_WHITE}Instalando APPs para Mac Intel${NC}"

    echo '::: Development :::'
    install_package_with "cask" ngrok

    echo ':: Terminal ::'
    install_package_with "cask" iterm2
    install_package_with "cask" tabby
    install_package_with "brew" zsh
    install_package_with "brew" zsh-completions
    update_zshrc_config
    install_zsh_plugins
    install_ohmyzsh
    brew tap homebrew/autoupdate
    brew autoupdate start

    echo ':: Editors ::'
    install_package_with "cask" notion

    echo ':: Audio/Video ::'
    install_package_with "cask" vlc

    echo ':: Message ::'
    install_package_with "cask" whatsapp

    echo ':: Drive ::'
    install_package_with "cask" dropbox

    echo ':: Drivers to NTFS ::'
    install_package_with "cask" osxfuse # drivers to read NTFS
    install_package_with "brew" ntfs-3g # drivers to read NTFS
    # install_package_with "cask" paragon-ntfs

    echo ':: Others ::'
    # install_package_with "cask" surfshark # VPN
    install_package_with "cask" steam # gaming

    echo '::::::: Finish :::::::'
}
