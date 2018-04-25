# Configure Access Point

## Security Vulnerability

I found in the version `Ω-ware: 0.2.0 b183` of the Omega2+ there's a pretty bad security vulnerability. After install the access point remains open `Omega-####`.  The Omega2+ will act as a repeater allowing anyone with the default password full access to your LAN and external network.

## Replication

* Do a clean install of `Ω-ware: 0.2.0 b183`.
* Using the default password **12345678**, connect your client machine to the Omega's access point (AP) `Omega-####`.
* Setup connection to your local wifi network.
* Connect your client machine back to your local wifi network.
* Make sure you can ssh into your Omega and ping out of your network.
* Connect your client machine back to the Omega's AP.
* You should be able to browse your local network and your outside network.

The issue is if someone is looking at access points in your area, finds an `Omega-####` AP, with the default **12345678** password they can do whatever they want on your network.

## How to Fix

I created a script which you can use to change your Access Point SSID and password.

    wget https://raw.githubusercontent.com/pjobson/onion_omega2p_experiments/master/bin/access_point_settings.sh
    source access_point_settings.sh

It should be pretty clear what to do, just follow the instructions.

The script modifies the `wireless.ap.key` and `wireless.ap.ssid` settings.  When you're done messing around with it do a reboot.

    reboot && exit
    

