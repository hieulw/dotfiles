#!/bin/bash

if [[ $SUDO_USER ]]; then
  echo "Try again without sudo"
  exit 1
fi

sudo pacman -S --needed git base-devel fish tmux vifm neovim

# prompt starship
echo "Install Starship Prompt"
curl -fsSL https://starship.rs/install.sh | bash

# tmux plugins
echo "Install Tmux Plugins"
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# neovim
echo "Install Vim-Plug"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
      --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# python
echo "Install pyenv"
curl https://pyenv.run | bash
git clone https://github.com/pyenv/pyenv-virtualenvwrapper.git \
  $(pyenv root)/plugins/pyenv-virtualenvwrapper

# node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.36.0/install.sh | bash
nvm install --lts

dotfiles=$(ls -1 -A . 2> /dev/null)

if [[ $dotfiles ]]; then
  for dotfile in $dotfiles; do
    echo "$dotfile"
    ln -s $dotfile $HOME/$dotfile
  done
else
  echo "This script must be run inside dotfiles directory. Try again!"
  exit 1
fi
