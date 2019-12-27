#!/bin/bash
setenforce 0
sudo systemctl stop firewalld
sudo yum -y install epel-release
sudo yum -y install nginx
sudo yum -y install tomcat

cat<<add>/etc/nginx/nginx.conf
worker_processes  1;
events {
    worker_connections  1024;
}
http{
include mime.types;
default_type application/octet-stream;
server {
  listen          80;
  server_name     192.166.56.222;
  root            /var/lib/tomcat/webapps/;

  location / {
        proxy_pass http://127.0.0.1:8080/;
  }
}
add

cat <<add> /var/lib/tomcat/webapps/deploy-info.txt
Deployment time: `date`
Deploy User: Aleksandr_Shkraba
add

yum install -y maven git
git clone https://github.com/sbeliakou/hello-war.git
echo -e "Build time: `date`\nBuild Machine Name:EPBYMINWW5961\nBuild User Name:Aleksandr_Shkraba" > build-info.txt
cd hello-war/
cp ../build-info.txt src/main/resources/build-info.txt
mvn clean package -DbuildNumber=1
cp target/mnt-lab.war /var/lib/tomcat/webapps/

systemctl start nginx
systemctl start tomcat
systemctl enable nginx
systemctl enable tomcat

