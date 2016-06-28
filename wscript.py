#!/usr/bin/env python

import argparse
import os
import shutil
import subprocess

if __name__ == '__main__':

    parser = argparse.ArgumentParser(description='Generate evaluation result as xml/jsonj')

    parser.add_argument('beam', metavar='BEAM',type=int,\
                        help='Beam size')

    args = parser.parse_args()

    print(args.beam)

#    output = subprocess.check_output(
#        'java -Xmx4g -cp %s jigg.nlp.ccg.EvalJapaneseParser \
#        -model %s -decoder.beam %s -decoder.tagger.beta %s -output %s \
#        -bank.dir %s -cabocha %s -preferConnected %s'
#    )
