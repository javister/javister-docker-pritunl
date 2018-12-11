FROM javister-docker-docker.bintray.io/javister/javister-docker-base:1.1
MAINTAINER Viktor Verbitsky <vektory79@gmail.com>

ENV MONGO_HOST="mongo" \
    RPMLIST="$RPMLIST pritunl"

COPY files /

RUN . /usr/local/bin/yum-proxy && \
    gpg --keyserver hkp://keyserver.ubuntu.com --recv-keys CF8E292A && \
    gpg --armor --export CF8E292A > key.tmp; rpm --import key.tmp; rm -f key.tmp && \
    yum-install && \
    yum-clean && \
    chmod --recursive +x /etc/my_init.d/*.sh /etc/service /usr/local/bin

EXPOSE 1194 443
