FROM centos:centos7

# Pause indefinitely if asked to do so.
ARG OO_PAUSE_ON_BUILD
RUN test "$OO_PAUSE_ON_BUILD" = "true" && while sleep 10; do true; done || :

# creature comforts (make it feel like a normal linux environment)
ENV LANG=en_US.UTF-8 CONTAINER=docker HOME=/root TERM=xterm
EXPOSE 8080
WORKDIR /root
ADD root /root

RUN rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && \
    yum clean metadata && \
    yum -y update && \
    yum install -y wget curl git vim procps less tar psmisc lsof httpd php php-cli && \
    yum -y reinstall glibc-common &&  \
    yum clean all  && \
    mv -f /usr/lib/locale/locale-archive /usr/lib/locale/locale-archive.tmpl  && \
    /usr/sbin/build-locale-archive && \
    chmod -R g+rwX /root/ /var/www && \
    mkdir -p /run/httpd && \
    chmod -R g+rwX /etc/httpd /etc/passwd /etc/group /run /var/log && \
    chgrp -R root /run/ /var/log && \
    sed -i 's/^Listen 80$/Listen 8080/' /etc/httpd/conf/httpd.conf && \
    ln -s /root/git.conf /etc/httpd/conf.d/git.conf

CMD /root/start.sh
