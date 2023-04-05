#!/bin/bash


#Install ftpd service on your laptop
sudo apt install vsftpd
	
#enable port 21 and 20 (tcp) using iptables command using INPUT chain
sudo iptables -t filter -A INPUT -p tcp --dport 20 -j ACCEPT
sudo iptables -t filter -A INPUT -p tcp --dport 21 -j ACCEPT

#connect to ftp server (e.g: localhost) and browse the current directory
ftp localhost
ls

#enable ufw service
sudo ufw enable

#block port 21 and 21 (tcp) using ufw
sudo ufw deny 20/tcp
sudo ufw deny 21/tcp
#try to connect to ftp service.
ftp localhost

#capture the ufw log to detect the blocked operation
tail /var/log/kern.log

#install nfs service on your system
sudo apt install nfs-kernel-server

#enable nfs service on the firewall
sudo ufw allow 2049/tcp
sudo ufw allow 2049/udp

#create and share /tmp/shares folder using exportfs command  and /etc/exports file
mkdir /tmp/shares
cat "/tmp/shares *(rw)" >> /etc/exports
#mount the remote share on /mnt folder (you can using localhost as well)
	
#copy some files to the remote share
	
#save iptables rules to /tmp/iptables-backup file
sudo iptables-save > /tmp/iptables-backup

