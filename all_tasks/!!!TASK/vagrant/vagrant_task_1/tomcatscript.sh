#!/bin/bash
sudo yum -y install java-1.8.0-openjdk tomcat
cp /vagrant/clusterjsp.war /var/lib/tomcat/webapps/
sudo chmod 777 /var/lib/tomcat/webapps/clusterjsp.war
sudo systemctl start tomcat


