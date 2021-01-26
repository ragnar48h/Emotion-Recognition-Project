from scipy.io import wavfile
import numpy as np
import subprocess
import sys
if not sys.warnoptions:
    import warnings
    warnings.simplefilter("ignore")

print('Extracting Energy Features')

f = open("features/Energy_Features.txt", "a+")

def extract(path):
	samplerate, data = wavfile.read(path)
	data = data.astype('int64')
	energy = data ** 2

	fileName = path.split('/')[-1].split('.')[0]
	min_val = energy.min()
	max_val = energy.max()
	range_val = max_val - min_val
	mean_val = np.mean(energy)
	median_val = np.median(energy)
	variance_val = np.var(energy)
	emotion = fileName[-2]

	toWrite = str(fileName) + " "
	toWrite += str(min_val) + " "
	toWrite += str(max_val) + " "
	toWrite += str(range_val) + " "
	toWrite += str(mean_val) + " "
	toWrite += str(median_val) + " "
	toWrite += str(variance_val) + " "
	toWrite += str(emotion) + "\n"
	f.write(toWrite)

command = "ls ../newDB"
emotions = subprocess.check_output(command, shell=True).decode('utf-8').split('\n')
emotions.pop()
for ems in emotions:
	command = "ls ../newDB/" + ems
	fileNames = subprocess.check_output(command, shell=True).decode('utf-8').split('\n')	
	fileNames.pop()
	for file in fileNames:
		extract('../newDB/' + ems + '/' + file)

f.close()