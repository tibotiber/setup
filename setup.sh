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

# install emacs
sudo add-apt-repository -y ppa:ubuntu-elisp/ppa
sudo apt-get -qq update
sudo apt-get install -y emacs-snapshot emacs-snapshot-el

# install tmuxinator (help for setting tmux sessions)
sudo apt-get install -y ruby
sudo gem install tmuxinator

# install silversearcher-ag, the killer code grep
sudo apt-get install -y silversearcher-ag

# clone and install dotfiles
cd
if [ -d ./dotfiles/ ]; then
    mv dotfiles dotfiles.old
fi
git clone https://github.com/tibotiber/dotfiles.git
ln -sb dotfiles/.tmux.conf .
ln -sb dotfiles/.zshrc .
ln -sb dotfiles/.zshenv .
ln -sb dotfiles/.antigenrc .
