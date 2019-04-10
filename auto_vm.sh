#!/usr/bin/env bash

# Install brew package manager
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install wget, virtualboxx and vagrant
brew install wget
brew cask install virtualbox
brew cask install vagrant

# Make vagrant directory. This is where we will store our VagrantFile along with shared folder
mkdir vagrant
cd vagrant

# Before vagrant setup. Add default IP to /etc/host with hostname 'vagrant'
echo '192.168.56.101  vagrant' | sudo tee -a /etc/hosts > /dev/null

# Init vagrant with the correct ubuntu box. This will also set up an initial Vagrantfile
vagrant init peru/ubuntu-18.04-server-amd64 \
  --box-version 20190312.01

# Override the existing barebones Vagrantfile with a preconfigured one
curl -O https://raw.githubusercontent.com/Defection/Vagrant/master/Vagrantfile

# Hello
# Boot up vagrant for the first time
vagrant up
