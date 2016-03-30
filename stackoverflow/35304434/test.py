#!/usr/bin/env python2

stamps = [1455062138, 1455065563, 1453065565, 1455062146, 1455063146, 1455065565.449704, 1355065565, 1455062565, 1425065565, 1455065565.4404]
values = [1, 2, 3, 10, 332, 434, 3232, 3323, 434, 223]

minute_bins = {}
averages = {}

for i in range(len(values)):
    minute = stamps[i] // 60

    if minute in minute_bins:
        minute_bins[minute].append(values[i])
    else:
        minute_bins[minute] = [values[i]]

print(minute_bins)

for key in minute_bins:
    minute_values = minute_bins[key]
    averages[key] = float(sum(minute_values)) / len(minute_values)

print(averages)
