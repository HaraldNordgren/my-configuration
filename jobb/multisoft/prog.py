#!/usr/bin/env python3

count = 13267

sum_ = 0

for i in range(884):

    if i < 248:
        sum_ += count * i
    elif i < 843:
        sum_ += count * 248

print(sum_)
