# Experiments and Notes for Onion Omega2+

I exclusively use `vi` in this documentation, you may substitute `nano` after installing it.

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

## Generate SSH Keys

    mkdir ~/.ssh/id_rsa
    dropbearkey -t rsa -f ~/.ssh/id_rsa
    dropbearkey -y -f ~/.ssh/id_rsa | sed -n 2p > ~/.ssh/id_rsa.pub

## Setting Up Git

Full readme here: [docs/git_setup.md](docs/git_setup.md)

## Setting Up SDCARD for `/root` and SWAP

Full readme here: [docs/setting_up_sdcard_for_root_and_swap.md](docs/setting_up_sdcard_for_root_and_swap.md)

