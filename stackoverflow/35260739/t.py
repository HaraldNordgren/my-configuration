#!/usr/bin/env python3

    data=[]
    while True:
        entry = input('Item number : ')
        if entry == 'q':
            break

        try:
            data.append(int(entry))
        except:
            print("Not a valid number")

print(data)
