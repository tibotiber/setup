# Digital Ocean droplet setup scripts

Download and run this on a new Digital Ocean droplet running Ubuntu 16.04 LTS to configure the machine and environment:

```sh
# to start, please ssh login as root with your key
wget -qO- https://github.com/tibotiber/setup/raw/master/update_locales.sh | sh
exit
# please ssh login as root again
wget -qO- https://github.com/tibotiber/setup/raw/master/create_user.sh | sh -s <your_username>
su <your_username>
cd
wget -qO- https://github.com/tibotiber/setup/raw/master/setup.sh | sh -s <your_username>
zsh
wget -qO- https://github.com/tibotiber/setup/raw/master/configure_git.sh | zsh
# IMPORTANT: follow instructions in terminal
# you can now exit and reconnect as <your_username> with the same key
```

See also http://github.com/tibotiber/dotfiles which is cloned during the setup.





