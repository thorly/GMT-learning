@REM ##############################################
@REM # plot baseline network using GMT and GAMMA  #
@REM # Copyright (c) 2021, Lei Yuan               #
@REM ##############################################

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

set R="2019-12T/2021-2T/-120/80"

gmt begin
    gmt figure baseline_with_coherence png
        gmt basemap -R%R% -JX10c/8c -Bxa2Of10dg1O+a-60 -Bya20f5g40+l"Perpendicular Baseline (m)" -BWSne

        gmt makecpt -Chot -I -T0/1
        gmt plot baseline_with_coherence -W0.3p,black -C
        gmt plot baseline_with_coherence -Sc0.1 -Gblack
        echo 20200826 0 | gmt plot -Sc0.1 -Gred
        gmt colorbar -C -DjBR+w8c/0.3c+o-0.5c/0c -Bx1

        echo N 1 > legend.txt
        echo S 0.1i c 0.1c red - 0.22i supermaster image >> legend.txt
        gmt legend legend.txt -DjBR+w3.1c+o0c/0c  --FONT_ANNOT_PRIMARY=8p,4

    gmt figure baseline png
        gmt basemap -R%R% -JX10c/8c -Bxa2Of10dg1O+a-60 -Bya20f5g40+l"Perpendicular Baseline (m)" -BWSne

        gmt plot baseline -W0.3p,black
        gmt plot baseline -Sc0.1 -Gblack
        echo 20200826 0 | gmt plot -Sc0.1 -Gred

        echo N 1 > legend.txt
        echo S 0.1i c 0.1c red - 0.22i supermaster image >> legend.txt
        gmt legend legend.txt -DjBR+w3.1c+o0c/0c  --FONT_ANNOT_PRIMARY=8p,4

gmt end
del gmt.*,legend.txt
