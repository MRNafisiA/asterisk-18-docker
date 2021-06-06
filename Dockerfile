FROM ubuntu:20.04
COPY ./asterisk /asterisk-source
RUN apt-get update && DEBIAN_FRONTEND='noninteractive' apt-get install -y \
  gcc \
  build-essential \
  curl \
  wget \
  net-tools \
  libedit-dev \
  uuid-dev \
  libjansson-dev \
  libxml2 \
  libxml2-dev \
  libsqlite3-dev
RUN cd /asterisk-source && ./configure && make && make install
RUN cd /astefgrisk-source && make samples && make config
EXPOSE 2000/tcp 2727/udp 5000/udp 5060/udp 4569/udp
EXPOSE 10000-20000/udp
CMD asterisk -fdvvvv
