gmt set FONT_TITLE 10p,4
gmt set MAP_TITLE_OFFSET 3p
gmt set MAP_FRAME_TYPE plain
gmt set MAP_FRAME_PEN 0.5p
gmt set FONT_ANNOT_PRIMARY 8p,4
gmt set MAP_TICK_LENGTH_PRIMARY 1p
gmt set MAP_TICK_PEN_PRIMARY 0.5p
gmt set MAP_GRID_PEN_PRIMARY 0.5p,black,--
gmt begin profile png
	gmt basemap -JM5c -R113/119/24/31 -Baf -BWSne+t"Jiangxi Province" --MAP_ANNOT_OFFSET_PRIMARY=0p
    gmt grdcut -R113/119/24/31 @earth_relief_01m.grd -Gjiangxi.grd
	gmt grdimage jiangxi.grd -Cdem1 -I+d
	REM 选取测线
	echo 114 30 A > tmp1
	echo 118 25 B >> tmp1
	REM 绘制测线
	gmt plot tmp1 -W0.5p,black
	REM 标注测线端点
	echo 114 30 A | gmt text -F+f8p+jBC -D0.1c/0.2c
	echo 118 25 B | gmt text -F+f8p+jBC -D-0.1c/-0.2c
	REM 沿测线提取特征
	gmt project -C114/30 -E118/25 -G0.05 | gmt grdtrack -Gjiangxi.grd > tmp2
	REM 绘制底图
	gmt basemap -R0/6.2/13/1540 -JX8c/3c -Bxa1f1 -Bya500f250g200 -BWS+t"Profile of AB" -X6c --MAP_FRAME_TYPE=graph
	REM 绘制剖面线并填充颜色
	gmt plot tmp2 -i2,3 -W0.5p,black -Glightblue -L+y-0.1
	REM 标注测线端点位置
	echo 0.15 200 A > tmp3
	echo 6.1 700 B >> tmp3
	gmt text tmp3 -F+f10p+jBC
gmt end
del tmp1, tmp2, tmp3, jiangxi.grd, gmt.*