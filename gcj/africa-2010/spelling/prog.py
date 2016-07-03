#!/usr/bin/env python3


def getSequence(letter, previousDigit):

    keys = {'a': '2',
            'b': '22',
            'c': '222',
            'd': '3',
            'e': '33',
            'f': '333',
            'g': '4',
            'h': '44',
            'i': '444',
            'j': '5',
            'k': '55',
            'l': '555',
            'm': '6',
            'n': '66',
            'o': '666',
            'p': '7',
            'q': '77',
            'r': '777',
            's': '7777',
            't': '8',
            'u': '88',
            'v': '888',
            'w': '9',
            'x': '99',
            'y': '999',
            'z': '9999',
            ' ': '0'}

    sequence = keys[letter]
    
    if sequence[0] == previousDigit:
        return " " + sequence

    return sequence

def print_nonewline(string):
    print(string, end="")


import sys

f = open(sys.argv[1])
N = int(f.readline())

for n in range(N):
    print_nonewline('Case #%d: ' % (n+1))

    line = f.readline()

    #print(list(line.rstrip("\n")))

    previousDigit = ""
    for w in list(line.rstrip("\n")):
        seq = getSequence(w, previousDigit)
        print_nonewline(seq)
        previousDigit = seq[-1]

    print()
