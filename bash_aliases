# Bash Aliases File - Heavily based on same file github.com/damian/dotfiles/

# Navigation
alias ll="ls -l"
alias lla="ls -la"
alias ..="cd .."
alias ...="cd ../.."

# dev function
function dev() { cd ~/development/"$1"; }
alias dev="dev"

# bashrc & vimrc
alias rl="source ~/.bash_aliases"

# Git
alias g="git"
alias gs="git status "
alias ga="git add "
alias gb="git branch "
alias gc="git commit "
alias gd="git diff "
alias go="git checkout "
alias undo="git reset --soft HEAD~1"

# Bundler
alias b="bundle"
alias be="bundle exec "

# Evergreen - https://github.com/abepetrillo/evergreen
alias evergreen="be rails s -p 4000"

# Python SimpleHTTPServer
alias simple="python -m SimpleHTTPServer"

# Bash prompt
function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}

function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}

CYAN="\[\033[0;36m\]"
PURPLE="\[\033[0;35m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

PS1="$RED\$(date +%H:%M) \w$YELLOW\$(parse_git_branch)\$ $NO_COLOUR"

# 256 Colour Stuff for Vim/ Tmux
export TERM='screen-256color'

# Editor set to vim
export EDITOR=vim

# Set no_proxy to avoid issues with selenium webdriver
export no_proxy=127.0.0.1

# Speed up Builds in Ruby
export DGC=true

# GitHub Methods (https://gist.github.com/andrewjtait/9114245e92b84d69aa43#file-gistfile1-sh)
function github {
  branch="$(git rev-parse --abbrev-ref HEAD)"
  url="$(git config --get remote.origin.url)"
  url=${url/git@github.com:/http://github.com/}
  url=${url/.git/}

  if [[ $1 =~ "compare" ]]; then action="compare"
  elif [[ $1 =~ "pr" ]]; then action="pull"
  else action="tree"; fi

  if [[ $2 != "" ]]; then base="$2..."
  else base=""; fi

  url="${url}/${action}/${base}${branch}"

  echo "Opening ${url} $(\open ${url})"
}
