#!/bin/bash
cp /etc/passwd /root/passwd_awk.copy
cd /root
awk '/games/{sub("/sbin/nologin","/bin/bash")}; {print $0}' passwd_awk.copy > tempfile
mv tempfile /root/passwd_awk.copy
