#!/bin/bash

AP_SSID=$(uci get wireless.ap.ssid)
AP_KEY=$(uci get wireless.ap.key)

echo 
echo "This program udpates settings for your Access Point (AP)."
echo 
echo "1> Change AP SSID"
echo "2> Change AP Password"
read -p "Select 1/2: " OPTION
echo

if [ $OPTION != "1" ] && [ $OPTION != "2" ] ; then
	echo "Um.. ${OPTION} is not a valid selection."
	exit
fi


case $OPTION in 
[1]*)
	echo "Change AP SSID"
	echo "  Current SSID: ${AP_SSID}"
	read -p "  New AP SSID: " NEW_SSID
	uci set wireless.ap.ssid="${NEW_SSID}"
	;;
[2]*)
	echo "Change AP Password"
	echo "  Current Password: ${AP_KEY}"
	read -p "  New AP Password: " NEW_PASSWORD
	uci set wireless.ap.key="${NEW_PASSWORD}"
	;;
*)
	exit
	;;
esac

echo
echo "Committing changes if any."
uci commit wireless
echo "Reloading wifi, this may take a minute."
wifi reload
echo

