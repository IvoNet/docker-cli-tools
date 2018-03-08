FROM ubuntu:16.04
MAINTAINER Ivo Woltring <webmaster@ivonet.nl>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG en_US.UTF-8
ENV LC_ALL C.UTF-8
ENV LANGUAGE en_US.UTF-8

VOLUME '/input'
VOLUME '/output'

RUN apt-get update \
    && apt-get -y --no-install-recommends install software-properties-common \
    && add-apt-repository -y ppa:stebbins/handbrake-releases \
    && apt-get update \
    && apt-get -y --no-install-recommends install \
    handbrake-cli \
    mkvtoolnix \
    ffmpeg \
    mplayer \
    mencoder \
    melt \
    atomicparsley \
    mp4v2-utils \
    id3v2 \
    eyed3 \
    mp3info \
    && apt-get clean

COPY internal/* /usr/local/bin/
RUN chmod +x /usr/local/bin
