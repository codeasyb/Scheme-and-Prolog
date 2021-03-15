# https://stackoverflow.com/questions/14360389/getting-file-path-from-command-line-argument-in-python/47324233
import matplotlib
matplotlib.use('Agg')

import matplotlib.pyplot as plt
import numpy as np

def main():
	filename = "cities.txt"
	d = {}
	with open(filename, 'r') as f:
		for line in f: # read each line
			words = line.strip().split() # split line into words
			for word in words: # for each word
				if word not in d:
					d[word] = 0
				d[word] += 1
	print('Word\t\tCount')
	for word, count in d.items():
		print(word + '\t\t' + str(count))

	y_pos = np.arange(count)
	plt.barh(y_pos, words, align='center', alpha=0.5)
	plt.yticks(y_pos, words)
	plt.savefig("histogram.png")

main()

