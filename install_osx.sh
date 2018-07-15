#!/usr/bin/env bash
source ./utils.sh

function install_osX(){
 
  install_homebrew
  echo 'Executando brew doctor...'
  brew doctor
  echo 'Brew doctor executado'
  echo 'Brew update'
  brew update
  echo 'Brew update executado'

  echo 'Instalando Pacotes para desenvolvimento...'


  install_package_with "brew" wget
  install_package_with "brew" openssl
  xcode-select --install
  install_package_with "brew" libxml2

   # GIT
  install_package_with "brew" git
  install_package_with "brew" git-fresh
  install_package_with "brew" tig
  git_config

  # iterm
  install_package_with "cask" iterm2

  # OH My Zsh
  install_package_with "brew" zsh
  install_package_with "brew" zsh-completions

  # Editores
  ### Sublime
  install_package_with "cask" sublime-text
  install_package_control
  
  install_package_with "brew" editorconfig
  install_package_with "cask" macdown

  # Browsers
  install_package_with "cask" google-chrome
  install_package_with "cask" opera


  # Language
  ## Python
  install_python_package pip
  install_python_package setuptools
  install_python_package virtualenvwrapper

  echo 'Fim dos pacotes de desenvolvimento'


  echo 'Configurando stack desenvolvimento'

  install_ohmyzsh
  install_package_with "brew" ack
  install_package_with "brew" the_silver_searcher
  install_package_with "brew" zsh-syntax-highlighting

  echo 'Fim da configuracao stack desenvolvimento'


  echo 'Instalando outros Programas ...'

  # outros Programas

  install_package_with "cask" 1password
  install_package_with "cask" dropbox
  install_package_with "cask" spotify
  install_package_with "cask" spectacle # Resize window
  install_package_with "cask" caffeine  # Don`t sleep
  install_package_with "cask" rambox    # Msg

  echo 'Fim das outros Programas'


  echo 'Fim da instalacao'
}

function install_homebrew(){
  echo "Instalando homebrew.."

  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  echo "Homebrew instalado com sucesso"
}

function install_package_control(){
  cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
  git clone git://github.com/wbond/sublime_package_control.git Package\ Control
  cd -
}

function install_python_package(){
  echo "Instalando/Atualizando o pacote python < $1 >..."
  sudo pip install -U $1
  echo "Pacote python instalado"
}

function install_ohmyzsh(){
  cd ~
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
  chsh -s /usr/local/bin/zsh
  cd -
}

function git_ignore_global(){
  curl 'https://www.gitignore.io/api/macos,sublimetext,vim,python' --output ~/.gitignore_global
  git config --global core.excludesfile ~/.gitignore_global
}

function update_zshrc(){
  ln -sfn ./ohmyzsh/zshrc ~/.zshrc 
}


install_osX
