#!/usr/bin/env python3
# -*- coding:utf-8 -*-
########################################################
# Convert colormap to GMT recognizable colorbar(cpt)   #
# Copyright (c) 2021, Lei Yuan                         #
########################################################
import argparse
import os
import sys

import numpy as np

EXAMPLE = '''Example:
  # Linux
  python3 cm2cpt.py rmg.cm rmg.cpt
  # Windows
  python cm2cpt.py rmg.cm rmg.cpt
'''


def cmdline_parser():
    parser = argparse.ArgumentParser(
        description='Convert colormap to GMT recognizable colorbar(cpt).',
        formatter_class=argparse.RawTextHelpFormatter, epilog=EXAMPLE)
    parser.add_argument('cm_file', help='colormap file.')
    parser.add_argument('cpt_file', help='GMT file.')

    inps = parser.parse_args()
    return inps


def makecpt(cm_file, cpt):
    cm = np.loadtxt(cm_file, dtype=np.uint8)
    lines = cm.shape[0]
    step = np.linspace(0,1,lines)
    with open(cpt, 'w+', encoding='utf-8') as f:
        bar = '-' * 85
        f.write(f'#{bar}\n')
        f.write('# COLOR_MODEL = RGB\n')
        f.write(f'#{bar}\n')

        for l in range(lines-1):
            rgb0 = f'{cm[l][0]}/{cm[l][1]}/{cm[l][2]}'
            rgb1 = f'{cm[l+1][0]}/{cm[l+1][1]}/{cm[l+1][2]}'

            f.write(f'{step[l]:<22} {rgb0:<13} {step[l+1]:<22} {rgb1:<13}\n')

        f.write(f'#{bar}\n')
        f.write(f'B {cm[0][0]}/{cm[0][1]}/{cm[0][2]}\n')
        f.write(f'F white\n')
        f.write(f'N {cm[0][0]}/{cm[0][1]}/{cm[0][2]}\n')
        f.write(f'#{bar}\n')


def main():
    # get inps
    inps = cmdline_parser()
    cm_file = os.path.abspath(inps.cm_file)
    cpt_file = os.path.abspath(inps.cpt_file)

    # check inps
    if not os.path.isfile(cm_file):
        print(f"Cannot find {cm_file}, please check it.")
        sys.exit()

    # makecpt
    makecpt(cm_file, cpt_file)


if __name__ == "__main__":
    main()
