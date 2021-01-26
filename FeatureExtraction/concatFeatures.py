import subprocess

print('Concatenating Features')

command = "ls features"
features = subprocess.check_output(command, shell=True).decode('utf-8')
features = features.split('\n')
features.pop()

labels = {}
for i in range(len(features)):
	f = open("features/" + features[i], "r")
	var = f.read().split('\n')
	f.close()
	var.pop()
	dictio = {}
	for j in var:
		arr = j.split(' ')
		if i == 0:
			labels[arr[0]] = arr[-1]
		if arr[-1] == "":
			arr.pop()
		arr.pop()
		namee = arr.pop(0)
		dictio[namee] = ' '.join(arr)
	features[i] = dictio

toWrite = ""
for lab in labels:
	toWrite += lab + " " + labels[lab] + " "
	for f in features:
		toWrite += f[lab] + " "
	toWrite += "\n"

f = open("features/finalFeatures.txt", "w")
f.write(toWrite)
f.close()