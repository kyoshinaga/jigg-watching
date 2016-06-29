#!/usr/bin/env python

import argparse
import os
import shutil
import subprocess

if __name__ == '__main__':

    parser = argparse.ArgumentParser(description='Generate evaluation result as xml/jsonj')

    parser.add_argument('inputEvalFile', metavar='INPUT_EVAL_FILE', type=str,\
                        help='Input file name of evalulation resuit, default ./eval.log',\
                        default="./eval.log")
    parser.add_argument('beam', metavar='BEAM',type=int,\
                        help='Beam size')

    args = parser.parse_args()

    print(args.inputEvalFile)
    print(args.beam)

    output = subprocess.check_output('cat %s' % args.inputEvalFile)
    print(output)