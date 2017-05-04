#!/bin/zsh

git config --global user.name "Thibaut Tiberghien"
git config --global user.email "thibaut@planecq.com"
ssh-keygen -t rsa -N "" -C "thibaut@planecq.com" -f ~/.ssh/id_rsa
ssh-add .ssh/id_rsa
echo "You should copy the next line into a new ssh key on github  https://github.com/settings/ssh)."
cat ~/.ssh/id_rsa.pub
echo "Then you can run 'ssh -T git@github.com' to check that the connection is working."
