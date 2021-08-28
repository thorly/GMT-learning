gmt set FONT_ANNOT_PRIMARY 8p,4
gmt set FORMAT_GEO_MAP ddd:mm:ssF
gmt set MAP_FRAME_WIDTH 2p
gmt set MAP_TICK_LENGTH_PRIMARY 1p
gmt set MAP_ANNOT_OBLIQUE lat_parallel 
gmt set PS_CHAR_ENCODING Standard+

set R="101.7/103.4/28.5/30"
gmt begin coverage png
    gmt basemap -JM8c -R%R% -Bxa20mf10m -Bya20mf10m -BWSne
    @REM gmt grdcut @earth_relief_03s.grd -R%R% -Ghy.grd
    @REM gmt grdgradient hy.grd -A40 -Ne0.6 -Ghy.grad
    gmt makecpt -Cdem3 -T89/6757/10 -D
    gmt grdimage hy.grd -C -Ihy.grad

    gmt plot hanyuan.txt -W1p,black
    gmt plot asc.txt -W1p,blue,-
    gmt plot des.txt -W1p,red,-

    echo 102.502880 29.610738 | gmt plot -Sa0.3c -W1p,red -Gred

    echo 103.3 29.82 -90 | gmt plot -Skcompass/0.8c -W0.6p
    echo 103.3 29.82 N | gmt text -F+f12p,4+jBC -Dj+o0c/0.5c

    echo N 1 > legend.txt
    echo S 0.1i a 0.3c red 1p,red 0.3i º£æÃ´å»¬ÆÂ >> legend.txt
    echo G 0.1 >> legend.txt
    echo S 0.1i - 0.15i - 0.5p,black 0.3i ººÔ´ÏØ >> legend.txt
    echo G 0.1 >> legend.txt
    echo S 0.1i - 0.15i - 0.5p,blue,- 0.3i  Éý¹ìÓ°Ïñ¸²¸Ç·¶Î§ >> legend.txt
    echo G 0.1 >> legend.txt
    echo S 0.1i - 0.15i - 0.5p,red,- 0.3i  ½µ¹ìÓ°Ïñ¸²¸Ç·¶Î§ >> legend.txt
    gmt legend legend.txt -DjBR+w3.4c+o0c/0c -F+p0p+gwhite@30  --FONT_ANNOT_PRIMARY=8p,39
    

    @REM Ð¡Í¼
    set R2="96/110/25/35"
    gmt set MAP_FRAME_TYPE plain
    gmt set MAP_FRAME_PEN 1p
    gmt set MAP_TICK_LENGTH_PRIMARY 0p
    gmt basemap -R%R2% -JM2.8c -Baf -Bwsne
    @REM gmt grdcut -R%R2% @earth_relief_01m.grd -Gbig.grd
    gmt grdimage big.grd -C
    gmt plot sc.txt -W0.5p,51/153/51
    gmt plot hanyuan.txt -W0.3p,black
    echo 103 32 ËÄ´¨Ê¡ | gmt text -F+f8p,39
    gmt colorbar -DjBR+o-0.3c/0.04c+w2c/0.2c -C -Bx1000 -By+l"m" --FONT_ANNOT_PRIMARY=6p,4 --MAP_FRAME_PEN=0.5p

gmt end

del gmt.*,legend.txt