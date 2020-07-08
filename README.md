# Minhas configurações padrões
---

Antes de usar altere o arquivo **configs.sh**

## Como usar:

- Abra o terminal e cole: `git clone https://github.com/paulopotter/dotfile.git`
- `cd dotfile`
- Altere o arquivo **configs.sh**
- `./install_osx`


## O que será instalado?

- Editores:
  - Visual Studio Code
  - Vim

- Navegadores:
  - Opera
  - Google Chrome

- Audio/Video:
  - Spotify
    - Spotify Notifications
  - Vlc

- Outros:
  - [Tsuru](http://tsuru.io)
  - Slack
  - zsh _(Personaliza o terminal)_
  - Spectacle _resize window_
  - google-backup-and-sync _google drive_
  - dropbox
  - caffeine _don`t sleep screen_
  - captin _notify when caps lock change_
  - 1password
  - authy

### Notas:

__zsh__:

Se quiser usar outro tema, altere o arquivo `ohmyzsh/zshrc` com o tema desejado [Lista com alguns temas](https://zshthem.es/) e altere o arquivo `install_debian` removendo a linha onde tem o texto __personalizado.zsh-theme__, se não será usado o tema que eu fiz.

__Chave SSH__:

Ao final da instalação, estará no clipboard a sua chave ssh para colocar no github ou qualquer outro lugar que necessite da chave.
