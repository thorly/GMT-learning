gmt set MAP_FRAME_WIDTH 1p
gmt set FONT_ANNOT_PRIMARY 7p,4
gmt set MAP_TICK_LENGTH_PRIMARY 2p/1p

gmt begin unw png
	gmt basemap -JM6c -Runw_re.grd -Bxa60mf30m -Bya30mf30m -BWSne

	@REM 下载dem
	gmt grdcut @earth_relief_03s.grd -Runw_re.grd -Gdem.grd
	@REM 将dem采样至与unw_re.grd相同的坐标空间
	gmt grdsample dem.grd -Runw_re.grd -I1256+n/1054+n -Gdem_re.grd

	gmt grdgradient dem_re.grd -A40 -Ne0.6 -Gdem_re.grad

	gmt makecpt -Cgray -T-12000/7000/100
	gmt grdimage dem_re.grd -C -Idem_re.grad

	gmt kml2gmt area.kml > area.txt
	@REM 只绘制多边形内的部分
	gmt clip area.txt

	@REM 周期性colorbar
	gmt makecpt -Crainbow -T-3.14/3.14 -Ww
	gmt grdimage unw_re.grd -C -Idem_re.grad

	gmt clip -C

	gmt colorbar -C -DjBR+o-0.3c/0.3c -Bxa3.14 --FONT_ANNOT_PRIMARY=6p,4 --MAP_ANNOT_OFFSET_PRIMARY=2p --MAP_FRAME_PEN=0.4p
gmt end
del gmt.*,area.txt, dem.grd, dem_re.grd, dem_re.grad