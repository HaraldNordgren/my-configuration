#!/usr/bin/env python3

import sys

def pnn(string):
    print(string, end="")

def opposite(s):
    if s == '+':
        return '-'
    else:
        return '+'

def flip(string, n):
    result = ""
    for i in range(n):
        result += opposite(string[n - 1 - i])

    for i in range(n, len(string)):
        result += string[i]

    return result

def updateCombinations(combinations, signs, previousFlips):
    if signs not in combinations:
        combinations[signs] = previousFlips
        return True

    if previousFlips < combinations[signs]:
        combinations[signs] = previousFlips
        return True

    return False

def rec(combinations, signs, previousFlips):
    signs = signs.rstrip("+")
    #print("%s %d %s" % (signs, previousFlips, combinations))
    
    if not updateCombinations(combinations, signs, previousFlips):
        return

    if not signs:
        return

    if signs[-1] == '-' and signs[0] == '-':
        flipped = flip(signs, len(signs))
        rec(combinations, flipped, previousFlips + 1)
        return

    for i in range(1, len(signs) + 1):
        flipped = flip(signs, i)
        rec(combinations, flipped, previousFlips + 1)


f = open(sys.argv[1])
N = int(f.readline())

for n in range(N):
    pnn('Case #%d: ' % (n+1))

    signs = f.readline().rstrip()

    combinations = {}
    rec(combinations, signs, 0)
    print(combinations[''])
