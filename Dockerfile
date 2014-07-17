FROM ubuntu:10.4
MAINTAINER progrium "progrium@gmail.com"

RUN mkdir /build
ADD ./stack/ /build
RUN sed -i s/archive/old-releases/g /etc/apt/sources.list
RUN LC_ALL="en_US.UTF-8" DEBIAN_FRONTEND=noninteractive /build/prepare
RUN rm -rf /var/lib/apt/lists/*
RUN apt-get clean
