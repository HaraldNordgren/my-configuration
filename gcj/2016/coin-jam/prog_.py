#!/usr/bin/env python3

import sys, math

def smallestPrimeFactor(nbr):

    for factor in range(2, math.floor(math.sqrt(nbr)) + 1):
        #print(factor)
        if nbr % factor == 0:
            return factor

    return -1

def toBase(string, base):
    
    string = string[::-1]

    result = 0
    for i in range(len(string)):
        result += int(string[i]) * (base**i)
    
    return result


f = open(sys.argv[1])
T = int(f.readline())

for t in range(T):

    print('Case #%d:' % (t+1))

    (N, J) = tuple([int(i) for i in f.readline().split()])

    NCenter = N - 2
    counter = 0

    for i in range(2**NCenter):
        formatString = "{0:0" + str(NCenter) + "b}"
        coinJam = "1" + formatString.format(i) + "1"

        output = ""
        prime = False

        for j in range(2, 11):
            coinJamBase = toBase(coinJam, j)
            smallestFactor = smallestPrimeFactor(coinJamBase)

            if smallestFactor == -1:
                prime = True
                break
            
            output += " " + str(smallestFactor)

        if not prime:
            print(coinJam + output)
            counter += 1

        if counter >= J:
            break
    
