# Version: 0.0.1
FROM ubuntu:latest

MAINTAINER Juan Pedro Perez "jp.alcantara@geographica.gs"

ENV REFRESHED_AT 2014-12-04_17:53

RUN mkdir -p /usr/local/src
RUN apt-get update
RUN apt-get install -y build-essential
ADD packages/redis-2.8.14.tar.gz /usr/local/src
WORKDIR /usr/local/src/redis-2.8.14
RUN make
RUN make install
RUN rm -Rf /usr/local/src

EXPOSE 6379
CMD redis-server /data/redis.conf
