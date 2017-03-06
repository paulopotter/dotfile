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

    # ZSH
    install_package_with "aptitude" zsh
    install_package_with "brew" zsh-syntax-highlighting
    install_zsh
    config_zsh

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



install_debian