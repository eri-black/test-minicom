#!/bin/bash

#editing welcome info
cp -f /opt/stand/scripts/motd /etc/motd

#creating user and saving his auth info to files
pass=$(makepasswd)
login=student$(( $RANDOM % 999 + 1 ))
echo "$(hostname) $login $pass" > /opt/stand/acc/$(hostname).txt
useradd -p $pass -m -s /bin/bash $login
echo $login:$pass | chpasswd

#ssh restarting
chown root:root /run/sshd
chmod 711 /run/sshd
service ssh restart

#getting access to the device
chmod ugo+rwx /dev/ttyUSB*

#anti-closing
tail -f /dev/null