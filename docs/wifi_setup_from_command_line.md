# Wifi Setup from Command Line

## Connect to Wifi Network

Plug your Omega in and from your computer connect to the wifi network it created.  It will usually be *Omega-XXXX*, where XXXX is the last four letters of your MAC address as shown on top of the device.  The password for this network is `12345678`.

## SSH Into Device

Then SSH into it.  The standard IP address is always `192.168.3.1`, the default password is always `onioneer`.

    ssh root@192.168.3.1

### SSH Host Identification Error

If you have shelled into that IP before you will get the following error.

	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	@    WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED!     @
	@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	IT IS POSSIBLE THAT SOMEONE IS DOING SOMETHING NASTY!
	Someone could be eavesdropping on you right now (man-in-the-middle attack)!
	It is also possible that a host key has just been changed.
	The fingerprint for the RSA key sent by the remote host is
	SHA256:LJ/ODrlh30b/qpEMFFbuI1Foz2gWIJu/zsx5w9L+xBY.
	Please contact your system administrator.
	Add correct host key in /Users/pjobson/.ssh/known_hosts to get rid of this message.
	Offending RSA key in /Users/pjobson/.ssh/known_hosts:10
	RSA host key for 192.168.3.1 has changed and you have requested strict checking.
	Host key verification failed.

To remove your key, either edit your client's `~/.ssh/known_hosts` file or run.

	ssh-keygen -R 192.168.3.1
	ssh root@192.168.3.1

## Wifi Setup

You can use the `wifisetup` command to configure your wifi without the web interface.

    root@Omega-ADBD:~# wifisetup
    Onion Omega Wifi Setup

    Select from the following:
    1) Scan for Wifi networks
    2) Type network info
    q) Exit

    Selection:

If you are not hiding your SSID, select `1`, otherwise you can manually enter it with `2`.

    Selection: 1
    Scanning for wifi networks...

    Select Wifi network:
    1) Neighbor's Network 1
    2) Neighbor's Network 2
    3) Neighbor's Network 3
    4) Neighbor's Network 4
    5) Whatever You Named Your Network
    6) Neighbor's Network 5
    7) Neighbor's Network 6
    8) Neighbor's Network 7

Select your network.

    Selection: 5
    Network: Whatever You Named Your Network
    Authentication type: WPA2PSK
    Enter password: Your_Password_Here

    > Restarting wifimanager for changes to take effect

This sometimes takes a bit to get an IP address, after it is done just reboot and exit to your shell.  You can use the `&&` to run a second command after the first is complete.

    reboot && exit

This should bring the device back up on your regular network.