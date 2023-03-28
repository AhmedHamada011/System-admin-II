#!/bin/bash

#Using Loop devices, create 4  PVs
dd if=/dev/zero of=/tmp/disk1.img bs=1024 count=100000
dd if=/dev/zero of=/tmp/disk2.img bs=1024 count=100000
dd if=/dev/zero of=/tmp/disk3.img bs=1024 count=100000
dd if=/dev/zero of=/tmp/disk4.img bs=1024 count=100000

losetup /dev/loop1 /tmp/disk1.img
losetup /dev/loop2 /tmp/disk2.img
losetup /dev/loop3 /tmp/disk3.img
losetup /dev/loop4 /tmp/disk4.img

pvcreate /dev/loop1
pvcreate /dev/loop2
pvcreate /dev/loop3
pvcreate /dev/loop4

#create VG and add 3 on PVs to it
vgcreate VG0 /dev/loop1 /dev/loop2 /dev/loop3
	
#create LV which has size of 250M
lvcreate -L 250M VG0

#format LV using ext4
mkfs.ext4 /dev/VG0/lvol0

#mount LV into /mnt directory
mount /dev/VG0/lvol0 /mnt
	
#extend VG with the remaining PV
vgextend VG0 /dev/loop4

#extend LV with +50M
lvextend  /dev/VG0/lvol0 -L +50M

#resize2fs LV with the 50M extra
resize2fs /dev/VG0/lvol0 +50M


#Display the network interface information using ip command
ip a
	
#Display currently active TCP connections on your OS using netstatcommand
netstat -a
	
#Display currently open ports on your system using nmap command (install it using apt)
nmap 192.168.1.50

