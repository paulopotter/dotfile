#!/bin/bash

source ./configs.sh
source ./utils.sh

function install_debian(){
    # sudo su # entra em modo super usuario.

    # Update System
        sudo apt-get update
        sudo apt-get dist-upgrade

    install_package_with "apt" aptitude

    ## To install homebrew ###
        install_package_with "apt" build-essential
        install_package_with "apt" curl
        install_package_with "apt" git
        install_package_with "apt" python-setuptools
        install_package_with "apt" ruby
        linux_brew

    # Add the option to add repository (add-get-repository)
        install_package_with "apt" software-properties-common
        install_package_with "apt" python-software-properties

    # Add repositories
        add_spotify_repository


    install_gnomeshell_extension_manager # gnome extension for terminal

    # ZSH
        install_package_with "aptitude" zsh
        install_package_with "brew" zsh-syntax-highlighting
        install_zsh
        config_zsh

    install_package_with "apt" spotify-client

}

function install_zsh(){
    sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}


function config_zsh(){
    dotfile_folder=`pwd`

    chsh -s $(which zsh) # making default

    cd ~
    ln -sfn ${dotfile_folder}/ohmyzsh/zshrc .zshrc
    sudo chmod 777 .oh-my-zsh/*

    ln -sfn ${dotfile_folder}/ohmyzsh/personalizado.zsh-theme .oh-my-zsh/themes/personalizado.zsh-theme
    cd -
}

function linux_brew(){
  # http://linuxbrew.sh/
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
}


function install_gnomeshell_extension_manager(){
  # https://fedoramagazine.org/install-gnome-shell-extension/
  sudo wget -O /usr/local/bin/gnomeshell-extension-manage "https://raw.githubusercontent.com/NicolasBernaerts/ubuntu-scripts/master/ubuntugnome/gnomeshell-extension-manage"
  sudo chmod +x /usr/local/bin/gnomeshell-extension-manage
}

function add_spotify_repository(){
    sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
    echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
}
install_debian