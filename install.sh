echo ".vimrc, .zshrc, .tmux.conf will be cloned from github to your pc and loaded with source command"
git clone https://github.com/Fynjirby/dotfiles.git dotfiles
echo "cloned successfully"

echo "moving configs (may require user password)"
sudo mv dotfiles/.vimrc ~/.vimrc
sudo mv dotfiles/.zshrc ~/.zshrc
sudo mv dotfiles/.tmux.conf ~/.tmux.conf
sudo mkdir ~/.config
sudo mv dotfiles/.config/starship.toml ~/.config/starship.toml 
echo "moved successfully"

echo "installing oh my zsh (if fails please check are zsh and curl installed)"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "oh my zsh installed successfully"

echo "installing zsh plugins"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "zsh plugins installed successfully"

echo "installing vim plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "vim plug installed successfully"

echo "removing temp folder"
rm -rf ./dotfiles/

echo "all installed successfully, thanks for using"
