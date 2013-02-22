My Dotfiles
===========

A place to store my dot files for coding

Usage
-----

Clone into ~/dotfiles/

Then add symlinks in your ~/ directory

Symlink vim:
  ln -nfs ~/dotfiles/ .vim

Symlink .vimrc:
  ln -nfs ~/dotfiles/vimrc .vimrc

Symlink .bash_aliases
  ln -nfs ~/dotfiles/bash_aliases .bash_aliases

Symlink .gitconfig
  ln -nfs ~/dotfiles/gitconfig .gitconfig

Symlink .gitignore
  ln -nfs ~/dotfiles/gitignore .gitignore

Symlink .gemrc
  ln -nfs ~/dotfiles/gemrc .gemrc

Symlink .tmux.conf
  ln -nfs ~/dotfiles/tmux.conf .tmux.conf

Fetch submodules after cloning repo, in ~/dotfiles run:
  git submodule update --init

###Vim Powerline Patched Fonts

Download and install patched fonts from [here](https://gist.github.com/qrush/1595572/download) and use these fonts in your [terminal](http://www.iterm2.com/)
