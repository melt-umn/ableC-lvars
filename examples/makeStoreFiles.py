import random

NUMLINES = 5000
MIN_ID = 1
MAX_ID = 50
MIN_PROD = 0
MAX_PROD = 1000

f1 = open("store1.csv", "w")
f2 = open("store2.csv", "w")
f3 = open("store3.csv", "w")

fs = [f1, f2, f3]

for file in fs:
    for i in range(NUMLINES):
        file.write(str(random.randint(MIN_ID, MAX_ID)) + "," + \
                   str(random.randint(MIN_PROD, MAX_PROD)) + "\n")
    file.close()
        
