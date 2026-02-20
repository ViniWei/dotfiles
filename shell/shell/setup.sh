#!/bin/bash/env bash

setup_string=". $HOME/shell/bashrc_custom.sh"
bashrc="$HOME/.bashrc"

if ! grep -qF "$setup_string" $bashrc; then
    echo "$setup_string" >> $bashrc
fi

. $bashrc
