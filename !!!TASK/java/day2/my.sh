#!/bin/bash
sudo yum -y install java-1.8.0-openjdk-devel
wget http://ftp.byfly.by/pub/apache.org/tomcat/tomcat-9/v9.0.26/bin/apache-tomcat-9.0.26.tar.gz
sudo tar -xf apache-tomcat-9.0.26.tar.gz -C /opt/
sudo chmod -R 777 /opt
sudo cp /vagrant/TestApp.war /opt/apache-tomcat-9.0.26/webapps/
/opt/apache-tomcat-9.0.26/bin/startup.sh
sleep 5s
/opt/apache-tomcat-9.0.26/bin/shutdown.sh
sudo cp /vagrant/*.jar /opt/apache-tomcat-9.0.26/webapps/TestApp/WEB-INF/lib/
sudo cp /vagrant/my_error /opt/apache-tomcat-9.0.26/webapps/TestApp/
sed -i '/<servlet-name>GenericServlet<\/servlet-name>/a <multipart-config><\/multipart-config>' /opt/apache-tomcat-9.0.26/webapps/TestApp/WEB-INF/web.xml
sed -i '/<\/web-app>/i <error-page><error-code>500<\/error-code><location>\/my_error<\/location><\/error-page>' /opt/apache-tomcat-9.0.26/webapps/TestApp/WEB-INF/web.xml
sed -i 's/JPDA_ADDRESS="localhost:8000"/JPDA_ADDRESS="localhost:5005"/' /opt/apache-tomcat-9.0.26/bin/catalina.sh
/opt/apache-tomcat-9.0.26/bin/catalina.sh jpda start
(echo classes) | jdb -attach 5005
