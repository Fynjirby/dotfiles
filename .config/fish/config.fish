if status is-interactive
    # Commands to run in interactive sessions can go here
end

# looota exports
set -gx PATH /opt/homebrew/bin $PATH
set -gx PATH $HOME/go/bin $PATH
set -gx EDITOR vim
set -gx TERMINAL alacritty

set -gx BUN_INSTALL $HOME/.bun
set -gx PATH $BUN_INSTALL/bin $PATH

# aliases
alias python="python3"
alias pip="pip3"
alias py="python3"
alias py3="python3"
alias clr="clear"
alias ls="ls -a "
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
