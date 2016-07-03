#!/usr/bin/env python3

import sys, math, gc, gmpy2

def gmpyPrimes(n):

    primes = []
    prime = 2

    toPrint = 0

    while prime <= n:
        prime = gmpy2.next_prime(prime)
        primes.append(prime)

        toPrint += 1
        if toPrint == 10000:
            print(prime)
            toPrint = 0

    return primes


def getPrimes(n):
    primes = []
    primeRoots = []

    for i in range(2, n+1):

        prime = True
        root = math.floor(math.sqrt(i))

        for p in primes:
            if p > root:
                break

            if i % p == 0:
                prime = False
                break

        if prime:
            primes.append(i)
            print(i)

    return primes


#print(getPrimes(7920))
#sys.exit(0)



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
f.readline()

print('Case #1:')

(N, J) = tuple([int(i) for i in f.readline().split()])

maxNumberString = ""
for i in range(N+1):
    maxNumberString += "1"

maxNumber = toBase(maxNumberString, 10)
maxRoot = math.floor(math.sqrt(maxNumber)) + 1

gmpyPrimes(maxRoot)
sys.exit(0)

primeList = getPrimes(maxRoot)
print("hej")

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

