function p() {
    cd -- "$(. ~/shell/project_finder.sh)" 
}

alias n="nvim"
alias c="clear"

set -o vi

eval "$(starship init bash)"

export EDITOR='nvim'
export VISUAL='nvim'
