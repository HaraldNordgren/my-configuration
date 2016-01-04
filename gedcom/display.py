#!/usr/bin/env python3

with open('sample.ged') as f:
    for line in f:
        
        line_data = line.split()
        indentation_level = int(line_data[0])

        print('  ' * indentation_level, end='')
        print(line_data[1:])
