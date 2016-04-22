#!/usr/bin/env python3


    lastMinus = -1

    for i in range(len(signs) - 1, -1, -1):
        if signs[i] == '-':
            lastMinus = i
            break

    if lastMinus == -1:
        print(0)
        continue
    elif lastMinus == 0:
        print(1)
        continue

    print("hej")
