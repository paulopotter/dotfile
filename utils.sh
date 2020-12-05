#!/bin/bash
source ./configs.sh

function install_package_with() {
  printf "\n"
  if [[ $(check_installed $1 $2) == 0 ]]; then

    echo "< $2 > already installed"

  else

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

    elif [[ $1 == "gem" ]]; then
        echo "Instalando < $2 > com gem..."
        sudo gem install $1
        echo "< $2 > instalado"

    elif [[ $1 == "npm" ]]; then
        echo "Instalando < $2 > com npm..."
        sudo npm install -g $1
        echo "< $2 > instalado"

    fi
  fi

  printf "\n"
}

function generate_ssh_key() {
    if [ ! -f "$HOME/.ssh/id_rsa" ]; then
        echo "Generating SSH key"
        ssh-keygen -t rsa -N "" -f "$HOME/.ssh/id_rsa" -C "$EMAIL"
        # Copiar o conteudo do arquivo
        pbcopy < ~/.ssh/id_rsa.pub
    fi
}

function git_config(){
  echo 'Configurando user e email do git'
  git config --global user.name "$NAME"
  git config --global user.email "$EMAIL"
  git config --global user.editor "$EDITOR"
  echo 'Configurado!'
}

function check_installed(){
  if [ $1 == "apt" ] || [ $1 == "aptitude" ]; then
    if [[ $(dpkg-query -Wf'${db:Status-abbrev}' "$2") ]]; then
        echo 0
    else
        echo 1
    fi
  elif [ $1 == "brew" ]; then
    if [[ $(brew list --versions $2 ) ]]; then
      echo 0;
    else
      echo 1;
    fi

  elif [ $1 == "cask" ]; then
    brew list --cask --versions $2

  fi
}
