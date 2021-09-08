gmt set FONT_ANNOT_PRIMARY 8p,4
gmt set FORMAT_GEO_MAP ddd:mm:ssF
gmt set MAP_FRAME_WIDTH 2p
gmt set MAP_TICK_LENGTH_PRIMARY 1p
gmt set MAP_ANNOT_OBLIQUE lat_parallel 
gmt set MAP_ANNOT_OFFSET_PRIMARY 5.5p

set R="102.47/102.545/29.58/29.635"
gmt begin vel_ts png

    @REM ascending vel
    gmt basemap -JM8c -R%R% -Bxa1mf1m -Bya1mf1m -BWsNe
    
    gmt makecpt -Cgray -T-7000/7000/100 -D
    @REM gmt grdcut -R%R% @earth_relief_01s.grd -Gsmall.grd
    @REM gmt grdgradient small.grd -A40 -Ne0.6 -Gsmall.grad
    gmt grdimage small.grd -C -Ismall.grad

    gmt plot asc_vel.txt -i1,2,3 -Casc_vel.cpt -Sc2.4p

    gmt kml2gmt landslide.kml | gmt plot -W1p,black

    gmt coast -A100000 -I0 -Lg102.5/29.585+c29.585+w1k+u

    gmt kml2gmt 强形变区.kml | gmt plot -W1p,red,-

    echo N 1 > legend.txt
    echo S 0.1i - 0.3c black 1p,black 0.22i 滑坡边界 >> legend.txt
    echo G 0.1c >> legend.txt
    echo S 0.1i - 0.3c red 1p,red,- 0.22i 滑坡强形变区 >> legend.txt
    gmt legend legend.txt -DjBL+w2.5c+o4.25c/0c -F+p0p+gwhite@30  --FONT_ANNOT_PRIMARY=8p,39

    gmt colorbar -DjBR+o0.7c/0.2c+w3c/0.2c -Casc_vel.cpt -Bx10 -By+l"mm/a" -F+gwhite@40+p0p --FONT_ANNOT_PRIMARY=6p,4 --MAP_FRAME_PEN=0.5p
    
    echo 102.542 29.628 -90 | gmt plot -Skcompass/0.6c -W0.6p
    echo 102.542 29.628 N | gmt text -F+f10p,4+jBC -Dj0c/0.4c

    echo 102.473 29.627 a\) | gmt text -F+f10p+jBC -Dj0c/0.6c

    echo 102.476 29.584 103 1 | gmt plot -Sv0.3c+e -W0.5p -Gblack
    echo 102.476 29.584 13 1 | gmt plot -Sv0.3c+e -W0.5p -Gblack
    echo 102.476 29.584 LOS | gmt text -F+f8p+jBL+a13 -Dj0.1c/-0.4c
    echo 102.476 29.584 Flight | gmt text -F+f8p+jBL+a103 -Dj0c/0.2c

    echo 102.522203 29.613494 | gmt plot -St0.2c -Gblack
    echo 102.522203 29.613494 A | gmt text -F+f8p,4+jBC -Dj0c/0.15c
    echo 102.516134 29.612925 | gmt plot -St0.2c -Gblack
    echo 102.516134 29.612925 B | gmt text -F+f8p,4+jBC -Dj0c/0.15c
    echo 102.513809 29.609894 | gmt plot -St0.2c -Gblack
    echo 102.513809 29.609894 C | gmt text -F+f8p,4+jBC -Dj0c/0.15c
    echo 102.500767 29.606945 | gmt plot -St0.2c -Gblack
    echo 102.500767 29.606945 D | gmt text -F+f8p,4+jBC -Dj0c/0.15c
    echo 102.492915 29.594926 | gmt plot -St0.2c -Gblack
    echo 102.492915 29.594926 E | gmt text -F+f8p,4+jBC -Dj0c/0.15c
    

    @REM descending vel
    gmt basemap -JM8c -R%R% -Bxa1mf1m -Bya1mf1m -BwNsE -X8.5c
    
    gmt makecpt -Cgray -T-7000/7000/100 -D

    gmt grdimage small.grd -C -Ismall.grad

    gmt plot des_vel.txt -i1,2,3 -Cdes_vel.cpt -Sc2.4p

    gmt kml2gmt landslide.kml | gmt plot -W1p,black

    gmt coast -A100000 -I0 -Lg102.5/29.585+c29.585+w1k+u

    gmt kml2gmt 强形变区.kml | gmt plot -W1p,red,-

    echo N 1 > legend.txt
    echo S 0.1i - 0.3c black 1p,black 0.22i 滑坡边界 >> legend.txt
    echo G 0.1c >> legend.txt
    echo S 0.1i - 0.3c red 1p,red,- 0.22i 滑坡强形变区 >> legend.txt
    gmt legend legend.txt -DjBL+w2.5c+o4.25c/0c -F+p0p+gwhite@30  --FONT_ANNOT_PRIMARY=8p,39

    gmt colorbar -DjBR+o0.7c/0.2c+w3c/0.2c -Cdes_vel.cpt -Bx10 -By+l"mm/a" -F+gwhite@40+p0p --FONT_ANNOT_PRIMARY=6p,4 --MAP_FRAME_PEN=0.5p
    
    echo 102.542 29.628 -90 | gmt plot -Skcompass/0.6c -W0.6p
    echo 102.542 29.628 N | gmt text -F+f10p,4+jBC -Dj0c/0.4c

    echo 102.473 29.627 b\) | gmt text -F+f10p+jBC -Dj0c/0.6c

    echo 102.4798 29.5885 -103 1 | gmt plot -Sv0.3c+e -W0.5p -Gblack
    echo 102.4798 29.5885 -193 1 | gmt plot -Sv0.3c+e -W0.5p -Gblack
    echo 102.4798 29.5885 LOS | gmt text -F+f8p+jBL+a-13 -Dj-0.5c/0.2c
    echo 102.4798 29.5885 Flight | gmt text -F+f8p+jBL+a-103 -Dj0c/0.2c

    echo 102.522203 29.613494 | gmt plot -St0.2c -Gblack
    echo 102.522203 29.613494 A | gmt text -F+f8p,4+jBC -Dj0c/0.15c
    echo 102.516134 29.612925 | gmt plot -St0.2c -Gblack
    echo 102.516134 29.612925 B | gmt text -F+f8p,4+jBC -Dj0c/0.15c
    echo 102.510025 29.608948 | gmt plot -St0.2c -Gblack
    echo 102.510025 29.608948 F | gmt text -F+f8p,4+jBC -Dj0c/0.15c
    echo 102.500767 29.606945 | gmt plot -St0.2c -Gblack
    echo 102.500767 29.606945 D | gmt text -F+f8p,4+jBC -Dj0c/0.15c
    echo 102.492915 29.594926 | gmt plot -St0.2c -Gblack
    echo 102.492915 29.594926 E | gmt text -F+f8p,4+jBC -Dj0c/0.15c


    gmt set FORMAT_DATE_MAP "yyyy-mm-dd"
    gmt set FORMAT_TIME_PRIMARY_MAP Abbreviated
    gmt set FORMAT_DATE_IN "yyyymmdd"
    gmt set MAP_FRAME_PEN 0.5p
    gmt set FONT_ANNOT_PRIMARY 8p,4
    gmt set MAP_TICK_LENGTH_PRIMARY -3p
    gmt set FONT_LABEL 8p,4
    gmt set MAP_GRID_PEN_PRIMARY 0.1p,gray,-
    gmt set FONT_TITLE 14p,4
    gmt set MAP_LABEL_OFFSET 5p
    gmt set MAP_ANNOT_ORTHO Z

    @REM ascending ts

    set R="2016-12T/2021-2T/-20/160"
    gmt basemap -X-8.5c -Y-6.5c -R%R% -JX8c/6c -Bxa12Of30dg3O+a-30 -Bya20f20g20+l"@%%39%%累计形变量 @%%4%%(mm)" -BWSne
    
    gmt plot A-asc.txt -Sc0.1 -Gblack
    gmt plot B-asc.txt -Sc0.1 -Gred
    gmt plot C-asc.txt -Sc0.1 -Gblue
    gmt plot D-asc.txt -Sc0.1 -Ggreen
    gmt plot E-asc.txt -Sc0.1 -Gpurple

    echo 20170210 145 c\) | gmt text -F+f10p+jBC -Dj0c/0c

    echo N 1 > legend.txt
    echo S 0.1i c 0.1c black 1p,black 0.22i A >> legend.txt
    echo S 0.1i c 0.1c red 1p,red 0.22i B >> legend.txt
    echo S 0.1i c 0.1c green 1p,green 0.22i D >> legend.txt
    echo S 0.1i c 0.1c purple 1p,purple 0.22i E >> legend.txt
    echo S 0.1i c 0.1c blue 1p,blue 0.22i C@%%39%%（最大形变点） >> legend.txt
    gmt legend legend.txt -DjTL+w2.5c+o0c/1c  --FONT_ANNOT_PRIMARY=8p,4

    @REM descending ts
    set R="2016-12T/2021-2T/-260/40"
    gmt basemap -X8.5c -R%R% -JX8c/6c -Bxa12Of30dg3O+a-30 -Bya40f20g40+l"@%%39%%累计形变量 @%%4%%(mm)" -BwSnE
    
    gmt plot A-des.txt -Sc0.1 -Gblack
    gmt plot B-des.txt -Sc0.1 -Gred
    gmt plot F-des.txt -Sc0.1 -Gblue
    gmt plot D-des.txt -Sc0.1 -Ggreen
    gmt plot E-des.txt -Sc0.1 -Gpurple

    echo 20170210 16 d\) | gmt text -F+f10p+jBC -Dj0c/0c

    echo N 1 > legend.txt
    echo S 0.1i c 0.1c black 1p,black 0.22i A >> legend.txt
    echo S 0.1i c 0.1c red 1p,red 0.22i B >> legend.txt
    echo S 0.1i c 0.1c green 1p,green 0.22i D >> legend.txt
    echo S 0.1i c 0.1c purple 1p,purple 0.22i E >> legend.txt
    echo S 0.1i c 0.1c blue 1p,blue 0.22i F@%%39%%（最大形变点） >> legend.txt
    gmt legend legend.txt -DjBL+w2.5c+o0.3c/0.3c  --FONT_ANNOT_PRIMARY=8p,39

gmt end

del gmt.conf