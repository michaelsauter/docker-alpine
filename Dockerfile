FROM alpine:3.2

ADD ./bin/apk-install /usr/sbin/apk-install
RUN chmod +x /usr/sbin/apk-install

RUN apk-install sudo

RUN adduser -D default
RUN chgrp -R default /usr/local
RUN find /usr/local -type d | xargs chmod g+w

RUN echo "default ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/default
RUN chmod 0440 /etc/sudoers.d/default

ENV     HOME /home/default
WORKDIR /home/default
USER    default