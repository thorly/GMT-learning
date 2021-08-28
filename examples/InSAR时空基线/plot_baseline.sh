#!/bin/bash
##############################################
# plot baseline network using GMT and GAMMA  #
# Copyright (c) 2021, Lei Yuan               #
##############################################

gmt set FORMAT_DATE_MAP "yyyy-mm-dd"
gmt set FORMAT_TIME_PRIMARY_MAP Abbreviated
gmt set FORMAT_DATE_IN "yyyymmdd"
gmt set MAP_FRAME_PEN 0.5p
gmt set FONT_ANNOT_PRIMARY 10p,4
gmt set MAP_TICK_LENGTH_PRIMARY -3p
gmt set FONT_LABEL 10p,4
gmt set MAP_GRID_PEN_PRIMARY 0.1p,gray,-
gmt set MAP_LABEL_OFFSET 4p
gmt set MAP_ANNOT_ORTHO Z

R="2019-12T/2021-2T/-120/80"

gmt begin baseline png A0.1c
    gmt basemap -R$R -JX10c/8c -Bxa2Of10dg1O+a-60 -Bya20f5g40+l"Perpendicular Baseline (m)" -BWSne
    # using GAMMA command 'base_calc' to get 'bperp_file'
    gawk '{print ">"}{print $2,$8}{print $3,$9}' bperp_file | gmt plot -W0.3p,black
    gawk '{print ">"}{print $2,$8}{print $3,$9}' bperp_file | gmt plot -Sc0.1 -Gblack
    # supermaster image
    echo 20200826 0 | gmt plot -Sc0.1 -Gred
    # legend
    echo N 1 > legend.txt
    echo S 0.1i c 0.1c red - 0.22i supermaster image >> legend.txt
    gmt legend legend.txt -DjBR+w3.1c+o0c/0c  --FONT_ANNOT_PRIMARY=8p,4
gmt end
rm -rf gmt.*
