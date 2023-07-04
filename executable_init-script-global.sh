#!/bin/bash 

if [ -d "${HOME}/.tmux/plugins/tpm" ]
then
  echo "tpm is already installed"
else
  echo "Installing tpm"
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
