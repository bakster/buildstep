FROM ubuntu:quantal
MAINTAINER progrium "progrium@gmail.com"

RUN mkdir /build
ADD ./stack/ /build
RUN sed -i s/archive/old-releases/g /etc/apt/sources.list
RUN locale-gen fr_FR.UTF-8 && \
    echo 'LANG="fr_FR.UTF-8"' > /etc/default/locale
RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive /build/prepare
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get clean
