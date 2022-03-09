gmt set MAP_FRAME_TYPE plain
gmt set MAP_FRAME_PEN 0.5p
gmt set MAP_FRAME_WIDTH 1p
gmt set FONT_ANNOT_PRIMARY 7p,4
gmt set MAP_TICK_LENGTH_PRIMARY 2p/1p
@REM gmt set MAP_ANNOT_OBLIQUE lat_parallel
gmt set FORMAT_GEO_MAP ddd.xxxF

gmt begin 3d png
	set R="123.8316143/123.9374650/41.8203914/41.8599379/-350/250"
	set p="30/40"
	gmt basemap -JM8c -JZ1c -R%R% -Baf -BwsNEZ -Bzaf -p%p%

	gmt grdview dem.grd -p%p% -R%R% -Goptical.tif -Qi600
	@REM gmt grdview dem.grd -p%p% -R%R% -Goptical.tif -Qi600 -N-350+ggray
gmt end
del gmt.*
