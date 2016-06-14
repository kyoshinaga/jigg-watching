FROM ubuntu:14.04

RUN apt-get update
RUN apt-get -y -q install software-properties-common python-software-properties
RUN apt-add-repository ppa:openjdk-r/ppa

RUN apt-get update
RUN apt-get -y -q install openjdk-8-jdk apt-transport-https scala

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
RUN apt-get -y -q update
RUN apt-get -y -q install sbt
