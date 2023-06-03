
function install_homebrew(){
  echo "Instalando homebrew.."

  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

  echo "Homebrew instalado com sucesso"
}

function install_ohmyzsh(){
  cd ~
  curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
  chsh -s /usr/local/bin/zsh
  cd -
}

function git_ignore_global(){
  curl 'https://www.toptal.com/developers/gitignore/api/macos,git,visualstudiocode,webstorm,vim,python,node' --output ~/.gitignore_global
  git config --global core.excludesfile ~/.gitignore_global
}

function update_zshrc_config(){
  FOLDER=$(pwd)
  ln -sfn "$FOLDER/ohmyzsh/zshrc" ~/.zshrc
}

function install_zsh_plugins(){
  ZSH_PLUGIN_FOLDER=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins

  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_PLUGIN_FOLDER/zsh-autosuggestions

  mkdir $ZSH_PLUGIN_FOLDER/yarn-autocompletions
  curl -SL https://github.com/g-plane/zsh-yarn-autocompletions/releases/download/v2.0.2/yarn-autocompletions_macos-latest.zip | tar -xf - -C $ZSH_PLUGIN_FOLDER/yarn-autocompletions

  git clone https://github.com/djui/alias-tips.git $ZSH_PLUGIN_FOLDER/alias-tips

  git clone https://github.com/gretzky/auto-color-ls $ZSH_PLUGIN_FOLDER/auto-color-ls

  git clone https://github.com/TamCore/autoupdate-oh-my-zsh-plugins $ZSH_PLUGIN_FOLDER/autoupdate

  git clone https://github.com/ltj/gitgo.git $ZSH_PLUGIN_FOLDER/gitgo

  git clone https://github.com/lukechilds/zsh-nvm $ZSH_PLUGIN_FOLDER/zsh-nvm

  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_PLUGIN_FOLDER/zsh-syntax-highlighting

  git clone https://github.com/zdharma/fast-syntax-highlighting.git $ZSH_PLUGIN_FOLDER/fast-syntax-highlighting

  git clone https://github.com/shiro-saber/node-env-installer.git $ZSH_PLUGIN_FOLDER/node-env-installer

  sh -c "$(curl -fsSL https://raw.githubusercontent.com/psprint/zsh-navigation-tools/master/doc/install.sh)"

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
