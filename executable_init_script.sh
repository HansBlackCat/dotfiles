#!/bin/sh
sudo apt update
# add neovim > 0.5 repos
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim -y
sudo apt-get install python-dev python3-dev python3-pip -y

sudo apt install vim man-db manpages-posix manpages-dev manpages-posix-dev -y

sudo apt install gcc clang clangd python3 python-dev python3-dev tmux cmake exuberant-ctags cscope -y
sudo apt install git openssh-server build-essential ncurses-dev libssl-dev flex bison libelf-dev neovim zsh fzf -y
sudo apt install flex -y

sudo apt install curl wget -y

# nodejs
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - &&\
sudo apt-get install -y nodejs

# Enable openssh-server
sudo systemctl enable --now ssh

pip install cmake-language-server

# zsh
echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

