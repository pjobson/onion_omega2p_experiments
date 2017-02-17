# Setting Up an SDCARD for `/root` and swap for Onion Omega2+

Generally on OpenWrt I like to mount a USB flash drive at `/root` for file and script storage.  This is loosely based on various tutorials on the [OpenWRT Wiki](https://wiki.openwrt.org/).

This was tested on a Onion Omega2+, but will probably work on the Omega2.  I do not have access to an Omega1 to test it.

## Install Packages

    opkg update
    opkg install fdisk
    opkg install kmod-fs-ext4
    opkg install e2fsprogs

Optional installations.

    opkg install nano
    opkg install vim

## Finding the SDCARD

Then insert your sdcard and find it.

    fdisk -l

There will be several entries, you are looking for something like this.  I'm using an 8GB SD card, it recognizes it as 7.2 GiB.

    Disk /dev/mmcblk0: 7.2 GiB, 7746879488 bytes, 15130624 sectors
	Units: sectors of 1 * 512 = 512 bytes
	Sector size (logical/physical): 512 bytes / 512 bytes
	I/O size (minimum/optimal): 512 bytes / 512 bytes
	
Take note of the `/dev/mmcblk0` or whatever yours shows.  If you use the wrong one you can screw up your device.

## Showing Free Memory and Swap

    free

Should display something like this, note the swap currently shows `0 `for all entries.

                        total       used       free     shared    buffers     cached
    Mem:               125764      34096      91668        200       4024      12736
    -/+ buffers/cache:  17336     108428
    Swap:                   0          0          0


## Create two Partitions

You will need to create two partitions on your SDCARD.

If your SDCARD already has a partition, it will show an error, which you can ignore.

    fdisk /dev/mmcblk0

**This section has several inputs which you'll need to make, I noted them in the code sections with `⟵⟵⟵`.**

Once in the `fdisk` program it will prompt you with this.  I recommend hitting `m` to see the commands available.

    Command (m for help):

You'll probably want to start with `F` to determine how much free space you have.  I'm using an 8GB SDCARD, it shows:

    Command (m for help): F ⟵⟵⟵
    Unpartitioned space /dev/mmcblk0: 7.2 GiB, 7745830912 bytes, 15128576 sectors
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes

    Start      End  Sectors  Size
     2048 15130623 15128576  7.2G

Next up, create a 2GB `swap` partition with the `n` command.  You will need to make several entries.

    Command (m for help): n ⟵⟵⟵
    Partition type
    p   primary (0 primary, 0 extended, 4 free)
    e   extended (container for logical partitions)
    Select (default p): p ⟵⟵⟵
    Partition number (1-4, default 1): 1 ⟵⟵⟵
    First sector (2048-15130623, default 2048): 2048 ⟵⟵⟵
    Last sector, +sectors or +size{K,M,G,T,P} (2048-15130623, default 15130623): +2G ⟵⟵⟵

    Created a new partition 1 of type 'Linux' and of size 2 GiB.

Now create the partition you'll use for `/root`, again with the `n` command, unless you are doing something special, you may just hit enter fore each of the prompts, I marked them anyway.

    Command (m for help): n ⟵⟵⟵
    Partition type
       p   primary (1 primary, 0 extended, 3 free)
       e   extended (container for logical partitions)
    Select (default p): p ⟵⟵⟵
    Partition number (2-4, default 2): 2 ⟵⟵⟵
    First sector (4196352-15130623, default 4196352): 4196352 ⟵⟵⟵
    Last sector, +sectors or +size{K,M,G,T,P} (4196352-15130623, default 15130623): 15130623 ⟵⟵⟵

    Created a new partition 2 of type 'Linux' and of size 5.2 GiB.

Set the `swap` partition type to swap with the `t` command.  Again you will need to make several entries.

    Command (m for help): t ⟵⟵⟵
    Partition number (1,2, default 2): 1 ⟵⟵⟵
    Partition type (type L to list all types): 82 ⟵⟵⟵

    Changed type of partition 'Linux' to 'Linux swap / Solaris'.

You may now print the partition table with the `p` command to verify what you have done.  It should show something like this.

    Command (m for help): p ⟵⟵⟵
    Disk /dev/mmcblk0: 7.2 GiB, 7746879488 bytes, 15130624 sectors
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disklabel type: dos
    Disk identifier: 0x95cb5374

    Device         Boot   Start      End  Sectors  Size Id Type
    /dev/mmcblk0p1         2048  4196351  4194304    2G 82 Linux swap / Solaris
    /dev/mmcblk0p2      4196352 15130623 10934272  5.2G 83 Linux

If all looks good, write the partition with the `w` command.

    Command (m for help): w ⟵⟵⟵
    The partition table has been altered.
    Calling ioctl() to re-read partition table.
    Syncing disks.

This will drop you back to the shell, run `fdisk` again and you should see your partitions have changed and shows something like this.

    Disk /dev/mmcblk0: 7.2 GiB, 7746879488 bytes, 15130624 sectors
    Units: sectors of 1 * 512 = 512 bytes
    Sector size (logical/physical): 512 bytes / 512 bytes
    I/O size (minimum/optimal): 512 bytes / 512 bytes
    Disklabel type: dos
    Disk identifier: 0x95cb5374

    Device         Boot   Start      End  Sectors  Size Id Type
    /dev/mmcblk0p1         2048  4196351  4194304    2G 82 Linux swap / Solaris
    /dev/mmcblk0p2      4196352 15130623 10934272  5.2G 83 Linux

Take note of your `Linux swap` and `Linux` partition Devices.

## Format the SDCARD

Format your `Linux` partition as ext4.

    mkfs.ext4 /dev/mmcblk0p2

This will take a minute and output something like the following.

    mke2fs 1.43.3 (04-Sep-2016)
    Creating filesystem with 1366784 4k blocks and 342048 inodes
    Filesystem UUID: 8d86e910-080a-41f2-b4da-bb66c425fe9d
    Superblock backups stored on blocks:
        32768, 98304, 163840, 229376, 294912, 819200, 884736

    Allocating group tables: done
    Writing inode tables: done
    Creating journal (16384 blocks): done
    Writing superblocks and filesystem accounting information: done

Format your `Linux swap` partition and enable the swap.

    mkswap /dev/mmcblk0p1
    swapon /dev/mmcblk0p1

## View Swap Space

Again use the `free` command.

    free -k

It should now show your updated swap space.

            total       used       free     shared    buffers     cached
    Mem:   125764      30172      95592        200       4028       7488
    -/+ buffers/cache: 18656     107108
    Swap: 2097148          0    2097148

You may also use the `swapon` command to show your swap space.

    swapon -s

This should display something like this.

    Filename          Type        Size       Used   Priority
    /dev/mmcblk0p1    partition   2097148    0      -1


## Mount the `/root` Partition

If you have anything in your `/root` currently, move it to `/tmp`.

    mkdir /tmp/root_temp
    mv /root/* /tmp/root_temp

Mount the drive and try writing to it.

    mount /dev/mmcblk0p2 /root
    cd /root
    echo "test" > test.txt
    cat test.txt

This should display `test`.  Now you can move your stuff back from `/tmp` to `/root`.

    mv /tmp/root_temp/* /root
    rmdir /tmp/root_temp/

### Mount the SDCARD at Boot

Enable the fstab.

    /etc/init.d/fstab enable

Detect the mounts.

    block detect > /etc/config/fstab
    cat /etc/config/fstab

This should display something similar to this, take note of your `uuid`, they are always different.

    config 'global'
        option  anon_swap   '0'
        option  anon_mount  '0'
        option  auto_swap   '1'
        option  auto_mount  '1'
        option  delay_root  '5'
        option  check_fs    '0'

    config 'swap'
        option  device  '/dev/mmcblk0p1'
        option  enabled '0'

    config 'mount'
        option  target  '/mnt/mmcblk0p2'
        option  uuid    'YOUR-UUID-HERE'
        option  enabled '0'


You'll want to edit the fstab. I use vi, but you may use `nano`.

    vi /etc/config/fstab
    
Make it look like this.

    config 'global'
        option  anon_swap   '0'
        option  anon_mount  '0'
        option  auto_swap   '1'
        option  auto_mount  '1'
        option  delay_root  '5'
        option  check_fs    '0'

    config 'swap'
        option  device  '/dev/mmcblk0p1'
        option  enabled '1'

    config 'mount'
        option  target  '/root'
        option  uuid    'YOUR-UUID-HERE'
        option  enabled '1'

Reboot and exit.

    reboot && exit

SSH back into the unit and make sure the mount worked

    df -h

Should show something like this.

    Filesystem                Size      Used Available Use% Mounted on
    /dev/root                 5.5M      5.5M         0 100% /rom
    tmpfs                    61.4M    184.0K     61.2M   0% /tmp
    /dev/mtdblock6           25.1M      3.7M     21.4M  15% /overlay
    overlayfs:/overlay       25.1M      3.7M     21.4M  15% /
    tmpfs                   512.0K         0    512.0K   0% /dev
    /dev/mmcblk0p2            5.1G     20.9M      4.8G   0% /root

Then check the swap.

    swapon -s

Should still display something like this.

    Filename            Type        Size      Used   Priority
    /dev/mmcblk0p1      partition   2097148   0      -1

You may re-check your free space.

    free

Should display something like this.

                 total       used       free     shared    buffers     cached
    Mem:        125764      35868      89896        200       5256      12732
    -/+ buffers/cache:      17880     107884
    Swap:      2097148          0    2097148

You are done.

...