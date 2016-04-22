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
    if signs not is combinations:
        combinations[signs] = previousFlips
        return combinations

    if previousFlips < combinations[signs]:
        combinations[signs] = previousFlips

    return combinations

def rec(signs, previousFlips, combinations):
    signs = signs.rstrip("+")
    print("%s %d %s" % (signs, previousFlips, combinations))
    if not signs:
        return previousFlips

    updateCombinations(combinations, signs, previousFlips)

    flips = []
    for i in range(1, len(signs) + 1):
        flipped = flip(signs, i)
        if flipped in combinations:
            continue
        updateCombinations(combinations, flipped, previousFlips + 1)
        flips.append(rec(flipped, previousFlips + 1, combinations))

    if not flips:
        return 3
    else:
        return min(flips)



#print(flip("+-+-", 0))
#sys.exit(0)


f = open(sys.argv[1])
N = int(f.readline())

for n in range(N):
    pnn('Case #%d: ' % (n+1))
    print()

    signs = f.readline().rstrip()

    print(rec(signs, 0, {}))
    print()

    
    #items = [int(i) for i in f.readline().split()]
