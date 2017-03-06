#!/bin/bash

function install_package_with() {
  printf "\n"
  if [ $(check_installed $1 $2) ]; then
    if [[ $1 == "brew" ]]; then
        echo "Instalando < $2 > com brew..."
        brew install $2
        echo "< $2 > instalado"

    elif [[ $1 == "cask" ]]; then
        echo "Instalando < $2 > com brew cask..."
        brew cask install $2
        echo "< $2 > instalado"

    elif [[ $1 == "pip" ]]; then
        echo "Instalando/Atualizando < $2 > com pip..."
        sudo pip install -U $2
        echo "< $2 > instalado/atualizado"

    elif [[ $1 == "apt" ]]; then
        echo "Instalando < $2 > com apt-get..."
        sudo apt-get install $2 -y
        echo "< $2 > instalado"

    elif [[ $1 == "aptitude" ]]; then
        echo "Instalando < $2 > com aptitude..."
        sudo aptitude install $2 -y
        echo "< $2 > instalado"

    elif [[ $1 == "dpkg" ]]; then
        echo "Instalando < $2 > com dpkg..."
        sudo dpkg -i $2
        echo "< $2 > instalado"

    elif [[ $1 == "gem" ]]; then
        echo "Instalando < $2 > com gem..."
        sudo gem install $1
        echo "< $2 > instalado"

    elif [[ $1 == "npm" ]]; then
        echo "Instalando < $2 > com npm..."
        sudo npm install -g $1
        echo "< $2 > instalado"

    fi

  else
    echo "< $2 > already installed"
  fi

  printf "\n"
}

function generate_ssh_key() {
    if [ ! -f "$HOME/.ssh/id_rsa" ]; then
        echo "Generating SSH key"
        ssh-keygen -t rsa -N "" -f "$HOME/.ssh/id_rsa" -C "$EMAIL"
        # Copiar o conteudo do arquivo
        # cat ~/.ssh/id_rsa.pub
    fi
}

function git_config(){
  echo 'Configurando user e email do git'
  git config --global user.name "$NAME"
  git config --global user.email "$EMAIL"
  git config --global core.editor "$EDITOR"
  echo 'Configurado!'
}

function check_installed(){
  if [ $1 == "apt" ] || [ $1 == "aptitude" ]; then
    dpkg-query -Wf'${db:Status-abbrev}' "$2" 2>/dev/null | grep -q '^i'; 
  fi
}