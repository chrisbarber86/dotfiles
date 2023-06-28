# Bash Aliases File - Heavily based on same file github.com/damian/dotfiles/

# Navigation
alias ..="cd .."
alias ...="cd ../.."

# dev function
function dev() { cd ~/development/"$1"; }
alias dev="dev"

# bashrc & vimrc
alias rl="source ~/.bash_aliases"

# Git
alias gs="git status "
alias undo="git reset --soft HEAD~1"

# Bundler
alias b="bundle"
alias be="bundle exec "

# Python SimpleHTTPServer
alias simple="python -m SimpleHTTPServer"

# AWS Login
alias awslogin="aws ecr get-login-password --region eu-west-1 --profile dev | docker login --username AWS --password-stdin 522104923602.dkr.ecr.eu-west-1.amazonaws.com"

# Docker Setup
alias docker_rmi='docker rmi $(docker images -q)' # Remove all docker images
alias docker_rmc='docker rm $(docker ps -a -q)' # Remove all containers
alias docker_rmd='docker volume rm $(docker volume ls -q )' # Remove used volumes
alias docker_stop='docker stop $(docker ps -q)'
alias docker_clear='docker_stop && docker_rmd && docker_rmc && docker_rmi'

# Bash prompt
function parse_git_branch {
  git rev-parse --git-dir &> /dev/null
  git_status="$(git status 2> /dev/null)"
  branch_pattern="^On branch ([^${IFS}]*)"
  ahead_pattern="Your branch is ahead of"
  behind_pattern="Your branch is behind"
  staged_pattern="Changes to be committed"
  unstaged_pattern="Changes not staged for commit"
  untracked_pattern="Untracked files"
  diverge_pattern="Your branch and (.*) have diverged"

  if [[ ${git_status}} =~ ${staged_pattern} ]];     then state+="${YELLOW}*"; fi
  if [[ ${git_status}} =~ ${unstaged_pattern} ]];   then state+="${GREEN}*"; fi
  if [[ ${git_status}} =~ ${untracked_pattern} ]];  then state+="${CYAN}*"; fi

  if   [[ ${git_status} =~ ${ahead_pattern} ]];     then remote="${CYAN}↑"
  elif [[ ${git_status} =~ ${behind_pattern} ]];    then remote="${CYAN}↓"
  elif [[ ${git_status} =~ ${diverge_pattern} ]];   then remote="${RED}↕"; fi

  if [[ ${git_status} =~ ${branch_pattern} ]]; then
    branch=${BASH_REMATCH[1]}
    echo "$YELLOW:$branch$remote$state"
  fi
}

function prompt_func() {
  PS1="$RED\$(date +%H:%M) \w$(parse_git_branch)$YELLOW\$ $NO_COLOUR"
}

PROMPT_COMMAND=prompt_func

CYAN="\[\033[0;36m\]"
PURPLE="\[\033[0;35m\]"
RED="\[\033[0;31m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
GREEN="\[\033[0;32m\]"
NO_COLOUR="\[\033[0m\]"

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
