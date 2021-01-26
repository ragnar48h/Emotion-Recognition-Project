from scipy.io import wavfile
import numpy as np
import subprocess
import sys
import re
if not sys.warnoptions:
    import warnings
    warnings.simplefilter("ignore")

print('Extracting Speech Rate')

f = open("features/SR_Features.txt", "a+")

def extract(path):
	f2 = open(path, "r")
	inp = f2.read()
	f2.close()
	inp = inp.split('\n')
	while inp[0] != '#':
		inp.pop(0)
	inp.pop(0)
	inp.pop()
	phonemes_cnt = len(inp)
	if len(inp) == 0:
		return
	inp = re.findall("\d+\.\d+", inp[-1])[0]
	duration = float(inp)
	speech_rate = phonemes_cnt / duration
	
	fileName = path.split('/')[-1].split('.')[0]
	emotion = fileName[-4]
	fileName = fileName[:-2]

	toWrite = str(fileName) + " "
	toWrite += str(speech_rate) + " "
	toWrite += str(emotion) + "\n"
	f.write(toWrite)

command = "ls ../DB/lablaut"
fileNames = subprocess.check_output(command, shell=True).decode('utf-8').split('\n')	
fileNames.pop()
for file in fileNames:
	extract('../DB/lablaut/' + file)

f.close()