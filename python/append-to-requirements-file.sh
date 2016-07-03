#!/bin/bash

file=requests.txt
for lib in $@; do
         grep -q '^'$lib $file || echo $lib'=1.2.3' >> $file; done
