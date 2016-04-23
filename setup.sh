#!/bin/sh
# main setup script for configuring an Ubuntu 14.04 LTS Digital Ocean droplet

USER=$1

# install git
sudo apt-get install -y git

# install misc. handy packages
sudo apt-get install -y unzip
sudo apt-get install -y tree

# install common software packages
sudo apt-get install -y software-properties-common
sudo apt-get install -y python-software-properties
sudo apt-get install -y python
sudo apt-get install -y make
sudo apt-get install -y g++

# install zsh and make it the default shell
sudo apt-get install -y zsh
sudo chsh -s $(which zsh) $USER

# install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# install node version manager to switch versions easily
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | sh
source ~/.bashrc
nvm install stable

# NPM: install jshint, jscs, js-beautify, pm2
npm install -g jshint
npm install -g jscs
npm install -g js-beautify
npm install -g pm2

# install emacs24
sudo add-apt-repository -y ppa:ubuntu-elisp/ppa
sudo apt-get -qq update
sudo apt-get install -y emacs-snapshot emacs-snapshot-el

# install tmuxinator (help for setting tmux sessions)
sudo apt-get install -y ruby
sudo gem install tmuxinator

# install silversearcher-ag, the killer code grep
sudo apt-get install -y silversearcher-ag

# git pull and install dotfiles as well
cd
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
if [ -d .emacs.d/ ]; then
    mv .emacs.d .emacs.d~
fi
git clone https://github.com/tibotiber/dotfiles.git
cd dotfiles/
git submodule update --init --recursive
cd
ln -sb dotfiles/.tmux.conf .
ln -sb dotfiles/.tmuxinator .
ln -sf dotfiles/.emacs.d .
