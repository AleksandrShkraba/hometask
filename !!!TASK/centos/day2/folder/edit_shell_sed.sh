#!/bin/bash
cp /etc/passwd /root/passwd_sed.copy
cd /root 
sed -i -e '/games/s/\/sbin\/nologin/\/bin/\bash/' passwd_sed.copy
