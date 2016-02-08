#!/usr/bin/env python3

import subprocess

proc = subprocess.Popen(['sleep', '1'])
retCode = proc.wait()
print(proc)
print("return code: " + str(retCode))
