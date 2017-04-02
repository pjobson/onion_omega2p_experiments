# INSTALL BASH
opkg update
opkg install bash

# SET SHELL TO BASH
sed -i 's/\/ash/\/bash/' /etc/passwd

