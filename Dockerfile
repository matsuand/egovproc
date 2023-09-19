# syntax=docker/dockerfile:1
FROM debian:latest
RUN apt-get update && \
  apt-get install -y xsltproc vim
RUN mkdir /mnt/egov
WORKDIR /mnt/egov
CMD ["/bin/bash"]
