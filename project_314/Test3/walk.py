import os

def words_count(file):
	num_words = 0
	with open(file, 'r') as f:
		for line in f:
			words = line.split()
			num_words += len(words)

for (dirpath, dirnames, filenames) in os.walk('.'):
	for f in filenames:
		print words_count(f)
		print('FILE: ', os.path.join(dirpath, f))
	for d in dirnames: 
		print('DIRECTORY: ', os.path.join(dirpath, d))


