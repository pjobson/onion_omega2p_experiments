# Add expanded repo to distfeeds
echo "src/gz reboot_base http://downloads.lede-project.org/snapshots/packages/mipsel_24kc/base" >> /etc/opkg/distfeeds.conf
# Update OPKG
opkg update
# BASH
opkg install bash
# GIT
opkg install git git-http ca-bundle
# Core Utils
opkg install coreutils coreutils-sleep
# NANO & VIM
opkg install nano vim-full
# USBUTILS
opkg install usbutils

