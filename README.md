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
Checkout 3 branches - `mac`, `arch` and `arch-i3`
<br>
- `mac` branch is for my MacBook
- `arch` branch is for my PC running [Arch Linux](https://archlinux.org/) with [hyprland](https://hypr.land/)
- `arch-i3` branch is for my PC running [Arch Linux](https://archlinux.org/) with [i3wm](https://i3wm.org/)

  
> [!NOTE]  
> The tmux colors were designed for Alacritty terminal, it can look way different in other terminals!
