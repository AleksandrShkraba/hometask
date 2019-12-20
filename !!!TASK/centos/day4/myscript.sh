#!/bin/bash
yum -y install java
wget --no-check-certificate -P ~/Downloads/ -c --header "Cookie: oraclelicense=accept-securebackup-cookie" https://download.oracle.com/otn-pub/java/jdk/12.0.2+10/e482c34c86bd4bf8b56c0b35558996b9/jdk-12.0.2_linux-x64_bin.tar.gz 
sudo mkdir /usr/lib/jvm
cd /usr/lib/jvm
sudo tar -xvzf ~/Downloads/jdk-12.0.2_linux-x64_bin.tar.gz
sudo alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-12.0.2/bin/ 2
yum -y install epel-release
yum -y install htop
sudo yum install -y yum-utils device-mapper-persistent-data lvm2
sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sudo yum -y install docker-ce-18.06.1.ce-3.el7.x86_64
systemctl enable docker
systemctl start docker
crontab -l | { cat; echo "5-30 12-15 * * 1 /bin/find /tmp -name "*.zip" -type f -delete"; } | crontab -
wget -P ~/Downloads/ https://fastdl.mongodb.org/linux/mongodb-linux-x86_64-rhel70-4.2.0.tgz
sudo yum -y install libcurl openssl
cd /opt/
tar -xvzf ~/Downloads/mongodb-linux-x86_64-rhel70-4.2.0.tgz
mkdir /data/db
chmod -R 0777 /data/
systemctl start mongodb


