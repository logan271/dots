#!/bin/bash

DOTS_PATH="$HOME/dots"

ln -sf "$DOTS_PATH/.zshenv" "$HOME/.zshenv"

# tmux
ln -sf "$DOTS_PATH/.tmux.conf" "$HOME/.tmux.conf"
ln -sf "$DOTS_PATH/tmuxinator" "$HOME/.config/tmuxinator"

# git
ln -sf "$DOTS_PATH/.gitconfig" "$HOME/.gitconfig"
ln -sf "$DOTS_PATH/.gitignore" "$HOME/.gitignore"
