#!/usr/bin/env python3

import sys, math

def smallestPrimeFactor(nbr):

    for factor in range(2, math.floor(math.sqrt(nbr)) + 1):
        if nbr % factor == 0:
            return factor

    return -1

def toBase(string, base):

    string = string[::-1]

    result = 0
    for i in range(len(string)):
        print(str(base**i) + " " + str(string[i]) )
        result += int(string[i]) * (base**i)
    
    return result
