gmt set FONT_ANNOT_PRIMARY 8p,4
gmt set FORMAT_GEO_MAP ddd.xxF
gmt set MAP_FRAME_TYPE plain
gmt set MAP_FRAME_PEN 0.5p
gmt set MAP_TICK_LENGTH_PRIMARY 1p
gmt set MAP_ANNOT_OBLIQUE lat_parallel
gmt set PS_CHAR_ENCODING Standard+

gmt begin coverage png
    set R="123.1/124.4/41.1/42.1"
    gmt basemap -JM8c -R%R% -Bxa20mf20m -Bya20mf20m -BWSne

    @REM gmt grdcut @earth_relief_03s.grd -R%R% -Gdem.grd
    gmt grdgradient dem.grd -A40 -Ne0.6 -Gdem.grad
    gmt makecpt -Cgray -T-7000/2000
    gmt grdimage dem.grd -C -Idem.grad

    gmt basemap -JM8c -R%R% -Bxa20mf20m -Bya20mf20m -BWSne
    
    gmt kml2gmt alos.kml > alos.txt
    gmt plot alos.txt -W1p,blue,-
    echo 123.84 41.825 > area
    echo 123.84 41.858 >> area
    echo 123.93 41.858 >> area
    echo 123.93 41.825 >> area
    gmt plot area -W0.5p,red -L

    echo 124.34 41.98 -90 | gmt plot -Skcompass/0.8c -W0.6p
    echo 124.34 41.98 N | gmt text -F+f12p,4+jBC -Dj0c/0.5c

    echo 123.67 41.21 ALOS  PALSAR | gmt text -F+f12p,4+a10


    gmt inset begin -DjTL+w2c+o0c/0c -F+gwhite+p0.5p
        set R2="118.5/126/38/44"
        gmt plot -R%R2% -JM? liaoning.gmt -W0.3p,black
        @REM gmt plot fushun.gmt -W0.5p,black
        echo 121.5 41.5 ÁÉÄþÊ¡ | gmt text -F+f6p,39
        echo 123.1 41.1 > area
        echo 123.1 42.1 >> area
        echo 124.4 42.1 >> area
        echo 124.4 41.1 >> area
        gmt plot area -W0.5p,black -L
    gmt inset end


    set R3="123.84/123.93/41.825/41.858"
    gmt basemap -R%R3% -JM8c -Bxa2mf1m -Bya1mf30s -BSwEn -X8.3c
    gmt grdimage optical.tif
    gmt basemap -R%R3% -JM8c -Bxa2mf1m -Bya1mf30s -BSwEn

    @REM gmt grdcut @earth_relief_01s.grd -R%R3% -Gdem_small.grd
    gmt makecpt -Crainbow -T-330/222
    gmt grdimage -R%R3% -JM8c -Bxa2mf1m -Bya1mf30s -BswEn dem_small.grd -C -I+d -Y4.28c
    gmt coast -A100000 -I0 -Lg123.922/41.8285+c41.8285+w1k+u
    gmt colorbar -DjCL+o0.12c/-0.1c+w3.5c/0.2c  -C -Bx100 -By+l"m" --FONT_ANNOT_PRIMARY=6p,4 --MAP_FRAME_PEN=0.5p

gmt end

del gmt.*,area,alos.txt, dem.grad