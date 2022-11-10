# Install packages
sudo pacman -S --needed --noconfirm - < packages.list

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ${HOME}

# enable ssh
sudo systemctl enable --now sshd

# zsh
echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
