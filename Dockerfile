# syntax=docker/dockerfile:1
FROM ubuntu:latest
RUN apt-get update && apt-get install -y \
  xsltproc vim && apt-get clean
RUN mkdir /mnt/egov
WORKDIR /mnt/egov
CMD ["/bin/bash"]
