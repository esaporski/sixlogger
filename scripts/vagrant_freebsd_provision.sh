#!/bin/sh
# Run as root

# Install shells
pkg install --yes \
	bash \
	dash \
	ksh \
	mksh \
	oksh \
	yash \
	zsh

# Install shellspec
pkg install --yes \
	git \
	pcre2
curl -fsSL https://git.io/shellspec | sh -s -- --yes --prefix /usr/local

# Delete `.shrc` file (causes problems with some shells)
rm /home/vagrant/.shrc

# Enter `/mnt` directory when SSH session starts
echo "cd /mnt" >>/home/vagrant/.profile
