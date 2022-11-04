# Install packages
sudo pacman -S --needed --noconfirm - < packages.list

# enable ssh
sudo systemctl enable --now sshd

# zsh
echo "Install oh-my-zsh"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
