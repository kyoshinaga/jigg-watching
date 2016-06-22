#!/bin/sh -e

TAGGER_MODEL_NAME=tagger.ser.gz
PARSER_MODEL_NAME=parser.ser.gz
BEAM_SIZE=4

cd jigg-develop

if [ -e /work/result ]; then
				echo "result directory exist."
else
				mkdir /work/result
fi

./bin/sbt assembly
cd target

# Super tagger training
java -Xmx4g -cp *.jar jigg.nlp.ccg.TrainSuperTagger \
				-bank.lang ja -bank.dir /data/ccgbank-20150216/ \
				-bank.trainSize 100 \
				-model /work/result/$TAGGER_MODEL_NAME

# Parser training
java -Xmx5g -cp *.jar jigg.nlp.ccg.TrainParser \
				-taggerModel /work/result/$TAGGER_MODEL_NAME \
				-model /work/result/$PARSER_MODEL_NAME \
				-beam $BEAM_SIZE \
				-bank.lang ja\
				-bank.trainSize 100 \
				-bank.dir /data/ccgbank-20150216

# Evaluation
java -Xmx4g -cp *.jar jigg.nlp.ccg.EvalJapaneseParser \
				-model /work/result/$PARSER_MODEL_NAME \
				-decoder.beam $BEAM_SIZE \
				-output /work/result/ \
				-bank.dir /data/ccgbank-20150216 \
				-useTest true \
				-cabocha /data/test.cabocha \
				2>&1 | awk '/:/{print}' \
				| tee /work/result/eval.log

# Convert to CoNLL format
java -cp *.jar jigg.nlp.ccg.Cabocha2CoNLL \
				-ccgBank /data/ccgbank-20150216/test.ccgbank \
				-cabocha /data/test.cabocha \
				-output /work/result/test.conll
