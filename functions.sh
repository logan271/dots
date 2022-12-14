function google() {
  open /Applications/Google\ Chrome.app/ "http://www.google.com/search?q=$*";
}
function github() {
  open /Applications/Google\ Chrome.app/ "https://github.com/$*";
}
function port-ls() {
  lsof -i ":$1"
}

# mkdir and cd
function take() { mkdir -p "$@" && cd "$_";}

# Go to the open Finder window's path
function cdf {
    target=`osascript -e 'tell application "Finder" to get POSIX path of (target of front Finder window as text)'`
    if [[ "$target" != "" ]]; then
        cd "$target"; echo "Going to $target"
    else
        echo -e 'There are no Finder windows!' >$2
    fi
}

# whois a domain or a URL
function whois() {
	local domain=$(echo "$1" | awk -F/ '{print $3}') # get domain from URL
	if [ -z $domain ] ; then
		domain=$1
	fi
	echo "Getting whois record for: $domain …"

	# avoid recursion
					# this is the best whois server
													# strip extra fluff
	/usr/bin/whois -h whois.internic.net $domain | sed '/NOTICE:/q'
}

# Extract archives - use: extract <file>
# Based on http://dotfiles.org/~pseup/.bashrc
function extract() {
	if [ -f "$1" ] ; then
		local filename=$(basename "$1")
		local foldername="${filename%%.*}"
		local fullpath=`perl -e 'use Cwd "abs_path";print abs_path(shift)' "$1"`
		local didfolderexist=false
		if [ -d "$foldername" ]; then
			didfolderexist=true
			read -p "$foldername already exists, do you want to overwrite it? (y/n) " -n 1
			echo
			if [[ $REPLY =~ ^[Nn]$ ]]; then
				return
			fi
		fi
		mkdir -p "$foldername" && cd "$foldername"
		case $1 in
			*.tar.bz2) tar xjf "$fullpath" ;;
			*.tar.gz) tar xzf "$fullpath" ;;
			*.tar.xz) tar Jxvf "$fullpath" ;;
			*.tar.Z) tar xzf "$fullpath" ;;
			*.tar) tar xf "$fullpath" ;;
			*.taz) tar xzf "$fullpath" ;;
			*.tb2) tar xjf "$fullpath" ;;
			*.tbz) tar xjf "$fullpath" ;;
			*.tbz2) tar xjf "$fullpath" ;;
			*.tgz) tar xzf "$fullpath" ;;
			*.txz) tar Jxvf "$fullpath" ;;
			*.zip) unzip "$fullpath" ;;
			*) echo "'$1' cannot be extracted via extract()" && cd .. && ! $didfolderexist && rm -r "$foldername" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# Use Git’s colored diff when available
hash git &>/dev/null;
if [ $? -eq 0 ]; then
	function diff() {
		git diff --no-index --color-words "$@";
	}
fi;

# Syntax-highlight JSON strings or files
# Usage: `json '{"foo":42}'` or `echo '{"foo":42}' | json`
function json() {
	if [ -t 0 ]; then # argument
		python -mjson.tool <<< "$*" | pygmentize -l javascript;
	else # pipe
		python -mjson.tool | pygmentize -l javascript;
	fi;
}

# Run `dig` and display the most useful info
function digga() {
	dig +nocmd "$1" any +multiline +noall +answer;
}

# Get a character’s Unicode code point
function codepoint() {
	perl -e "use utf8; print sprintf('U+%04X', ord(\"$@\"))";
	# print a newline unless we’re piping the output to another program
	if [ -t 1 ]; then
		echo ""; # newline
	fi;
}


# `tre` is a shorthand for `tree` with hidden files and color enabled, ignoring
# the `.git` directory, listing directories first. The output gets piped into
# `less` with options to preserve color and line numbers, unless the output is
# small enough for one screen.
function tre() {
	tree -aC -I '.git|node_modules|dist|build' --dirsfirst "$@" | less -FRNX;
}


function port-kill() {
  port=$1

  if [[ ${#port} == 0 ]]; then
   echo "Kills a service running on the specified port."
   echo "usage: killport PORT"
   exit;
  fi

  # Get everything running on this port
  lsofcmd="lsof -i :$port"

  # echo the command, and then iterate through each line of the output
  counter=0
  $(echo $lsofcmd) | while read -r line; do
    counter=$((counter+1)) # We want to skip the first line, as the first line is the column headers, from lsof

    if [[ $counter > 1 ]]; then
      procname=$(echo $line | awk '{print $1}')
      pid=$(echo $line | awk '{print $2}')

      echo "Killing $procname with PID: $pid"
      kill $pid;
    fi
  done
}

function psgrep() {
  ps aux | grep "$1" | grep -v 'grep'
}


function pskill () {
  [ ${#} -eq 0 ] && echo "usage: $FUNCNAME STRING" && return 0 local pid
  pid=$(ps ax | grep "$1" | grep -v grep | awk ‘{ print $1 }’) echo -e "terminating ‘$1’ / process(es):\n$pid"
  kill -SIGTERM $pid
}
