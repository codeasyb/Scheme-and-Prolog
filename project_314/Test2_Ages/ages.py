import matplotlib
matplotlib.use('agg') 
import matplotlib.pyplot as plt
import numpy as np

a = np.array([21,23,24,4,5,6,77,8,36,37,18,49,50])
fig = plt.hist(a, 5, facecolor='b', ec='k', alpha=0.5)

plt.savefig('foo.png')
