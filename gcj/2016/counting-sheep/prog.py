#!/usr/bin/env python3

import sys

def pnn(string):
    print(string, end="")


f = open(sys.argv[1])
T = int(f.readline())

for t in range(T):
    
    pnn('Case #%d: ' % (t+1))

    N = int(f.readline())

    if (N == 0):
        print("INSOMNIA")
        continue

    s = set('0123456789')
    counter = 0

    n = 0
    while s and counter < 1000000:
        n += N
        for nbr in str(n):
            s.discard(nbr)
        counter += 1
    
    if counter == 1000000:
        print("INSOMNIA")
        continue
    else:
        print(n)

