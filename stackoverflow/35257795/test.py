#!/usr/bin/env python3

data = ["Germany",3,2,10,"Italy",7,9,1,"canada",4,5,3,"china",4,3,9]

data_grouped = []

for i in range(0, len(data), 4):
    data_grouped.append(data[i:i+4])


data_sorted = sorted(data_grouped, key=(lambda x: x[1]), reverse=True)

print(data_sorted)
