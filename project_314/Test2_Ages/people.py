import numpy as np
import matplotlib
matplotlib.use('agg')
import matplotlib.pyplot as plt


people = ('Amir', 'brenda', 'Arjun', 'Shats')
y_pos = np.arange(len(people))
ages = [28, 21, 25, 35]

plt.barh(y_pos, ages, align='center', alpha=0.5)
plt.title('Peoples ages')
plt.yticks(y_pos, people)
plt.xlabel('Ages')
plt.savefig('AgesReport.png')
plt.show()
