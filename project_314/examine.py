import os, sys
from os.path import join
import string

import matplotlib
matplotlib.use('Agg')

import matplotlib.pyplot as plt
import numpy as np


def newFile(file):
        createNew = file.rsplit('.',1)[0]
        extension = "_hist.png"
        finalFile = createNew + extension
        return finalFile


def words_count(file):
        num_words = 0
        with open(file, 'r') as f:
                for line in f:
                        words = line.split()
                        num_words += len(words)

for (dirname, dirs, files) in os.walk('.'):
   for filename in files:
	filename = open(os.path.join(dirname, filename))
        if filename.name.endswith('.txt'):
		num_words = 0
	   	with open(filename, 'r') as f:
			for line in f:
				words = line.split()
				num_words += len(words)
			print num_words





