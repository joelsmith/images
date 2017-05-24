#!/usr/bin/bash

grep -q '^user:' /etc/passwd || echo "user:x:$(id -u):0:USER:/root:/bin/bash" >> /etc/passwd
grep -q '^group:' /etc/group || echo "group:x:$(id -G | awk '{print $2}'):user" >> /etc/group

# get initial content for /var/www/html
GIT_DIR=/srv/git/security_meeting.git /root/postreceive.sh

LANG=C /usr/sbin/httpd -DFOREGROUND
