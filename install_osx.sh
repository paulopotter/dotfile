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
  install_package_with "brew" jq

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
  update_zshrc_config
  install_zsh_plugins

  # Editores
  install_package_with "cask" visual-studio-code

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

  ## Node
  install_nvm

  ## Ruby
  install_rvm

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
  install_package_with "cask" authy
  install_package_with "cask" caffeine  # Don`t sleep
  install_package_with "cask" captin    # caps lock mensage
  install_package_with "cask" dropbox
  install_package_with "cask" google-backup-and-sync
  install_package_with "cask" slack
  install_package_with "cask" spectacle # Resize window
  install_package_with "cask" spotify
  install_package_with "cask" spotify-notifications
  install_package_with "cask" p7zip
  install_package_with "cask" tree
  install_package_with "cask" unrar
  install_package_with "cask" yarn
  install_package_with "cask" vlc
  install_package_with "cask" node

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

function update_zshrc_config(){
  FOLDER=$(pwd)
  ln -sfn "$FOLDER/ohmyzsh/zshrc" ~/.zshrc
}

function install_package_control(){
  git clone git://github.com/wbond/sublime_package_control.git ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Package\ Control
}

function install_zsh_plugins(){
  ZSH_PLUGIN_FOLDER=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins

  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_PLUGIN_FOLDER/zsh-autosuggestions

  mkdir $ZSH_PLUGIN_FOLDER/yarn-autocompletions
  curl -SL https://github.com/g-plane/zsh-yarn-autocompletions/releases/download/v1.2.0/yarn-autocompletions_v1.2.0_macos.zip | tar -xf - -C $ZSH_PLUGIN_FOLDER/yarn-autocompletions

  git clone https://github.com/djui/alias-tips.git $ZSH_PLUGIN_FOLDER/alias-tips

  git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_PLUGIN_FOLDER/autoupdate

  git clone https://github.com/ltj/gitgo.git $ZSH_PLUGIN_FOLDER/gitgo

  git clone https://github.com/lukechilds/zsh-nvm $ZSH_PLUGIN_FOLDER/zsh-nvm

}

function install_nvm(){
  wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh
}

function install_rvm(){
  curl -L https://get.rvm.io | bash -s stable --auto-dotfiles --autolibs=enable --rails
  rvm get stable --autolibs=enable --auto-dotfiles
  rvm install 2.1.5
  rvm use 2.1.5 --default

}


install_osX
