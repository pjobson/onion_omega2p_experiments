# Experiments and Notes for Onion Omega2+

**NOTE:** These things are in order as to what I prefer, you do not have to do all or any of these.

## Table of Contents

* [Introduction](#intro)
* [Command Line](#cli)
* [Experiments](#experiments)
* [Helper Scripts](#helper_scripts)
* [Wifi Setup from Command Line](#wifi_setup_cli)
* [Installing Web Console from Command Line](#install_web_console_from_cli)
* [SSH (After Wifi Setup)](#ssh)
* [Configure Access Point](#configure_access_point)
* [Basic Upgrades](#basic_upgrades)
* [Setting Up SDCARD for /root and SWAP](#setting_up_sdcard)
* [Create Your Profile](#create_profile)
* [Setting Up Git](#setting_up_git)
* [Update Firmware from Command Line](#update_firmware_from_cli)
* [Forcing an IP Address in an OpenWRT Router](#static_lease)
* [Install & Setup Node.js](#install_node)
* [File Transfer with SCP](#file_transfer_with_scp)
* [External WiFi Antenna](#external_wifi_antenna)
* [Serial Connection](#serial_connection)

## <a name="intro"></a>Introduction

This repo will contain experiments I do with my Omega2+ as well as some notes for doing various things.

I exclusively use `vi` in this documentation, you may substitute `nano` after installing it.

My Omega's IP address is shown in examples here as `10.10.10.250`, you'll need to substitute your own IP address.

My client machine is OSX or Linux, I don't really know how to do anything on Windows any more, I have not really used MS products since WinXP.  These instructions are geared toward using the shell in those operating systems, you can install [VirtualBox](https://www.virtualbox.org/wiki/Downloads) and Linux in your Windows OS and play along if you'd like.

## <a name="cli"></a>Command Line

This is geard toward people who are used to working in Linux terminal environment. If you don't have much experience with this, I highly recommend you setup a Linux computer or Virutal Machine and experiment.  Checkout [LinuxCommand.org](http://linuxcommand.org/) to get you started.

One thing I found with rebooting, sometimes your local terminal can get locked up. When I reboot, I also exit:

    reboot && exit

## <a name="experiments"></a>Experiments

I've just been messing with the OS, there's nothing here yet.

Eventually you'll be able to clone this to your Omega and mess around with it.

## <a name="helper_scripts"></a>Helper Scripts

Description of scripts in the `bin/` path.

[docs/helper_scripts.md](docs/helper_scripts.md)

## <a name="wifi_setup_cli"></a>Wifi Setup from Command Line

This section describes connecting to the device's wifi network and connecting to it via SSH.  This is useful if you do not want to mess around with the Web UI.

[docs/wifi_setup_from_command_line.md](docs/wifi_setup_from_command_line.md)

## <a name="install_web_console_from_cli"></a>Installing Web Console from Command Line

Now that your Omega is all setup and ready to go, you can install the console if you fancy a GUI/Web Interface. Run the following commands:

	uci set onion.console.setup=1
	uci set onion.console.install=2
	uci commit onion

Information on using the console is available from Onion at [Accessing the Console](https://docs.onion.io/omega2-docs/accessing-the-console.html).

## <a name="ssh"></a>SSH (After Wifi Setup)

Infomation about connecting via SSH to the Omega after you've completed the wifi setup.

[docs/ssh.md](docs/ssh.md)

## <a name="configure_access_point"></a>Configure Access Point

[docs/configure_access_point.md](docs/configure_access_point.md)

## <a name="basic_upgrades"></a>Basic Upgrades

[docs/basic_upgrades.md](docs/basic_upgrades.md)

## <a name="setting_up_sdcard"></a>Setting Up SDCARD for `/root` and SWAP

Information about setting up your SDCARD to be used as your home directory and SWAP space.

[docs/setting_up_sdcard_for_root_and_swap.md](docs/setting_up_sdcard_for_root_and_swap.md)

## <a name="create_profile"></a>Create Your Profile

Information about creating a `.profile` file and adding some stuff to it.

[docs/create_profile.md](docs/create_profile.md)

## <a name="setting_up_git"></a>Setting Up Git

If you want to use git and be able to do pushes and commits from your device you should follow these instructions.

[docs/git_setup.md](docs/git_setup.md)

## <a name="update_firmware_from_cli"></a>Update Firmware from Command Line

[docs/update_firmware_from_command_line.md](docs/update_firmware_from_command_line.md)

## <a name="static_lease"></a>Forcing an IP Address in an OpenWRT Router

[docs/force_ip_openwrt.md](docs/force_ip_openwrt.md)

## <a name="install_node"></a>Install & Setup Node.js

[docs/install_node_js.md](docs/install_node_js.md)
    
## <a name="file_transfer_with_scp"></a>File Transfer with SCP

To send/receive files to/from the device I recommend using `scp`, you'll want to substitute your device's IP for the one I have listed.

    # Receive a single file from your etc to your local machine
    scp root@10.10.10.250:/etc/openwrt_release .
    
    # Receive a full directory from /www to your local machine
    scp -r root@10.10.10.250:/www .
    
    # Send a single file to your root directory
    scp localfile.txt root@10.10.10.250:~/
    
    # Send a full directory to your root directory
    scp -r /some_path root@10.10.10.250:~/
    

## <a name="external_wifi_antenna"></a>External WiFi Antenna

Using an external wifi antenna.

[docs/external_antenna.md](docs/external_antenna.md)

## <a name="serial_connection"></a>Serial Connection

[docs/serial_connection.md](docs/serial_connection.md)
