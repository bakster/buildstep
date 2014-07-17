FROM ubuntu:quantal
MAINTAINER progrium "progrium@gmail.com"

RUN mkdir /build
ADD ./stack/ /build
RUN sed -i s/archive/old-releases/g /etc/apt/sources.list
RUN locale-gen en_US.UTF-8 && \
    echo 'LANG="en_US.UTF-8"' > /etc/default/locale
RUN LC_ALL="en_US.UTF-8" DEBIAN_FRONTEND=noninteractive /build/prepare
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get clean
