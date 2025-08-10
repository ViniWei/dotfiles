function p() {
    cd -- "$(. ~/shell/project_finder.sh)" 
}

if [ -x "$(command -v tmux)" ] && [ -n "${DISPLAY}" ] && [ -z "${TMUX}" ]; then
    exec tmux new-session -A -s ${USER} >/dev/null 2>&1
fi

alias n="nvim"

set -o vi

eval "$(starship init bash)"

export EDITOR='nvim'
export VISUAL='nvim'
