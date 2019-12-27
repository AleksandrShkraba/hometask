#!/bin/bash
modules=( mod_authn_alias.so mod_authn_default.so mod_authz_default.so mod_authz_default.so mod_ldap.so mod_authnz_ldap.so mod_disk_cache.so )
for i in ${modules[@]}; do sed -i '/'$i'/s/^/#/' /etc/httpd/conf/httpd.conf;
done
sed -i 's/^##*/#/' /etc/httpd/conf/httpd.conf

if httpd -V | grep MPM; 
then echo "everything ok"; 
else 
cat<<add>> /etc/httpd/conf/httpd.conf

Include conf.modules.d/*.conf

add
fi

if grep -q ServerName /etc/httpd/conf/httpd.conf; then
 echo "It's OK";
else echo "ServerName localhost" >> /etc/httpd/conf/httpd.conf; 
fi

systemctl stop bindserver
systemctl disable bindserver

sed -i '/<VirtualHost \*:80>/,/<\/VirtualHost>/d' /etc/httpd/conf/httpd.conf

sed -i '/init 6/d' /etc/rc.d/init.d/tomcat
sed -i 's/> \/dev\/null//g' /etc/rc.d/init.d/tomcat
sed -i 's/tomcat\/\/current/tomcat\/current/g' /etc/rc.d/init.d/tomcat
sed -i '/status()/,/}/d' /etc/rc.d/init.d/tomcat

sed -i '/export/s/^/#/' /home/tomcat/.bashrc
sed -i 's/^##*/#/' /home/tomcat/.bashrc
sed -i '/CATALINA/s/^/#/' /etc/environment
sed -i '/CATALINA/s/^.#/#/' /etc/environment
sed -i '/JAVA/s/^/^#/' /etc/environment
sed -i '/JAVA/s/^.#/#/' /etc/environment
sed -i 's/^##*/#/' /etc/environment
unset CATALINA_HOME
unset JAVA_HOME

sed -i 's/mntlab/*/' /etc/httpd/conf.d/vhost.conf

sed -i 's/worker-jk@ppname/tomcat\.worker/g' /etc/httpd/conf.d/workers.properties

(echo 1) | alternatives --config java

chmod +x /opt/apache/tomcat/current/bin/catalina.sh
chown -R tomcat: /opt/apache/

(echo 1) | alternatives --config java

sed -i 's/192.168.56.10/192.168.56.100/g' /opt/apache/tomcat/current/conf/server.xml
systemctl enable tomcat
systemctl start tomcat
systemctl restart httpd
systemctl enable httpd

iptables -F
iptables -P INPUT DROP
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -i lo -j ACCEPT
chattr -i -a /etc/sysconfig/iptables
service iptables save

