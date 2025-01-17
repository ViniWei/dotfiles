#!/bin/bash

repo_dir="$HOME/repos"

first_dir=$(find $repo_dir -mindepth 1 -maxdepth 1 -type d | fzf --preview 'ls {}')

find $first_dir -mindepth 1 -maxdepth 1 -type d | fzf --preview 'ls {}'
