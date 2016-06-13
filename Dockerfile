FROM ubuntu:14.04

RUN apt-get -y -q update
RUN apt-get -y -q install apt-transport-https default-jdk scala
RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
RUN apt-get -y -q update
RUN apt-get -y -q install sbt
