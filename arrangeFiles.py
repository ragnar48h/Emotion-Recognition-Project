import subprocess

command = "ls DB/wav"
result = subprocess.check_output(command, shell=True).decode('utf-8')
result = result.split('\n')
result.pop()

emotions = {}
for i in result:
	emo = i.split('.')[0][-2]
	try:
		x = emotions[emo]
		emotions[emo].append(i)
	except:
		emotions[emo] = [i]

command = "mkdir newDB"
subprocess.check_output(command, shell=True)

for emo in emotions:
	command = "mkdir newDB/" + emo
	subprocess.check_output(command, shell=True)	
	for file in emotions[emo]:
		command = "cp DB/wav/" + file + " newDB/" + emo + "/" + file
		subprocess.check_output(command, shell=True)