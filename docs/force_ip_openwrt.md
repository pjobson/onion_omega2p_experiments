# Forcing an IP Address in an OpenWRT Router

If you use an OpenWRT router and probably other routers you can setup a Static Lease to bind the Omega's MAC address to a specific IP.  This makes it easy to find your device on the network, if you happen to forget the IP address.

Login to your router's web interface and navigate to **Network** ⟶ **DHCP and DNS**.  Here at the bottom you should see *Static Leases* and you can add your Omega's specific MAC address and an IP address on your network.  Here is mine for example, you can see I have a server and a printer listed in there as well.

![Static Leases](../images/screenshot_49.png)

After you bind the MAC to the IP address, hit Save & Apply then reboot or power cycle your Omega.