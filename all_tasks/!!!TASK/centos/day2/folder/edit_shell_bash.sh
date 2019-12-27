#!/bin/bash
cp /etc/passwd /root/passwd_bash.copy
cd /root
cat passwd_bash.copy | while read i; do echo ${i//games:\/sbin\/nologin/games:\/bin/bash};done > newfile; mv newfile passwd_bash.copy
