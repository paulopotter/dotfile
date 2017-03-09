#!/bin/bash

source ./configs.sh
source ./utils.sh

install_debian

function install_debian(){
	## sudo su # entra em modo super usuario.

	### Update System ###
		sudo apt-get update
		sudo apt-get dist-upgrade

	install_package_with "apt" aptitude

	### To install homebrew ###
		install_package_with "apt" build-essential
		install_package_with "apt" curl
		install_package_with "apt" git
		install_package_with "apt" python-setuptools
		install_package_with "apt" ruby
		linux_brew

	### Add the option to add repository (add-get-repository) ###
		install_package_with "apt" software-properties-common
		install_package_with "apt" python-software-properties

	### Add repositories ###
		add_spotify_repository
		add_opera_repository

	### Update apt-get ###
			sudo apt-get update

	### ZSH ###
			install_package_with "aptitude" zsh
			install_package_with "brew" zsh-syntax-highlighting
			install_zsh
			config_zsh

	### to use pbcopy/pbpaste ###
		install_package_with "aptitude" xclip
		pbcopy_alias

	install_package_with "apt" spotify-client

	### (des)Compactacao de arquivos ###
		install_package_with "aptitude" unace
		install_package_with "aptitude" unrar
		install_package_with "aptitude" zip
		install_package_with "aptitude" unzip
		install_package_with "aptitude" p7zip-full
		install_package_with "aptitude" p7zip-rar
		install_package_with "aptitude" sharutils
		install_package_with "aptitude" rar
		install_package_with "aptitude" uudeview
		install_package_with "aptitude" mpack
		install_package_with "aptitude" arj
		install_package_with "aptitude" cabextract
		install_package_with "aptitude" file-roller

	### Config Git ###
		git_config

	### Editors
		atom_download
		install_package_with "aptitude" vim

	### Sublime text ###
		install_package_control

}

function install_zsh(){
	if [[ $SHELL != $(which zsh) ]]; then
		sudo sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	fi
}

function config_zsh(){
	if [[ $SHELL != $(which zsh) ]]; then

		dotfile_folder=`pwd`

		sudo chsh -s $(which zsh) # making default

		cd ~
		ln -sfn ${dotfile_folder}/ohmyzsh/zshrc .zshrc
		sudo chmod 777 .oh-my-zsh/*

		ln -sfn ${dotfile_folder}/ohmyzsh/personalizado.zsh-theme .oh-my-zsh/themes/personalizado.zsh-theme
		cd -
	else
		echo "zsh já configurado"
	fi
}

function linux_brew(){
	## http://linuxbrew.sh/
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install)"
	echo 'export PATH="$HOME/.linuxbrew/bin:$PATH"' >>~/.bash_profile
	export PATH="$HOME/.linuxbrew/bin:$PATH"
	export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
	export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
}

function add_spotify_repository(){
	if [[ ! $(check_installed "apt" "spotify-client") ]] ; then
		sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
		echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
	fi
}

function install_package_control(){
	cd "$HOME/.config/sublime-text-3/Installed Packages"
	curl "https://raw.githubusercontent.com/wbond/package_control/master/Package%20Control.sublime-settings" > Package\ Control.sublime-settings
	cd -
}

function atom_download(){
	wget "https://github.com/atom/atom/releases/download/v1.11.2/atom-amd64.deb" -O atom.deb
	install_package_with "dpkg" ./atom.deb
	rm atom.deb
}

function pbcopy_alias(){
	alias pbcopy='xclip -selection clipboard'
	alias pbpaste='xclip -selection clipboard -o'

	echo "alias pbcopy='xclip -selection clipboard'" >>~/.bash_profile
	echo "alias pbpaste='xclip -selection clipboard -o'" >>~/.bash_profile
}

function install_opera(){
		## http://download4.operacdn.com/pub/opera/desktop/43.0.2442.1144/linux/opera-stable_43.0.2442.1144_amd64.deb
		wget -r -l1 -nH --cut-dirs=5  --no-parent -e robots=off -A '*_amd64.deb' http://deb.opera.com/opera/pool/non-free/o/opera-stable/
		install_package_with "dpkg" ./opera*_amd64.deb
		rm opera*_amd64.deb
}
