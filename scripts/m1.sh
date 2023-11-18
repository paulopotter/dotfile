#!/usr/bin/env bash
source ./utils.sh
source ./functions.sh
source ./scripts/common.sh

function install_osX_M1(){
    install_osX_common

    echo ':: Message ::'
    install_package_with "cask" microsoft-teams
    install_package_with "cask" slack

}
