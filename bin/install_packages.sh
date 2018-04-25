# Add expanded repo to distfeeds
echo "src/gz reboot_base http://downloads.lede-project.org/snapshots/packages/mipsel_24kc/base" >> /etc/opkg/distfeeds.conf

# Update OPKG
opkg update

# BASH
wget https://raw.githubusercontent.com/pjobson/onion_omega2p_experiments/master/bin/set_shell_to_bash.sh
source set_shell_to_bash.sh

# GIT
opkg install git git-http ca-bundle

# NANO & VIM
opkg install nano vim-full

# USBUTILS
opkg install usbutils

