export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions brew tmux)

source $ZSH/oh-my-zsh.sh

# EXPORTS
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
export EDITOR=vim
export TERMINAL=alacritty

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# bun completions
[ -s "~/.bun/_bun" ] && source "~/.bun/_bun"

eval "$(starship init zsh)"

# ALIASES
alias python="python3"
alias pip="pip3"
alias py="python3"
alias py3="python3"
alias clr="clear"
alias ls="ls -a "
alias cat="bat"
alias lg="lazygit"
alias s="git status"
alias c="git commit -a -m "
alias p="git pull"
alias P="git push"
alias C="git commit -a"
alias rem="rm -rf "
alias f='fzf --preview="bat {} --color=always"'
alias see="watch -n 0.1 "
alias fin="rg --files | sort | uniq | fzf"
alias n="nnn"
alias code="open Visual\ Studio\ Code.app"
alias yank="pbcopy"
alias localip="ipconfig getifaddr en0"

alias pacman="sudo pacman"
alias docker="sudo docker"

export PROMPT_EOL_MARK=""
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
