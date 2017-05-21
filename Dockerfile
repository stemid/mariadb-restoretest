FROM ubuntu:14.04

MAINTAINER Stefan Midjich: 1.0

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get install -y software-properties-common && \
  apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db && \
  add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://ftp.ddg.lth.se/mariadb/repo/10.1/ubuntu trusty main' && \
  apt-get update

RUN apt-get update && \
  apt-get install -y mariadb-server

COPY ./run.conf.d /tmp/run.conf.d
ADD ./setup-mysql.sh /tmp/setup-mysql.sh
RUN /bin/sh /tmp/setup-mysql.sh

ADD ./run-mysql.sh /tmp/run-mysql.sh

CMD ["/bin/bash", "/tmp/run-mysql.sh"]
