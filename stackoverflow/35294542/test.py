#!/usr/bin/env python3

import re

list = ["orange","green","grey"]
text = "The Orange is orange"
    for word in list:

        pattern = re.compile(".*(" + word + ").*")
        m = re.match(pattern, text)

        if m:
            print(m.group(1))
