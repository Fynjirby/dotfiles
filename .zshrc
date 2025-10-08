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
alias ls="ls -a "
alias cat="bat"
alias lg="lazygit"
alias fp='fzf --preview="bat {} --color=always"'
alias fin="rg --files | sort | uniq | fzf"
alias see="watch -n 0.1 "
alias yank="pbcopy"
alias localip="ipconfig getifaddr en0"

alias docker="sudo docker"

export PROMPT_EOL_MARK=""
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
