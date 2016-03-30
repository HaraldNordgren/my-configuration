#!/usr/bin/env python3

def count_words(s, n):

    counts = {}
    
    for w in s.split():

        if w in counts:
            counts[w] = counts[w] + 1
        else:
            counts[w] = 1

    return sorted(sorted(counts.items(), key = lambda x: x[0]), key = lambda x: x[1], reverse = True)[:n]
