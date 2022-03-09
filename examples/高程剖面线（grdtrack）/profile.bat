gmt set FONT_TITLE 10p,4
gmt set MAP_TITLE_OFFSET 1p
gmt set MAP_FRAME_TYPE plain
gmt set MAP_FRAME_PEN 0.7p
gmt set FONT_ANNOT_PRIMARY 8p,4
gmt set MAP_TICK_LENGTH_PRIMARY 1p
gmt set MAP_TICK_PEN_PRIMARY 0.5p

gmt begin profile png

	set R="113/119/24/31"
	gmt basemap -JM5c -R%R% -Baf -BWSne+t"Jiangxi Province"
	gmt grdcut -R%R% @earth_relief_01m.grd -Gjiangxi.grd
	gmt grdimage jiangxi.grd -Cdem2 -I+d

	REM 选取测线
	echo 114 30 A > tmp1
	echo 118 25 B >> tmp1

	REM 绘制测线
	gmt plot tmp1 -W0.5p,black

	REM 标注测线端点
	echo 114 30 A | gmt text -F+f8p -D0.1c/0.2c -Gwhite
	echo 118 25 B | gmt text -F+f8p -D0c/-0.2c -Gwhite

	REM 沿测线提取特征
	gmt project -C114/30 -E118/25 -G0.1 -Q | gmt grdtrack -Gjiangxi.grd > tmp2

	REM 绘制底图
	gmt basemap -R0/682/-100/2000 -JX8c/5c -Bxa100f50 -Bya500f250 -BWSne+t"Profile of AB" -X6c

	REM 绘制剖面线并填充颜色
	gmt plot tmp2 -i2,3 -W0.5p,black

	REM 标注测线端点位置
	echo 25 500 A > tmp3
	echo 670 1000 B >> tmp3
	gmt text tmp3 -F+f10p,4

gmt end
del tmp*, jiangxi.grd, gmt.*