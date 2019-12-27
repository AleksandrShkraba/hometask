sudo yum install -y gcc gcc-c++ git
sudo yum install -y pcre-devel httpd-tools
cd /tmp
mkdir git
cd git
git clone git://github.com/vozlt/nginx-module-vts.git
cd ~
wget http://ftp.pcre.org/pub/pcre/pcre-8.43.tar.gz
tar -zxf pcre-8.43.tar.gz -C /tmp
wget http://www.openssl.org/source/openssl-1.0.2t.tar.gz
tar -zxf openssl-1.0.2t.tar.gz -C /tmp	
wget http://nginx.org/download/nginx-1.16.1.tar.gz
tar zxf nginx-1.16.1.tar.gz -C /tmp
cd /tmp/nginx-1.16.1
sudo ./configure --prefix=/home/vagrant/nginx --sbin-path=/home/vagrant/nginx/sbin/nginx --conf-path=/home/vagrant/nginx/conf/nginx.conf --error-log-path=/home/vagrant/nginx/logs/error.log --http-log-path=/home/vagrant/nginx/logs/access.log --user=vagrant --pid-path=/home/vagrant/nginx/logs/nginx.pid --with-openssl=/tmp/openssl-1.0.2t --with-pcre=/tmp/pcre-8.43 --with-http_ssl_module --without-http_gzip_module --with-http_realip_module --add-module=/tmp/git/nginx-module-vts
make
sudo make install

cat<<add>/etc/systemd/system/nginx.service
[Unit]
Description=The NGINX HTTP server
After=syslog.target network.target remote-fs.target nss-lookup.target

[Service]
User=vagrant
Type=forking
PIDFile=/home/vagrant/nginx/logs/nginx.pid
ExecStartPre=/home/vagrant/nginx/sbin/nginx -t
ExecStart=/home/vagrant/nginx/sbin/nginx
ExecReload=/home/vagrant/nginx/sbin/nginx -s reload
ExecStop=/bin/kill -s QUIT $MAINPID
PrivateTmp=true

[Install]
WantedBy=multi-user.target
add
sudo chown -R vagrant. /home/vagrant
 
tar xzvf /vagrant/html.tar.gz -C /home/vagrant/nginx/html --strip-components=1
cp /vagrant/backend_2.conf /home/vagrant/nginx/conf/nginx.conf
htpasswd -b -c /home/vagrant/nginx/conf/.htpasswd admin nginx

sudo systemctl start nginx


