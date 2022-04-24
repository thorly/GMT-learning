#!/usr/bin/env python3
# -*- coding:utf-8 -*-
####################################################################
# Convert Surfer colorbar(clr) to GMT recognizable colorbar(cpt)   #
# Copyright (c) 2021, Lei Yuan                                     #
####################################################################
import argparse
import os
import sys

import numpy as np

EXAMPLE = '''Example:
  # Linux
  python3 clr2cpt.py vel.clr -10 60 vel.cpt
  # Windows
  python clr2cpt.py vel.clr -10 60 vel.cpt
'''


def cmdline_parser():
    parser = argparse.ArgumentParser(
        description='Convert Surfer colorbar(clr) to GMT recognizable colorbar(cpt).',
        formatter_class=argparse.RawTextHelpFormatter,
        epilog=EXAMPLE)
    parser.add_argument('clr_file', help='path of Surfer file.')
    parser.add_argument(
        'min_val', help='Minimum value for making cpt.', type=float)
    parser.add_argument(
        'max_val', help='Maximum value for making cpt.', type=float)
    parser.add_argument('cpt_file', help='path of GMT file.')

    inps = parser.parse_args()
    return inps


def makecpt(clr_file, cpt_file, min_val, max_val):
    color = np.loadtxt(clr_file, skiprows=1)
    row, col = color.shape

    color1 = np.zeros((row, col-1))
    for i in range(row):
        color1[i, 0] = color[i, 0]/100*(max_val-min_val)+min_val
        color1[i, 1:4] = color[i, 1:4]

    color2 = np.zeros((row - 1, 8))
    for i in range(row - 1):
        color2[i, 0:4] = color1[i, 0:4]
        color2[i, 4:8] = color1[i+1, 0:4]

    with open(cpt_file, 'w') as f:
        row, col = color2.shape
        for i in range(row):
            for j in range(col):
                if j == 0 or j == 4:
                    f.write(str(round(color2[i, j], 2)).rjust(8))
                else:
                    f.write(str(int(color2[i, j])).rjust(8))
            f.write("\n")


def main():
    # get inps
    inps = cmdline_parser()
    clr_file = os.path.abspath(inps.clr_file)
    min_val = inps.min_val
    max_val = inps.max_val
    cpt_file = inps.cpt_file
    # check inps
    if not os.path.isfile(clr_file):
        print(f"Cannot find {clr_file}, please check it.")
        sys.exit()
    if min_val > max_val:
        tmp = min_val
        min_val = max_val
        max_val = tmp
    if min_val == max_val:
        print("Error,please reset minimum and maximum value for making cpt.")
        sys.exit()
    # makecpt
    makecpt(clr_file, cpt_file, min_val, max_val)


if __name__ == "__main__":
    main()
