#!/bin/bash

#dentify the current USB devices (hint. : lsusb)
lsusb
	
#Count how many CPUs (cores) on your device. (hint: /proc/cpuinfo)
cat /proc/cpuinfo | grep processor | wc -l

#Take a snapshot of current disk statistics 5 times with 2 seconds interval. (hint: iostat)
iostat 2 5

#measure the network activities using (hint: nicstat)
nicstat

#List current PCI devices on your device (hint: lspci)
lspci

#List all files which are compressed by ZIP utilities
ls -l *.zip
	
#Using grep and  regex list all lines containing hex numbers on a /var/log/syslog
grep -e "0x" /var/log/syslog
