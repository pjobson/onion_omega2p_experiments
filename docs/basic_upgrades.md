# Basic Upgrades

## Update the Package Manager

    opkg update
    
## Helper Script

This helper script will automatically install a bunch of useful stuff for you.

    wget https://raw.githubusercontent.com/pjobson/onion_omega2p_experiments/master/bin/install_packages.sh
    cat install_packages.sh
    source install_packages.sh

## Install a Better Text Editor

    opkg install vim-full
    opkg install nano

## Install BASH

### Using Helper Script

    wget https://raw.githubusercontent.com/pjobson/onion_omega2p_experiments/master/bin/set_shell_to_bash.sh
    source set_shell_to_bash.sh

### Manually

    opkg update
    opkg install bash
    vi /etc/passwd

Change this:

    root:x:0:0:root:/root:/bin/ash

To this:

    root:x:0:0:root:/root:/bin/bash

Log out of the Omega's shell and log back in for this to take effect.  You may test with:

    echo $SHELL

## Upgrade to Lede

This is completely optional, you can use `opkg` to upgrade the `base-files` package which is: *This package contains a base filesystem and system scripts for OpenWrt.*

Not sure if this will negatively affect performance, I found it by accident.

    opkg list-upgradable
    opkg upgrade base-files



