#!/usr/bin/env python3

import sys

def pnn(string):
    print(string, end="")


f = open(sys.argv[1])
C = int(f.readline())

for c in range(C):
    
    pnn('Case #%d: ' % (c+1))

    (N, T) = tuple([int(i) for i in f.readline().split()])
    E = int(f.readline())

    employees = []

    for e in range(E):



