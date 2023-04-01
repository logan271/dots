alias vim="nvim"
alias c="cargo"
alias ls="ls -GAp"
alias ls-path="echo $PATH | tr ':' '\n'"
alias vbundles="vim ~/.vimrc.bundles.local"
alias desk="cd ~/Desktop"
alias pserver="python3 -m http.server"
alias rrm="rm -rf"
alias typo="open -a typora"
alias p="pnpm"
alias cpp="cp -Rp"
alias finder="open -a Finder"
alias if0="ifconfig en0"
alias code-settings="code $HOME/Library/Application\ Support/Code/User/"

# git
alias gaa="git add --all"
alias gmm="git commit -m"
alias gma='git commit --amend'
alias gdc='git diff --cached'

# fzf
alias f="fzf"
alias ft="fzf-tmux"

# Recursively delete `.DS_Store` files
alias cleanup_DS_Store="find . -type f -name '*.DS_Store' -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD.
# Also, clear Apple’s System Logs to improve shell startup speed.
# Finally, clear download history from quarantine. https://mths.be/bum
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl; sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'delete from LSQuarantineEvent'"

# Show/hide hidden files in Finder
# alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
# alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
# alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
# alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Disable Spotlight
alias spotoff="sudo mdutil -a -i off"
# Enable Spotlight
alias spoton="sudo mdutil -a -i on"

# Intuitive map function
# For example, to list all directories that contain a certain file:
# find . -name .gitattributes | map dirname
alias map="xargs -n1"

# Always enable colored `grep` output
# Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=aut'

# List only directories
alias lsd="ls -lF ${colorflag} | grep --color=never '^d'"

# Reload the shell (i.e. invoke as a login shell)
alias reload="exec $SHELL -l"

fgitd() {
	preview="git diff $@ --color=always -- {-1} | diff-so-fancy"
	git diff $@ --name-only | fzf -m --ansi --preview $preview
}
alias fgd=fgitd
