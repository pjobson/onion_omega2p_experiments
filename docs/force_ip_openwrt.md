# Forcing an IP Address in an OpenWRT Router

If you use an OpenWRT router and probably other routers you can setup a Static Lease to bind the Omega's MAC address to a specific IP.  This makes it easy to find your device on the network, if you happen to forget the IP address.

Login to your router's web interface and navigate to **Network** ⟶ **DHCP and DNS**.  Here at the bottom you should see *Static Leases* and you can add your Omega's specific MAC address and an IP address on your network.  Here is mine for example, you can see I have a server and a printer listed in there as well.

![Static Leases](../images/screenshot_49.png)

After you bind the MAC to the IP address, hit Save & Apply then reboot or power cycle your Omega.

## Finding Your MAC

The MAC address should be diplayed on top of the unit as a series of letters and numbers. On rare ocasions that is incorrect.

From the command line you can do:

    root@Omega-6031:~# ifconfig
    
    ##### LOOK FOR SOMETHING LIKE THIS #####
    apcli0    Link encap:Ethernet  HWaddr 40:A3:6B:C0:60:32
              inet addr:10.10.10.144  Bcast:10.10.10.255  Mask:255.255.255.0
              inet6 addr: fe80::42a3:6bff:fec0:6032/64 Scope:Link
              UP BROADCAST RUNNING MULTICAST  MTU:1500  Metric:1
              RX packets:0 errors:0 dropped:5 overruns:0 frame:0
              TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
              collisions:0 txqueuelen:1000
              RX bytes:0 (0.0 B)  TX bytes:0 (0.0 B)

This device for example the MAC on the top reads: `40A36BC06031`, but the `HWaddr` is different. I'm not certain why this is.
