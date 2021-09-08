gmt set FORMAT_DATE_MAP "yyyy-mm-dd"
gmt set FORMAT_TIME_PRIMARY_MAP Abbreviated
gmt set FORMAT_DATE_IN "yyyymmdd"
gmt set MAP_FRAME_PEN 0.5p
gmt set FONT_ANNOT_PRIMARY 10p,4
gmt set MAP_TICK_LENGTH_PRIMARY -3p
gmt set FONT_LABEL 10p,4
gmt set MAP_GRID_PEN_PRIMARY 0.1p,gray,-
gmt set MAP_LABEL_OFFSET 5p
gmt set MAP_ANNOT_OFFSET_PRIMARY 5.5p
gmt set MAP_ANNOT_ORTHO Z
gmt set MAP_ANNOT_OBLIQUE lat_parallel 

gmt begin
    gmt figure river png A0.1c

    set R="102.47/102.545/29.58/29.635"
    gmt basemap -JM9.4c -R%R% -Bxa1mf1m -Bya1mf1m -BWSne -X13.8c

    gmt grdimage hy.tif

    gmt plot landslide.txt -W1p,black

    gmt plot xushuichi.gmt -St0.1c -W1p,red

    gmt plot 坡体内部小河流.gmt -W1p,cyan

    gmt kml2gmt 流沙河.kml | gmt plot  -W1p,blue

    echo 102.542 29.628 -90 | gmt plot -Skcompass/0.6c -W0.6p
    echo 102.542 29.628 N | gmt text -F+f10p,4+jBC -Dj0c/0.4c

    gmt coast -A100000 -I0 -Lg102.505/29.585+c29.585+w1k+u

    echo 102.473 29.627 b\) | gmt text -F+f10p+jBC -Dj0c/0.6c

    echo N 1 > legend.txt
    echo S 0.1i t 0.1c red 1p,red 0.22i 蓄水池位置 >> legend.txt
    echo G 0.1c >> legend.txt
    echo S 0.1i - 0.3c black 1p,black 0.22i 滑坡边界 >> legend.txt
    echo G 0.1c >> legend.txt
    echo S 0.1i - 0.3c black 1p,blue 0.22i 流沙河 >> legend.txt
    echo G 0.1c >> legend.txt
    echo S 0.1i - 0.3c black 1p,cyan 0.22i 坡体内部小河流 >> legend.txt
    gmt legend legend.txt -DjBR+w3c+o0c/0c -F+p0.1p+gwhite@40  --FONT_ANNOT_PRIMARY=8p,39
gmt end
del gmt.conf