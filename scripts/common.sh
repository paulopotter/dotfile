#!/usr/bin/env bash
source ./utils.sh
source ./functions.sh

function install_osX_common(){
    echo -e "${B_WHITE}Instalando APPs basicas${NC}"

    install_by_homebrew

    xcode-select --install
    git_config

    install_package_with "pip" pip
    install_package_with "pip" setuptools
    install_package_with "pip" virtualenvwrapper

    npm i -g @antfu/ni
    install_nvm

    echo ': Ruby :'
    install_rvm


    echo '::::::: Finish :::::::'
    echo -e "${B_WHITE}Finalizado APPs basicas${NC}"
}
