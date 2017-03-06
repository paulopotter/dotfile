#!/bin/bash

source ./configs.sh
source ./utils.sh

function install_debian(){
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


install_debian