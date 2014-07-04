#!/usr/bin/env python3

import re
import sys

for filename in sys.argv[1:]:
    try:
        with open(filename) as f:
            data = f.read()
    except UnicodeDecodeError:
        continue

    def aux(match):
        s = match.group(0)
        s = s.replace("?", "%3F")
        s = s.replace("&amp;", "%26")
        return s

    data = re.sub(r'href="[^"]+\.php[^"]*"', aux, data)
    data = re.sub(r'src="[^"]+\.php[^"]*"', aux, data)

    with open(filename, "w") as f:
        f.write(data)
