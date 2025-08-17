#!/bin/bash/env bash

function p() {
    cd -- "$(. ~/shell/project_finder.sh)" 
}

alias n="nvim"

set -o vi

eval "$(starship init bash)"

export EDITOR='nvim'
export VISUAL='nvim'
