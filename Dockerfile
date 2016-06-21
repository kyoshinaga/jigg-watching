FROM ubuntu:14.04

ENV JAVA_TOOL_OPTIONS -Dfile.encoding=UTF-8

RUN apt-get update
RUN apt-get -y -q install software-properties-common python-software-properties 

RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN apt-add-repository -y ppa:webupd8team/java
RUN apt-get update
RUN apt-get -y -q install oracle-java8-installer
