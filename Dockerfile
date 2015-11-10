FROM       alpine:3.2
MAINTAINER Michael Sauter <mail@michaelsauter.net>

ADD bin/apk-install /usr/sbin/apk-install
RUN chmod +x /usr/sbin/apk-install

RUN apk-install sudo

RUN echo "http://dl-4.alpinelinux.org/alpine/edge/community" | sudo tee -a /etc/apk/repositories

RUN adduser -D default;                                               \
    chgrp -R default /usr/local;                                      \
    find /usr/local -type d | xargs chmod g+w;                        \
    echo "default ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/default; \
    chmod 0440 /etc/sudoers.d/default

ENV     HOME /home/default
WORKDIR /home/default
USER    default