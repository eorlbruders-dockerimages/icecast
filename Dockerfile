FROM registry.eorlbruder.de/supervisord
MAINTAINER David Magnus Henriques <eorlbruder@magnus-henriques.de>

RUN pacman -Syyu --noconfirm --noprogressbar icecast && \
    pacman -Sc --noconfirm

ADD assets/icecast.conf /etc/supervisor/conf.d/icecast.conf

RUN touch /mnt/icecast.xml

RUN mkdir /usr/share/icecast/htpasswd
RUN chown http /usr/share/icecast/htpasswd

RUN touch /usr/share/icecast/error.log
RUN touch /usr/share/icecast/access.log
RUN chown http /usr/share/icecast/error.log
RUN chown http /usr/share/icecast/access.log

EXPOSE 9003
CMD ["supervisord", "-n"]
