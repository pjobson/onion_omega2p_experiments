# Experiments and Notes for Onion Omega2+

This repo will contain experiments I do with my Omega2+ as well as some notes for doing various things.

I exclusively use `vi` in this documentation, you may substitute `nano` after installing it.

My Omega's IP address is shown in examples here as `10.10.10.250`, you'll need to substitute your own IP address.

My client machine is OSX or Linux, I don't really know how to do anything on Windows any more, I have not really used MS products since WinXP.  These instructions are geared toward using the shell in those operating systems, you can install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and Linux in your Windows OS and play along if you'd like.

## Experiments

I've just been messing with the OS, there's nothing here yet.

Eventually you'll be able to clone this to your Omega and mess around with it.

## Wifi Setup from Command Line

This section describes connecting to the device's wifi network and connecting to it via SSH.  This is useful if you do not want to mess around with the Web UI.

[docs/wifi_setup_from_command_line.md](docs/wifi_setup_from_command_line.md)

## SSH (After Wifi Setup)

### Default Login / Password

If your device is going to be in the wild, be sure to change your password.

* Username: root
* Password: onioneer

Log in to your device.

    ssh root@10.10.10.250

### Generate SSH Keys

    mkdir ~/.ssh
    dropbearkey -t rsa -f ~/.ssh/id_rsa

If you already generated an rsa key perhaps stored on an SD card, you may get the following error.

	Generating key, this may take a while...
	Couldn't create new file /root/.ssh/id_rsa: File exists
	Exited: Failed to generate key.

Don't worry, just continue on.

    dropbearkey -y -f ~/.ssh/id_rsa | sed -n 2p > ~/.ssh/id_rsa.pub

### SSH to Omega without Password

On your client machine, if you have not, generate a public and private key with `ssh-keygen`.  You may set a password if you'd like.

    ssh-keygen

Now cat the client's `id_rsa.pub` into your Omega, you'll need to change my IP to yours here.

    cat ~/.ssh/id_rsa.pub | ssh root@10.10.10.250 'cat >> /etc/dropbear/authorized_keys'

This will prompt for your Omega's password then throw an error, you can ignore the error.

    root@10.10.10.250's password:
    shell-init: error retrieving current directory: getcwd: cannot access parent directories: Not a tty

Now when you ssh from the client to the Omega it should not prompt you.

    root@10.10.10.250

## Update Firmware from Command Line

[docs/update_firmware_from_command_line.md](docs/update_firmware_from_command_line.md)

## Forcing an IP Address in an OpenWRT Router

[docs/force_ip_openwrt.md](docs/force_ip_openwrt.md)

## Install Some Packages

### Update the Package Manager

    opkg update

### Install GIT

    opkg install git git-http ca-bundle

### Install a Better Text Editor

    opkg install vim
    ### --- OR --- ###
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

## Create Your .profile

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

## Installing Console from Command Line

Now that your Omega is all setup and ready to go, you can install the console if you fancy a GUI/Web Interface. Run the following commands:

	uci set onion.console.setup=1
	uci set onion.console.install=2
	uci commit onion

Information on using the console is available from Onion at [Accessing the Console](https://docs.onion.io/omega2-docs/accessing-the-console.html).

## Setting Up Git

If you want to use git and be able to do pushes and commits from your device you should follow these instructions.

[docs/git_setup.md](docs/git_setup.md)

## Setting Up SDCARD for `/root` and SWAP

[docs/setting_up_sdcard_for_root_and_swap.md](docs/setting_up_sdcard_for_root_and_swap.md)

## Install & Setup Node.js

[docs/install_node_js.md](docs/install_node_js.md)
    
## File Transfer with SCP

To send/receive files to/from the device I recommend using `scp`, you'll want to substitute your device's IP for the one I have listed.

    # Receive a single file from your etc to your local machine
    scp root@10.10.10.250:/etc/openwrt_release .
    
    # Receive a full directory from /www to your local machine
    scp -r root@10.10.10.250:/www .
    
    # Send a single file to your root directory
    scp localfile.txt root@10.10.10.250:~/
    
    # Send a full directory to your root directory
    scp -r /some_path root@10.10.10.250:~/
    

## External Antenna

[docs/external_antenna.md](docs/external_antenna.md)