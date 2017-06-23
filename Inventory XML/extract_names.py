#!/usr/bin/env python

from sys import argv
import re

"""
108 is the left value for first column
443 for second column

XML files are the argumets provided
"""
vals = 108, 443
for filename in argv[1:]:
    with open(filename) as fin:
        fout = open(filename.split(".")[0]+".names", "w")
        for line in fin:
            data = re.findall(r'left="\d+"', line)
            try:
                data = re.findall(r'\d+', data[0])
            except:
                pass
            else:
                val = int(data[0])
                if val in vals:
                    data = re.findall(r'>.*</text>', line)
                    data = data[0]
                    data = data.replace("</text>","")
                    data = data.replace(">","")
                    if len(data) > 3:
                        print(data, file=fout)
        fout.close()