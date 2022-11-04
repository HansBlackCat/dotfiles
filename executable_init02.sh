
echo "Install zsh-autosuggestions"
[ ! -d "~/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ] && git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Install zsh-syntax-highlighting"
[ ! -d "~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

echo "Install powerlevel10k"
[ ! -d "~/.oh-my-zsh/custom/themes/powerlevel10k" ] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# neovim
# Vim-plug
if [ ! -f "~/.local/share/nvim/site/autoload/plug.vim"  ]; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
         https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

# run :Pluginstall
vim +'PlugInstall --sync' +qa

# reload ~/.zshrc
chezmoi -v apply ~/.zshrc

# git credential cache
git config --global credential.helper 'cache --timeout=7200'
