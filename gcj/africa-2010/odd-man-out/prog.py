#!/usr/bin/env python3

import sys

def pnn(string):
    print(string, end="")


f = open(sys.argv[1])
N = int(f.readline())

for n in range(N):
    
    pnn('Case #%d: ' % (n+1))

    G = int(f.readline())
    non_couples = {}

    guests = [int(i) for i in f.readline().split()]
    for g in guests:

        if g in non_couples:
            del non_couples[g]
        else:
            non_couples[g] = 1

    for k in non_couples:
        print(k)
