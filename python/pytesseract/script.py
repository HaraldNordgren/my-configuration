#!/usr/bin/env python2

import pytesseract, sys
from PIL import Image

im = Image.open('lPqI1nD.png')
im = Image.open(sys.argv[1])

#print(pytesseract.image_to_string(im))
print pytesseract.image_to_string(im)
