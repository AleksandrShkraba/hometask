#!/bin/bash
useradd super_user
 
cat<<adding>> /etc/sudoers
super_user ALL=(ALL) NOPASSWD: ALL
adding

runuser -l super_user -c 'for i in {1..20}; do sudo groupadd -g $((7000+$i)) "user"$i; sudo useradd -d "/home/user"$i -c "myuser"$i -p "123321" -u $((9000+$i)) -g $((7000+$i)) -s /bin/sh "user"$i;
done'

for i in {1..20}; do echo -e "123321\Epam_2011\Epam_2011" | passwd "user"$i --stdin
done

groupadd even;
groupadd odd;

for i in {1..20};do
    if (( $i % 2 )); then
        usermod -a -G odd "user"$i
    else
        usermod -a -G even "user"$i
    fi
done

yum install -y finger

for i in {1..20}; do
finger "user"$i | grep  -e Directory -e Login -e Last >> /tmp/user.info
done

cat<<my> /home/user1/user_name.sh
#!/bin/bash
whoami 
echo "!!!!!!!!!!!!result of paragraph 9!!!!!!!!!!!!!!!!!"
my

chmod 0705 -R /home/user1
chmod 0707 -R /home/user3

runuser -l user2 -c 'cp /home/user1/user_name.sh /home/user3/; cd /home/user3; ./user_name.sh'

sed -i 's/'SELINUX=enforcing'/'SELINUX=permissive'/g' /etc/selinux/config
setenforce 0

grep super_user /etc/sudoers

for i in {1..20}; do grep "user"$i /etc/passwd
done

grep even /etc/group
grep odd /etc/group

cat /tmp/user.info

sestatus | grep permissive

