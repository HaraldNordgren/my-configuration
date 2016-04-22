#!/usr/bin/env python3

import sys

def find_items(C, I, items):
    for i in range(I):
        for j in range(i+1, I):
            if items[i] + items[j] == C:
                print("Case #%s: %d %d" % (n+1, i+1, j+1))
                return


f = open(sys.argv[1])
N = int(f.readline())

for n in range(N):
    C = int(f.readline())
    I = int(f.readline())

    items = [int(i) for i in f.readline().split()]
    find_items(C, I, items)
