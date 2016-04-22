#!/usr/bin/env python3

def print_nonewline(string):
    print(string, end="")

import sys

f = open(sys.argv[1])
N = int(f.readline())

for n in range(N):

    print_nonewline('Case #%d: ' % (n+1))

    words = f.readline().split()
    for i in range(len(words), 0, -1):
        print_nonewline(words[i-1] + " ")

    print()

