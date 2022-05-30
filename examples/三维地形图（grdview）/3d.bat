gmt set MAP_FRAME_TYPE plain
gmt set MAP_FRAME_PEN 0.5p
gmt set FONT_ANNOT_PRIMARY 7p,4
gmt set MAP_TICK_LENGTH_PRIMARY 2p/1p
@REM gmt set MAP_ANNOT_OBLIQUE lat_parallel
gmt set FORMAT_GEO_MAP ddd.xxxF

gmt begin 3d png
    set R="103.42/103.48/31.52/31.57/0/4000"
    set R2="103.42/103.48/31.52/31.57"
    set p="20/40"
    gmt basemap -JM8c -JZ3c -R%R% -Bxaf -Byaf -BwsNEZ -Bza1000f500 -p%p%

    @REM gmt grdcut -R%R2% dem_big.grd -Gdem.grd
    @REM gmt grdcut -R%R2% @earth_relief_01s.grd -Gdem.grd

    gmt makecpt -Cgray -T-5000/4000
    gmt grdview dem.grd -p%p% -R%R% -Gdem.grd -Qi600 -C -I+d -N0+ggray -W0.5p

    gmt makecpt -Crainbow -T-112/112 -Iz
    gmt grdview dem.grd -p%p% -R%R% -Gdisp_asc.grd -Qc600 -C -I+d

    gmt project -C103.42/31.52 -E103.48/31.52 -G0.01 -Q | gmt grdtrack -Gdem.grd | gmt plot3d -i0,1,3 -p%p% -W0.5p
    gmt project -C103.42/31.52 -E103.42/31.57 -G0.01 -Q | gmt grdtrack -Gdem.grd | gmt plot3d -i0,1,3 -p%p% -W0.5p

    gmt colorbar -DjBL+o1c/-0.6c+w8c/0.2c+h -Bx20 -By+l"mm/a" -C

    gmt coast -Da -A100000 -Ia -Tdg103.418/31.515+w2c+l -p%p% --FONT_TITLE=12p,4
    gmt coast -Da -A100000 -Ia -Lg103.418/31.515+w1k+o8c/0.97c --FONT_TITLE=12p,4

gmt end
del gmt.*,tmp
