#!/bin/sh
# install node using nvm and utility npm modules, call this script from zsh

VERSION=${1-stable}

# install node version manager to switch versions easily
wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.0/install.sh | sh
source ~/.zshrc
nvm install $VERSION

# NPM: install jshint, jscs, js-beautify, pm2
npm install -g jshint
npm install -g jscs
npm install -g js-beautify
npm install -g pm2

# pm2 completion
pm2 completion install
source ~/.zshrc
