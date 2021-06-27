#!/bin/sh

if ! tmux has-session -t dotfiles; then
	tmux new-session -s dotfiles -d
  tmux send-keys -t dotfiles:0.0 v Enter
fi

if [ -z "$TMUX" ]; then
	tmux attach -t dotfiles
else
	tmux switch-client -t dotfiles
fi
