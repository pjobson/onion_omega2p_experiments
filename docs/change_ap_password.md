# Change Access Point Password

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

To fix this, you may either disable the access point or change the password to something which doesn't suck.

    vi /etc/config/wireless

Look for this:

    config wifi-iface 'ap'
    	option device 'radio0'
    	option mode 'ap'
    	option network 'wlan'
    	option ifname 'ra0'
    	option encryption 'psk2'
    	option key '12345678'
    	option disabled '0'
    	option ssid 'Omega-6031'

Here you can change the password (`key`) to something harder to guess than the default and/or you can disable the access point by changing `option disabled '0'` to `option disabled '1'`.
