#!/bin/bash

#if [[ $SUDO_USER ]]; then
#  echo "Try again without sudo"
#  exit 1
#fi
#
#sudo pacman -S --needed git base-devel fish tmux vifm neovim
#
## prompt starship
#echo "Install Starship Prompt"
#curl -fsSL https://starship.rs/install.sh | bash
#
## tmux plugins
#echo "Install Tmux Plugins"
#git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
#
## neovim
#echo "Install Vim-Plug"
#sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
#      --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
#
## python
#echo "Install pyenv"
#curl https://pyenv.run | bash
#git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git \
#  $(pyenv root)/plugins/pyenv-virtualenvwrapper
#
## node
#curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
#nvm install --lts
#
dotdir="$HOME/.dotfiles"
dotfiles=$(ls -1A $dotdir --ignore={setup.sh,README.md,.git,.local})

if [[ $dotfiles ]]; then
  for dotfile in $dotfiles; do
    echo "$dotfile"
    if [[ -d $dotfile ]]; then
      dot=$(ls -1A $dotfile)
      for subfolder in $dot; do
        echo "$subfolder"
        ln -s $dotdir/$dotfile/$subfolder $HOME/$dotfile
      done
    else
      ln -s $dotdir/$dotfile $HOME/$dotfile
    fi
  done
else
  echo "This script must be run inside dotfiles directory. Try again!"
  exit 1
fi
