#!/usr/bin/env python3

import sys

def pnn(string):
    print(string, end="")


f = open(sys.argv[1])
N = int(f.readline())

for n in range(N):

    pnn('Case #%d: ' % (n+1))
    
    items = [int(i) for i in f.readline().split()]
