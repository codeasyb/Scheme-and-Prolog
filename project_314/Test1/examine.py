import os, sys
import string
import argparse

import matplotlib
matplotlib.use('Agg')	

import matplotlib.pyplot as plt	
import numpy as np

def newFileName(file):
    dupliFile=file.rsplit('.',1)[0]
    extension="_hist.png"
    finalFile=dupliFile+extension
    return finalFile
path = r"/Users/prince/Documents/project_314/Test1"
 
def createHist(path):   
	for root,dirs,files in os.walk(path):
		for file in files:
			frequency={} 
			wordcount={}
			str1= open(os.path.join(root, file))
			text_string =str1.split() 

			for word in text_string:
				count = frequency.get(word,0)
				frequency[word] = count + 1
            
			wordcount=frequency.copy()
        
			for k, v in wordcount.items():
				wordcount[k]=(wordcount[k]/len(frequency))
				
			wordcountvalues=wordcount.values()
			
			curFilePath=os.path.dirname(os.path.abspath(file))
        
			y_pos = np.arange(len(frequency))
			plt.barh(y_pos,wordcountvalues, align='center',alpha=0.5)
			plt.yticks(y_pos, wordcount)     
			plt.savefig(os.path.join(root,newFileName(file)))
			

parser = argparse.ArgumentParser()

args = parser.parse_args()		
createHist(sys.argv[0])

if __name__ == "__main__":
	createHist()
