echo ".vimrc, .zshrc, .tmux.conf will be cloned from github to your pc and loaded with source command"
git clone https://github.com/Fynjirby/dotfiles.git dotfiles
echo "cloned successfully"

sudo mv dotfiles/.vimrc ~/.vimrc
sudo mv dotfiles/.zshrc ~/.zshrc
sudo mv dotfiles/.tmux.conf ~/.tmux.conf
echo "moved successfully"

echo "installing oh my zsh (if fails please check are zsh and curl installed"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "oh my zsh installed successfully"

echo "installing vim plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
echo "vim plug installed successfully"

rm -rf ./dotfiles/
