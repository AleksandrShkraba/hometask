#!/bin/bash
ssh root@$VM3 
"hostname >> my.txt;
hostname --ip-address >> my.txt;
exit"

ssh centos@$VM2
"scp root@VM3:/home/centos/my.txt /home/centos/;
hostname >> my.txt;
hostname --ip-address >> my.txt;
exit"

scp root@$VM2:/home/centos/my.txt /home/centos/;
hostname >> my.txt
hostname --ip-address >> my.txt
netstat -tulpan | grep :68 >> my.txt
sudo yum -y install bind-utils
dig epam.com NS | grep NS >> my.txt

touch test
chmod 777 test
scp test centos@$VM2:/home/centos/
ssh centos@$VM2
scp /home/centos/test root@$VM3:/home/centos/
exit
