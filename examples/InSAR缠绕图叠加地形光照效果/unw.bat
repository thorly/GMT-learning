gmt set MAP_FRAME_TYPE plain
gmt set MAP_FRAME_PEN 1p
gmt set MAP_FRAME_WIDTH 1p
gmt set FONT_ANNOT_PRIMARY 7p,4
gmt set MAP_TICK_LENGTH_PRIMARY 2p/1p
gmt set MAP_ANNOT_OBLIQUE lat_parallel
gmt set FORMAT_GEO_MAP ddd.xxxF

gmt begin unw png
	gmt basemap -JM6c -Rwrap10.grd -Bxa30mf15m -Bya30mf15m -BWSne

	@REM 下载dem
	gmt grdcut @earth_relief_03s.grd -Rwrap10.grd -Gdem.grd
	@REM 将dem采样至与wrap10.grd相同的坐标空间
	gmt grdsample dem.grd -Rwrap10.grd -I4228+n/5309+n -Gdem_re.grd

	gmt grdgradient dem_re.grd -A40 -Ne0.6 -Gdem_re.grad

	gmt makecpt -Cgray -T-16000/7000
	gmt grdimage dem_re.grd -C -Idem_re.grad

	gmt kml2gmt area.kml > area.txt
	@REM 只绘制多边形内的部分
	gmt clip area.txt

	gmt makecpt -Crmg.cpt -T-10/10
	gmt grdimage wrap10.grd -C -Idem_re.grad

	gmt clip -C

	gmt colorbar -C -DjBR+o-0.6c/0.0c+w9.1c/0.4c -Bxa5  --FONT_ANNOT_PRIMARY=6p,4 --MAP_ANNOT_OFFSET_PRIMARY=2p --MAP_FRAME_PEN=0.4p
gmt end
del gmt.*,area.txt, dem.grd, dem_re.grd, dem_re.grad
