FROM ubuntu:22.04

ENV DEBIAN_FRONTEND noninteractive
WORKDIR /

RUN apt-get -qq update \
  && apt-get install -y \
    ffmpeg \
    curl \
  && apt-get clean autoclean \
  && apt-get autoremove -y --purge

ADD entrypoint.sh .
CMD ["/entrypoint.sh"]
