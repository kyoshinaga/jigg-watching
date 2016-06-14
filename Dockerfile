FROM ubuntu:14.04

RUN apt-get update
RUN apt-get -y -q install software-properties-common python-software-properties

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN apt-add-repository -y ppa:webupd8team/java
RUN apt-get update
RUN apt-get -y -q install oracle-java8-installer apt-transport-https scala

RUN echo "deb https://dl.bintray.com/sbt/debian /" | tee -a /etc/apt/sources.list.d/sbt.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
RUN apt-get -y -q update
RUN apt-get -y -q install sbt
