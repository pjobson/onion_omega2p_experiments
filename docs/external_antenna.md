# External Antenna

You can add an external antenna to the device with the IPX jack on the main unit.

![IPX Jack](../images/omega2-IPX.jpg)

You can convert it to a standard wifi antenna with an **IPX to RP-SMA adapter**.  You can get these on [Amazon - ipx to rp-sma](https://goo.gl/yXCly5) or [eBay - ipx to rp-sma](https://goo.gl/BwT5Vr) or various other places.  

![IPX to RP-SMA](../images/ipx-to-rp-sma.jpg)

Otherwise you can use an IPX antenna, I used this one which I had laying around and afixed the antenna to the bottom of the unit.  You can get IPX antennas also from again [Amazon - IPX antenna](https://goo.gl/pWwB2Q) or [eBay - IPX antenna](https://goo.gl/uabwr6) or various other places.

![IPX Modification](../images/ipx-mod.jpg)

I got a decent speed increase using [speedtest-cli](https://github.com/sivel/speedtest-cli) after adding the external antenna.

Before external antenna.

	root@Omega-ADBD:/tmp# ./speedtest-cli
	Retrieving speedtest.net configuration...
	Testing from Verizon Fios (xxx.xxx.xxx.xxx)...
	Retrieving speedtest.net server list...
	Selecting best server based on ping...
	Hosted by Shentel Service Company (Ashburn, VA) [7.69 km]: 21.32 ms
	Testing download speed................................................................................
	Download: 10.16 Mbit/s
	Testing upload speed....................................................................................................
	Upload: 11.48 Mbit/s


After external antenna.

	root@Omega-ADBD:/tmp# ./speedtest-cli
	Retrieving speedtest.net configuration...
	Testing from Verizon Fios (xxx.xxx.xxx.xxx)...
	Retrieving speedtest.net server list...
	Selecting best server based on ping...
	Hosted by GigeNET (Ashburn, VA) [7.69 km]: 24.893 ms
	Testing download speed................................................................................
	Download: 16.73 Mbit/s
	Testing upload speed....................................................................................................
	Upload: 10.14 Mbit/s
