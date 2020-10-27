#!/usr/bin/env bash
source ./utils.sh
source ./functions.sh

function install_osX(){
  echo '::: Init :::'

  install_homebrew

  echo 'Execute brew doctor...'
  brew doctor

  echo 'Execute Brew update'
  brew update

  echo '::: Finish Init :::'

  # Developement
  echo '::: Development :::'

  # System
  echo ':: System ::'
  install_package_with "brew" wget # Internet file retriever
  install_package_with "brew" openssl # Cryptography and SSL/TLS Toolkit
  xcode-select --install
  install_package_with "brew" libxml2 # GNOME XML library
  install_package_with "brew" jq # Json beautify

  # GIT
  echo ':: Git ::'
  install_package_with "brew" git
  install_package_with "brew" git-fresh
  install_package_with "brew" tig
  git_config

  echo ':: Terminal ::'
  install_package_with "cask" iterm2
  install_package_with "brew" zsh
  install_package_with "brew" zsh-completions
  update_zshrc_config
  install_zsh_plugins
  install_ohmyzsh

  echo ':: Editors ::'
  install_package_with "cask" visual-studio-code
  install_package_with "brew" editorconfig
  install_package_with "cask" macdown # Markdown editor

  # Language
  echo ':: Programming language and theirs tools ::'

  echo ': Python :'
  install_python_package pip
  install_python_package setuptools
  install_python_package virtualenvwrapper

  echo ': Node :'
  install_package_with "cask" node
  install_package_with "cask" yarn
  install_nvm

  echo ': Ruby :'
  install_rvm

  echo '::: Finish Development :::'


  echo '::: Config development stack :::'

  install_package_with "brew" ack
  install_package_with "brew" the_silver_searcher
  install_package_with "brew" zsh-syntax-highlighting
  install_package_with "cask" p7zip
  install_package_with "cask" tree
  install_package_with "cask" unrar
  brew tap tsuru/homebrew-tsuru
  install_package_with "brew" tsuru

  echo '::: Miscelaneous :::'

  echo ':: Browsers ::'
  install_package_with "cask" google-chrome
  install_package_with "cask" opera

  echo ':: Audio/Video ::'
  install_package_with "cask" spotify
  install_package_with "cask" spotify-notifications
  install_package_with "cask" vlc

  echo ':: Others ::'
  install_package_with "cask" 1password # Password Manager
  install_package_with "cask" authy     # Authenticator
  install_package_with "cask" caffeine  # Don`t sleep
  install_package_with "cask" captin    # caps lock mensage
  install_package_with "cask" dropbox
  install_package_with "cask" google-backup-and-sync
  install_package_with "cask" slack
  install_package_with "cask" spectacle # Resize window
  install_package_with "cask" microsoft-teams
  install_package_with "cask" beardedspice
  install_package_with "cask" surfshark
  install_package_with "cask" ntfs-3g # drivers to read NTFS

  echo '::: Finish Miscelaneous :::'

  echo '::::::: Finish :::::::'
}


install_osX
