export USER_NAME="Logan"
export ZSH="$HOME/.oh-my-zsh"

export PATH="$PATH:$N_PREFIX/bin"
export PATH="$PATH:$HOME/.local/bin"
export PATH=$PATH:/opt/homebrew/bin

# trueblock
export PATH="$PATH:$HOME/dev/trueblocks-core/bin"
# yarn
export PATH="$PATH:$HOME/.yarn/bin"

# Make vim the default editor.
export EDITOR="vim"
export editor="vim"

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

# Prefer US English and use UTF-8.
export LANG='en_US.UTF-8';
export LC_ALL='en_US.UTF-8';

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}";

# https://stackoverflow.com/a/55993078/18678288
export GPG_TTY=$(tty)


. "$HOME/.cargo/env"


export PATH="$PATH:/Users/logan/.foundry/bin"
