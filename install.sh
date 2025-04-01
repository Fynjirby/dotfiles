echo "LOG: .vimrc, .zshrc, .tmux.conf will be cloned from github to your pc and moved to ~ "
git clone https://github.com/Fynjirby/dotfiles.git dotfiles
echo "LOG: cloned successfully"

echo "LOG: moving configs (may require user password)"
sudo mv dotfiles/.vimrc ~/.vimrc
sudo mv dotfiles/.zshrc ~/.zshrc
sudo mv dotfiles/.tmux.conf ~/.tmux.conf
sudo mkdir ~/.config
sudo mv dotfiles/.config/starship.toml ~/.config/starship.toml 
echo "LOG: moved successfully"

echo "LOG: installing oh my zsh (if fails please check are zsh and curl installed)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "LOG: oh my zsh installed successfully"

echo "installing zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "LOG: zsh plugins installed successfully"

echo "LOG: installing starship"
curl -sS https://starship.rs/install.sh | sh
echo "LOG: staship installed successfully"

echo "LOG: installing vim plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "LOG: vim plug installed successfully"

echo "LOG: removing temp folder"
rm -rf ./dotfiles/

echo "LOG: all installed successfully, thanks for using"
echo "LOG: next use this command to load .zshrc \n source ~/.zshrc"
