#!/usr/bin/python
import sys
import os
from os import listdir
from os.path import isfile, join

def main(path):
    for f in os.listdir(path):
        print f
        os.system("./synth " + path + f + " | grep \"cells\|MHz\"")

if "__main__" == __name__:
    main(sys.argv[1])
