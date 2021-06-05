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
RUN cd /asterisk-source && make samples && make config
EXPOSE 2000/tcp
EXPOSE 2727/udp
EXPOSE 5000/udp
EXPOSE 43927/udp
EXPOSE 5060/udp
EXPOSE 4569/udp
CMD service asterisk start && sleep 10 && asterisk -rvvvv
