# Experiments and Notes for Onion Omega2+

This repo will contain experiments I do with my Omega2+ as well as some notes for doing various things.

I exclusively use `vi` in this documentation, you may substitute `nano` after installing it.

## Experiments

I've just been messing with the OS, there's nothing here yet.

Eventually you'll be able to clone this to your Omega and mess around with it.

## Install Some Packages

### Install GIT

    opkg install git
    opkg install git-http
    opkg install ca-bundle

### Install a Better Text Editor

    opkg install vim
    opkg install nano

### Install BASH

    opkg install bash
    vi /etc/passwd

Change this:

    root:x:0:0:root:/root:/bin/ash

To this:

    root:x:0:0:root:/root:/bin/bash

Log out of the Omega's shell and log back in for this to take effect.  You may test with:

    echo $SHELL

## Create Your `.profile`

Create your local bin.

    mkdir ~/bin

Touch your profile.

    touch ~/.profile

Edit it.

    vi ~/.profile

Add some stuff to it.

    alias l='ls -lah'
    export PATH=~/bin:$PATH
    
Source it, this applies the changes you made.

    source ~/.profile

## SSH

### Generate SSH Keys

    mkdir ~/.ssh/id_rsa
    dropbearkey -t rsa -f ~/.ssh/id_rsa
    dropbearkey -y -f ~/.ssh/id_rsa | sed -n 2p > ~/.ssh/id_rsa.pub

### SSH to Omega without Password

Process is outlined on the Wiki: [Adding your Public Key to the Omega](https://wiki.onion.io/Tutorials/Adding-Public-Key-to-Omega)

## Setting Up Git

Full readme here: [docs/git_setup.md](docs/git_setup.md)

## Setting Up SDCARD for `/root` and SWAP

Full readme here: [docs/setting_up_sdcard_for_root_and_swap.md](docs/setting_up_sdcard_for_root_and_swap.md)

## Node.js

### Install Node and NPM

    opkg install nodejs
    opkg install npm

I like to store my global node modules in my root directory, so as to not take up too much room in the root file system, this along with my instructions above for setting up SDCARD for `/root` gives me plenty of extra space.

    mkdir -p /root/node/bin
    npm config set prefix /root/node

Add the node bin to your `.profile`, either edit it or echo to it.

    echo "export PATH=~/node/bin:\$PATH" >> ~/.profile
    source ~/.profile

Test it out.

    npm install -g lorem-ipsum
    lorem-ipsum
    # should output some lorem ipsum text
    npm remove -g lorem-ipsum
    
## File Transfer

To send/receive files to/from the device I recommend using `scp`, you'll want to substitute your device's IP for the one I have listed.

    # Receive a single file from your etc to your local machine
    scp root@10.10.10.250:/etc/openwrt_release .
    
    # Receive a full directory from /www to your local machine
    scp -r root@10.10.10.250:/www .
    
    # Send a single file to your root directory
    scp localfile.txt root@10.10.10.250:~/
    
    # Send a full directory to your root directory
    scp -r /some_path root@10.10.10.250:~/
    

    