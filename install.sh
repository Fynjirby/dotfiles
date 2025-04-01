echo ".vimrc, .zshrc, .tmux.conf will be cloned from github to your pc and loaded with source command"
git clone https://github.com/Fynjirby/dotfiles.git dotfiles
echo "cloned successfully"

sudo mv dotfiles/.vimrc ~/.vimrc
sudo mv dotfiles/.zshrc ~/.zshrc
sudo mv dotfiles/.tmux.conf ~/.tmux.conf
echo "moved successfully"

rm -rf ./dotfiles/
