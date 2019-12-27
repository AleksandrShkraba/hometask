#!/bin/bash
sudo yum -y install httpd
cat<<adding>> /etc/httpd/conf/httpd.conf
 <Proxy balancer://cluster>
	BalancerMember http://192.168.56.111:8080
	BalancerMember http://192.168.56.222:8080
	Order allow,deny
	Allow from all
 </Proxy>
 <VirtualHost *:80>
	ProxyPass / balancer://cluster/
	ProxyPassReverse / http://192.168.56.111:8080
	ProxyPassReverse / http://192.168.56.222:8080
 </VirtualHost>
adding
sudo systemctl start httpd
