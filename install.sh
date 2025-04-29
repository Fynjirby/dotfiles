echo "LOG: .vimrc, .zshrc, .tmux.conf, starship.toml and alacritty.toml will be cloned from github to your pc and moved to ~/"
git clone https://github.com/Fynjirby/dotfiles.git dotfiles
echo "LOG: cloned successfully"

echo "LOG: moving old configs to ~/.old"
mkdir ~/.old
mv ~/.vimrc ~/.old/.vimrc
mv ~/.zshrc ~/.old/.zshrc
mv ~/.tmux.conf ~/.old/.tmux.conf
mkdir ~/.old/.config
mv ~/.config/alacritty.toml ~/.old/.config/alacritty.toml
mv ~/.config/starship.toml ~/.old/.config/starship.toml 
echo "LOG: moved successfully"

rm -rf ~/.vimrc
rm -rf ~/.zshrc
rm -rf ~/.tmux.conf
rm -rf ~/.config/alacritty.toml
rm -rf ~/.config/starship.toml

echo "LOG: moving new configs (may require user password)"
mv dotfiles/.vimrc ~/.vimrc
mv dotfiles/.zshrc ~/.zshrc
mv dotfiles/.tmux.conf ~/.tmux.conf
mkdir ~/.config
mv dotfiles/.config/alacritty.toml ~/.config/alacritty.toml
mv dotfiles/.config/starship.toml ~/.config/starship.toml 
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

mkdir -p ~/.vim/undo
echo "LOG: created ~/.vim/undo to turn on undo in vim"

echo "LOG: removing temp folder"
rm -rf ./dotfiles/

echo "LOG: all installed successfully, thanks for using"
echo "LOG: next use this command to load .zshrc"
echo "LOG: source ~/.zshrc"
echo "LOG: Also install alacritty from alacritty.org or via your package manager"
