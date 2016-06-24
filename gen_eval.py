#!/usr/bin/env python

import argparse
import logging
import os
from subprocess import check_call, call

import xml.etree.ElementTree as ET

# Output file names

if __name__ == '__main__':

    parser = argparse.ArgumentParser(description='Generate evaluation result as xml file')

    parser.add_argument('inputFile', metavar='INPUT_FILE', type=str, \
            help='File name of evaluation result.')
    parser.add_argument('--outputDir', metavar='OUTPUT_DIR', type=str, \
            default="./result/", \
            help='Directory name of output, default "./result".')

    args = parser.parse_args()

    inf = open(args.inputFile)
    lines = inf.readlines()
    inf.close()

    rootNode = ET.Element('root')

    index = 0

    catAccuracyFlag = False
    depAccuracyFlag = False
    modDefivFlag = False
    modDefivTargetFlag = False
    modDefivConnectFlag = False

    for l in lines:
        items = l.rstrip().split(':')
        if items[0] == 'dependency accuracies against CCGBank dependency':
            depAccuracyFlag = True
            break
        if items[0] == 'category accuracies':
            catAccuracyFlag =  True
            print('category_accuracies start')
            catAccuracy = ET.SubElement(rootNode, 'category_accuracies')
            continue
        if catAccuracyFlag and not \
                (depAccuracyFlag \
                or modDefivFlag \
                or modDefivTargetFlag \
                or modDefivConnectFlag):
            subAccuracy = ET.SubElement(catAccuracy,items[0].replace(' ','_'))
            subAccuracy.text = items[1]
        index += 1

    tree = ET.ElementTree(rootNode)
    tree.write(args.outputDir + 'eval.xml', encoding='utf-8')
