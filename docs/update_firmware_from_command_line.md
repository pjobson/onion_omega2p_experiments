# Update Firmware from Command Line

**As of version 0.1.9-b158 updating your firmware will wipe your device.**

The update images for the device are hosted on [onion.io](http://repo.onion.io/omega2/images/).  You can use `oupgrade` to automagically update your firmware.

    oupgrade --help
    
    Functionality:
      Check if new Onion firmware is available and perform upgrade

    Usage: /usr/bin/oupgrade

    Arguments:
     -h, --help        Print this usage prompt
     -v, --version     Just print the current firmware version
     -l, --latest      Use latest repo version (instead of stable version)
     -f, --force       Force the upgrade, regardless of versions
     -c, --check       Only compare versions, do not actually update
     -u, --ubus        Script outputs only json

You can force upgrade to a specific version with `sysupgrade`.  At this writing `v0.1.9-b157` was the latest version.

    wget -P /tmp http://repo.onion.io/omega2/images/omega2p-v0.1.9-b157.bin 
    sysupgrade -n /tmp/omega2p-v0.1.9-b157.bin

This will output something like this and eventually your connection will be broken.

    killall: watchdog: no process killed
    Sending TERM to remaining processes ... uhttpd device-client avahi-daemon onion-helper udhcpc udhcpc packet_write_wait: 
    Connection to 10.10.10.250 port 22: Broken pipe
    
Don't turn the device off while it is updating or you could brick it.  There is an article on possibly unbricking your device on the [community page](https://community.onion.io/topic/1154/omega-2-usb-firmware-install-after-brick-resolved/4).

After you update you will need to delete the device from your local `~/.ssh/known_hosts` file.