#!/bin/sh -e

export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
cd jigg-develop
sbt assembly
cd target
java -cp *.jar jigg.pipeline.Pipeline -help ssplit
