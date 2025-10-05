# Egor's dotfiles

I'm using [GNU Stow](https://www.gnu.org/software/stow/) to manage my dotfiles, the process is damn simple! 
1. Install `git` and `stow` via your package manager 
2. Clone the repo to any location inside `$HOME`, for example use
```bash
git clone https://github.com/fynjirby/dotfiles.git -b arch ~/dotfiles # (or `-b mac` for mac)
```
4. Go to the directory where you cloned a repo and run `stow .`, it will syncronize the dotfiles with your `$HOME` directory (`~/`)

> [!IMPORTANT]  
> Note that you should clone a repo to a directory inside `$HOME`, for example to `~/egorsdots` or `~/.nicedots`, but not in `~/dots/egors`, stow syncs the directory with a parent one, be careful!

## Branches
Checkout 2 main branches - `mac` and `arch`
<br>
The `mac` branch is for my MacBook and the `arch` branch is for my PC running [Arch Linux](https://archlinux.org/)

> [!NOTE]  
> The tmux colors were designed for Alacritty terminal, it can look other way on different terminals!
