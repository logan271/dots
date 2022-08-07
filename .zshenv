export USER_NAME="Logan"
export ZSH="$HOME/.oh-my-zsh"

export PATH="$PATH:$HOME/bin"

# n: node package manager
export N_PREFIX="$HOME/n"
export PATH="$N_PREFIX/bin:$PATH"

# trueblock
export PATH="$HOME/pers/trueblocks-core/bin:$PATH"

# yarn
export PATH="$PATH:$HOME/.yarn/bin"

# Make vim the default editor.
export EDITOR="vim"
export editor="vim"

# export TERM=xterm-256color

# fzf setting
# https://github.com/junegunn/fzf#preview-window
# combine with cat or bat to display the file preview
export FZF_DEFAULT_OPTS='--height 100% --margin=0,0,5%,0 --reverse --preview="bat -n --color always {}" --preview-window=right:66%:wrap'
# # Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd --type f'

# bat
# https://github.com/sharkdp/bat
# bat can be used as a colorizing pager for man,
# by setting the MANPAGER environment variable:
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Make Python use UTF-8 encoding for output to stdin, stdout, and stderr.
export PYTHONIOENCODING='UTF-8';
export PATH="${PATH}:/Users/loganluo/Library/Python/3.8/bin"
export PYTHONPATH="${PYTHONPATH}:/Users/loganluo/Library/Python/3.8/bin"

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# https://stackoverflow.com/a/55993078/18678288
export GPG_TTY=$(tty)
. "$HOME/.cargo/env"

# golang proxy;
# Set the GOPROXY environment variable
export GOPROXY=https://goproxy.io,direct

