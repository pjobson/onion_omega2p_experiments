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

