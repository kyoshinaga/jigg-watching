#!/bin/sh -e

cd jigg-develop
sbt assembly
cd target

# Super tagger training
java -Xmx8g -cp *.jar jigg.nlp.ccg.TrainSuperTagger \
				-bank.lang ja -bank.dir /data/ccgbank-20150216/ \
				-model /tmp/tagger.ser.gz
cd /tmp
ls -la

# Parser training

# Convert to CoNLL format.
