# syntax=docker/dockerfile:1
FROM debian:latest
RUN apt-get update && \
  apt-get install -y autoconf automake make xsltproc vim
RUN mkdir /mnt/egov
WORKDIR /mnt/egov
CMD ["/bin/bash"]
