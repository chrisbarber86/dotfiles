My Dotfiles
===========

A place to store my dot files for coding

Usage
-----

Clone into ~/dotfiles/

Then add symlinks in your ~/ directory

```bash
# Symlink vim:
ln -nfs ~/dotfiles/ ~/.vim

# Symlink .vimrc:
ln -nfs ~/dotfiles/vimrc ~/.vimrc

# Symlink .vimrc.bundles:
ln -nfs ~/dotfiles/vimrc.bundles ~/.vimrc.bundles

# Symlink .bash_aliases
ln -nfs ~/dotfiles/bash_aliases ~/.bash_aliases

# Symlink .gitconfig
ln -nfs ~/dotfiles/gitconfig ~/.gitconfig

# Symlink .gitignore
ln -nfs ~/dotfiles/gitignore ~/.gitignore

# Symlink .gemrc
ln -nfs ~/dotfiles/gemrc ~/.gemrc

# Symlink .tmux.conf
ln -nfs ~/dotfiles/tmux.conf ~/.tmux.conf
```

## Install all bundles using vundle:

Open vim and run:
```
:BundleInstall
```

### Vim Powerline Patched Fonts

Download and install patched fonts from [here](https://gist.github.com/qrush/1595572/download) and use these fonts in your [terminal](http://www.iterm2.com/)
