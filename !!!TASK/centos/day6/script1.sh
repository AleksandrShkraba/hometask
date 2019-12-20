#!/bin/bash

VM1="10.6.145.116"
VM2="10.6.145.118"
VM3="10.6.144.23"


ssh centos@$VM2
"sudo -t chmod 606 /etc/ssh/sshd_config;
cat << my >> /etc/ssh/ssh_config
Host *
Port 23
User centos
my
systemctl restart sshd;
exit"

ssh centos@$VM3
"sudo -t chmod 606 /etc/ssh/sshd_config;
cat << my >> /etc/ssh/ssh_config
Host *
Port 24
PermitRootLogin yes
User centos
my
systemctl restart sshd;
exit"

ssh -p 24 root@$VM3
"iptables -I INPUT -s $VM1 -p tcp --dport 24 -j REJECT;
service iptables save;
service iptables restart;
exit"

sudo chmod 606 /etc/ssh/ssh_config
cat << my >> /etc/ssh/ssh_config
Host $VM2
Hostname $VM2
User centos
Port 23

Host $VM3
Hostname $VM3
User root
Port 24
ProxyCommand ssh -W %h:%p -i /home/centos/.ssh/id_rsa -p 23 centos@$VM2
my







