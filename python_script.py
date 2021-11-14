import time
import os

#Waiting time in seconds during iteration loop
x = 5
#Getting it's own pid in os.
pid = str(os.getpid())

#Writting pid in file.
f = open("pid", "w")
f.write(pid)
f.close()

for i in range (0,3):
    print ("2: I am alive")
    time.sleep(x)
else:
    print ("2: I gonna die now, bye")